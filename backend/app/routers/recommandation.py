# backend/app/routers/recommandation.py
from fastapi import APIRouter, Request, HTTPException, Depends
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from pathlib import Path
from typing import Dict, Tuple, List, Set
import math
import time

from app.database.connection import get_db  # ton dependency qui renvoie une connexion/cursor utilisable

router = APIRouter()

# -----------------------------
# Localisation des templates
# -----------------------------
BASE_DIR = Path(__file__).resolve().parents[3]
TEMPLATES_DIR = BASE_DIR / "frontend" / "templates"
templates = Jinja2Templates(directory=str(TEMPLATES_DIR))


# -----------------------------
# PAGE HTML (unchanged)
# -----------------------------
@router.get("/recommandation", response_class=HTMLResponse)
async def recommandation_page(request: Request):
    return templates.TemplateResponse("PageRecommandation.html", {"request": request})


# -----------------------------
# ENDPOINTS PUBLICS (unchanged logic)
# -----------------------------
@router.get("/recommendations/public")
def public_reco():
    return {
        "top_rated": top_rated(),
        "awards": awards(),
        "trending": trending()
    }


@router.get("/recommendations/top_rated")
def top_rated(db = Depends(get_db)):
    cur = db.cursor()
    cur.execute("""
        SELECT s.id_serie, s.titre, AVG(n.score) AS note_moyenne
        FROM serie s
        JOIN noter n ON s.id_serie = n.id_serie
        GROUP BY s.id_serie, s.titre
        ORDER BY note_moyenne DESC
        LIMIT 12;
    """)
    rows = cur.fetchall()
    cur.close()
    # rows may be dict-like or tuple-like; handle both
    result = []
    for r in rows:
        if isinstance(r, dict):
            result.append({"id_serie": r["id_serie"], "serie": r["titre"]})
        else:
            result.append({"id_serie": r[0], "serie": r[1]})
    return result


@router.get("/recommendations/awards")
def awards(db = Depends(get_db)):
    cur = db.cursor()
    cur.execute("""
        SELECT 
            s.id_serie, s.titre,
            SUBSTRING(p.libelle FROM '([0-9]+)\\s*win[s]?')::int AS nb_wins
        FROM prix p
        JOIN recevoir r ON r.id_prix = p.id_prix
        JOIN serie s ON r.id_serie = s.id_serie
        WHERE SUBSTRING(p.libelle FROM '([0-9]+)\\s*win[s]?')::int IS NOT NULL
        ORDER BY nb_wins DESC
        LIMIT 12;
    """)
    rows = cur.fetchall()
    cur.close()
    result = []
    for r in rows:
        if isinstance(r, dict):
            result.append({"id_serie": r["id_serie"], "serie": r["titre"]})
        else:
            result.append({"id_serie": r[0], "serie": r[1]})
    return result


@router.get("/recommendations/trending")
def trending(db = Depends(get_db)):
    cur = db.cursor()
    cur.execute("""
        SELECT
            s.id_serie, 
            s.titre,
            SUBSTRING(p.libelle FROM '([0-9]+)\\s*nomination[s]?')::int AS nb_nom
        FROM prix p
        JOIN recevoir r ON r.id_prix = p.id_prix
        JOIN serie s ON r.id_serie = s.id_serie
        WHERE SUBSTRING(p.libelle FROM '([0-9]+)\\s*nomination[s]?')::int IS NOT NULL
        ORDER BY nb_nom DESC
        LIMIT 12;
    """)
    rows = cur.fetchall()
    cur.close()
    result = []
    for r in rows:
        if isinstance(r, dict):
            result.append({"id_serie": r["id_serie"], "serie": r["titre"]})
        else:
            result.append({"id_serie": r[0], "serie": r[1]})
    return result


# -----------------------------
# CHARGEMENT OPTIMISÉ DES MOTS-CLÉS (TF-IDF) - UNE FOIS AU DEMARRAGE
# -----------------------------
# On charge la table mot_cle + decrire en mémoire et on pré-calcul les normes L2
# Structure:
#   KEYWORDS: Dict[int, Dict[str, float]]  # id_serie -> {mot: poids}
#   SERIES_NORMS: Dict[int, float]         # id_serie -> l2_norm

