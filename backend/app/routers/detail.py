# backend/app/routers/detail.py

from pathlib import Path
from fastapi import APIRouter, Request, HTTPException, Depends
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates

from app.database.connection import get_db

BASE_DIR = Path(__file__).resolve().parents[3]
TEMPLATES_DIR = BASE_DIR / "frontend" / "templates"

templates = Jinja2Templates(directory=str(TEMPLATES_DIR))
router = APIRouter()


# ============================================================
# PAGE DETAIL (HTML)
# ============================================================
@router.get("/detail", response_class=HTMLResponse)
async def detail_page(request: Request):
    return templates.TemplateResponse("PageDetailSeries.html", {"request": request})


# ============================================================
# API DETAIL SERIE (JSON)
# ============================================================
@router.get("/api/series/{id}")
async def api_series_detail(id: int, db = Depends(get_db)):

    cur = db.cursor()

    # ---------------------------
    # 1) Série principale
    # ---------------------------
    q_serie = """
        SELECT id_serie, titre, date_sortie, description, image
        FROM serie
        WHERE id_serie = %(id)s;
    """
    cur.execute(q_serie, {"id": id})
    serie = cur.fetchone()

    if not serie:
        cur.close()
        raise HTTPException(404, "Série introuvable")

    # ---------------------------
    # 2) Genres (posseder + genre)
    # ---------------------------
    q_genres = """
        SELECT g.libelle
        FROM posseder p
        JOIN genre g ON g.id_genre = p.id_genre
        WHERE p.id_serie = %(id)s;
    """
    cur.execute(q_genres, {"id": id})
    genres = [row["libelle"] for row in cur.fetchall()] or []

    # ---------------------------
    # 3) Prix (recevoir + prix)
    # ---------------------------
    q_prix = """
        SELECT pr.libelle
        FROM recevoir r
        JOIN prix pr ON pr.id_prix = r.id_prix
        WHERE r.id_serie = %(id)s;
    """
    cur.execute(q_prix, {"id": id})
    prix = [{"libelle": row["libelle"]} for row in cur.fetchall()] or []

    # ---------------------------
    # 4) Personnes (createurs / realisateurs / acteurs)
    # ---------------------------
    q_personnes = """
        SELECT pe.prenom, pe.nom, ro.libelle AS role
        FROM participer pa
        JOIN personne pe ON pe.id_personne = pa.id_personne
        JOIN jouer j ON j.id_personne = pe.id_personne
        JOIN role ro ON ro.id_role = j.id_role
        WHERE pa.id_serie = %(id)s;
    """
    cur.execute(q_personnes, {"id": id})
    personnes = cur.fetchall()

    createurs = []
    realisateurs = []
    acteurs = []

    for p in personnes:
        if p["role"] == "Créateur":
            createurs.append({"prenom": p["prenom"], "nom": p["nom"]})
        elif p["role"] == "Réalisateur":
            realisateurs.append({"prenom": p["prenom"], "nom": p["nom"]})
        elif p["role"] == "Acteur Principal":
            acteurs.append({"prenom": p["prenom"], "nom": p["nom"]})

    # valeurs par défaut si aucun résultat
    createurs = createurs or []
    realisateurs = realisateurs or []
    acteurs = acteurs or []

    # ---------------------------
    # 5) Saisons + épisodes
    # ---------------------------
    q_saisons = """
        SELECT id_saison, numero, description
        FROM saison
        WHERE id_serie = %(id)s
        ORDER BY numero;
    """
    cur.execute(q_saisons, {"id": id})
    saisons = cur.fetchall()

    saisons_format = []

    for s in saisons:
        q_ep = """
            SELECT id_episode, numero, duree
            FROM episode
            WHERE id_saison = %(sid)s
            ORDER BY numero;
        """
        cur.execute(q_ep, {"sid": s["id_saison"]})
        episodes = cur.fetchall()

        saisons_format.append({
            "id_saison": s["id_saison"],
            "numero": s["numero"],
            "description": s.get("description") or "Aucune description",
            "episodes": [
                {
                    "id_episode": e["id_episode"],
                    "numero": e["numero"],
                    "duree": e.get("duree") or "Durée inconnue"
                }
                for e in episodes
            ] or []
        })

    cur.close()

    # ---------------------------
    # 6) JSON FINAL (compatible detail.js)
    # ---------------------------
    return {
        "id_serie": serie["id_serie"],
        "titre": serie["titre"],
        "date_sortie": str(serie["date_sortie"]),
        "description": serie["description"] or "",
        "image": serie["image"] or "default.jpg",
        "genres": genres,
        "prix": prix,
        "createurs": createurs,
        "realisateurs": realisateurs,
        "acteurs": acteurs,
        "saisons": saisons_format
    }