def load_keywords_and_norms(db_conn) -> Tuple[Dict[int, Dict[str, float]], Dict[int, float]]:
    cur = db_conn.cursor()
    cur.execute("""
        SELECT s.id_serie, mc.libelle, mc.poids
        FROM mot_cle mc
        JOIN decrire d ON d.id_mot_cle = mc.id_mot_cle
        JOIN serie s ON s.id_serie = d.id_serie
    """)
    rows = cur.fetchall()
    cur.close()

    keywords: Dict[int, Dict[str, float]] = {}
    for row in rows:
        # row could be tuple or dict
        if isinstance(row, dict):
            sid, mot, poids = row["id_serie"], row["libelle"], float(row["poids"])
        else:
            sid, mot, poids = int(row[0]), row[1], float(row[2])

        if sid not in keywords:
            keywords[sid] = {}
        keywords[sid][mot] = poids

    # Precompute norms
    norms: Dict[int, float] = {}
    for sid, vec in keywords.items():
        ssum = 0.0
        for val in vec.values():
            ssum += val * val
        norms[sid] = math.sqrt(ssum) if ssum > 0 else 0.0

    return keywords, norms

# Utilise une connexion simple au démarrage via get_db
# Comme get_db est une dependency, on crée une connexion temporaire ici:
try:
    # attempt to get a DB connection via get_db (callable)
    _db_for_init = next(get_db())
    KEYWORDS, SERIES_NORMS = load_keywords_and_norms(_db_for_init)
    # close the init connection cursor/conn as get_db yields a session
    try:
        _db_for_init.close()
    except Exception:
        pass
except Exception:
    # fallback: lazy load at first request
    KEYWORDS = {}
    SERIES_NORMS = {}

# -----------------------------
# UTIL: build profile and cosine util (optimized)
# -----------------------------
def build_user_profile(series_rated: List[Tuple[int, int]],
                       series_searched: List[int],
                       keyword_weights: Dict[int, Dict[str, float]]) -> Dict[str, float]:
    profile: Dict[str, float] = {}
    WEIGHT_SEARCH = 1.0

    # searches
    for sid in series_searched:
        vec = keyword_weights.get(sid)
        if not vec:
            continue
        for word, w in vec.items():
            profile[word] = profile.get(word, 0.0) + w * WEIGHT_SEARCH

    # ratings: list of (id_serie, score)
    for sid, rating in series_rated:
        vec = keyword_weights.get(sid)
        if not vec:
            continue
        for word, w in vec.items():
            profile[word] = profile.get(word, 0.0) + w * float(rating)

    return profile


def profile_norm(profile: Dict[str, float]) -> float:
    ssum = 0.0
    for v in profile.values():
        ssum += v * v
    return math.sqrt(ssum) if ssum > 0 else 0.0


def cosine_similarity_dict(profile: Dict[str, float],
                           series_vec: Dict[str, float],
                           norm_profile: float,
                           norm_series: float) -> float:
    if norm_profile == 0 or norm_series == 0:
        return 0.0
    # iterate over smaller dict for speed
    if len(profile) < len(series_vec):
        small_items = profile.items()
        return sum(profile[k] * series_vec.get(k, 0.0) for k, _ in small_items) / (norm_profile * norm_series)
    else:
        return sum(series_vec[k] * profile.get(k, 0.0) for k in series_vec.keys()) / (norm_profile * norm_series)


# -----------------------------
# HISTORIQUE UTILISATEUR (fix SQL to use id_user properly)
# -----------------------------
def get_user_history(identifiant: str, db = Depends(get_db)) -> Tuple[List[int], List[Tuple[int, int]]]:
    cur = db.cursor()

    cur.execute("""
        SELECT id_utilisateur
        FROM utilisateur
        WHERE identifiant = %s
    """, (identifiant,))
    row = cur.fetchone()
    if not row:
        cur.close()
        return None

    # depending on cursor type, get id_user
    id_user = row[0] if not isinstance(row, dict) else row["id_utilisateur"]

    # recherches (ids)
    cur.execute("""
        SELECT DISTINCT id_serie
        FROM historique_recherche
        WHERE id_utilisateur = %s
        ORDER BY id_serie
    """, (id_user,))
    searched_rows = cur.fetchall()
    searched = [r[0] if not isinstance(r, dict) else r["id_serie"] for r in searched_rows]

    # notes (id_serie, score)
    cur.execute("""
        SELECT id_serie, score
        FROM noter
        WHERE id_utilisateur = %s
    """, (id_user,))
    rated_rows = cur.fetchall()
    rated = []
    for r in rated_rows:
        if isinstance(r, dict):
            rated.append((r["id_serie"], int(r["score"])))
        else:
            rated.append((int(r[0]), int(r[1])))

    cur.close()
    return searched, rated


# -----------------------------
# RECOMMENDATION (optimized)
# -----------------------------
def recommend_from_user_profile(profile: Dict[str, float],
                                keyword_weights: Dict[int, Dict[str, float]],
                                series_norms: Dict[int, float],
                                exclude_ids: Set[int],
                                top_k: int = 12) -> List[Tuple[int, float]]:

    # if profile empty, return empty list (caller will fallback)
    if not profile:
        return []

    norm_p = profile_norm(profile)
    scores: List[Tuple[int, float]] = []

    # iterate over series vectors
    for sid, vec in keyword_weights.items():
        if sid in exclude_ids:
            continue
        norm_s = series_norms.get(sid, 0.0)
        if norm_s == 0.0:
            continue
        sim = cosine_similarity_dict(profile, vec, norm_p, norm_s)
        if sim > 0:
            scores.append((sid, sim))
    # sort and return top_k
    scores.sort(key=lambda x: x[1], reverse=True)
    return scores[:top_k]


@router.get("/recommendations/user/{identifiant}")
def recommend_user(identifiant: str, db = Depends(get_db)):
    start = time.time()

    # lazy load keywords if not loaded at startup
    global KEYWORDS, SERIES_NORMS
    if not KEYWORDS:
        try:
            KEYWORDS, SERIES_NORMS = load_keywords_and_norms(db)
        except Exception:
            KEYWORDS = {}
            SERIES_NORMS = {}

    history = get_user_history(identifiant, db)
    if not history:
        raise HTTPException(status_code=404, detail="Utilisateur introuvable")

    searched, rated = history

    profile = build_user_profile(series_rated=rated,
                                 series_searched=searched,
                                 keyword_weights=KEYWORDS)

    # if profile empty -> fallback to public reco
    if not profile:
        # measure
        elapsed = time.time() - start
        print(f"[RECO] user={identifiant} -> profile empty, fallback to public ({elapsed:.3f}s)")
        return public_reco()

    exclude_ids = set(searched) | {sid for sid, _ in rated}

    recs = recommend_from_user_profile(profile, KEYWORDS, SERIES_NORMS, exclude_ids=exclude_ids, top_k=12)

    # If no recommendations (e.g. sparse keywords), fallback to public
    if not recs:
        elapsed = time.time() - start
        print(f"[RECO] user={identifiant} -> no recs from profile, fallback ({elapsed:.3f}s)")
        return public_reco()

    # Bulk fetch titles for the recommended ids
    rec_ids = [sid for sid, _ in recs]
    cur = db.cursor()
    # Use IN clause safely
    placeholders = ",".join(["%s"] * len(rec_ids))
    cur.execute(f"SELECT id_serie, titre FROM serie WHERE id_serie IN ({placeholders})", tuple(rec_ids))
    title_rows = cur.fetchall()
    cur.close()

    # Map id->titre
    titles = {}
    for r in title_rows:
        if isinstance(r, dict):
            titles[r["id_serie"]] = r["titre"]
        else:
            titles[int(r[0])] = r[1]

    # prepare result preserving order of recs
    results = []
    for sid, score in recs:
        results.append({
            "id_serie": sid,
            "similarite": float(score),
            "titre": titles.get(sid, "Titre inconnu")
        })

    elapsed = time.time() - start
    print(f"[RECO] user={identifiant} -> returned {len(results)} recs in {elapsed:.3f}s")
    return results
