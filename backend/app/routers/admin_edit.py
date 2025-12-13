from fastapi import APIRouter, Request, HTTPException, Depends
from fastapi.responses import HTMLResponse
from pathlib import Path
from fastapi.templating import Jinja2Templates
from app.database.connection import get_db

router = APIRouter()

# TEMPLATES
BASE_DIR = Path(__file__).resolve().parents[3]
TEMPLATES_DIR = BASE_DIR / "frontend" / "templates"
templates = Jinja2Templates(directory=str(TEMPLATES_DIR))


# PAGE HTML /admin/serie/{id}
@router.get("/admin/serie/{id_serie}", response_class=HTMLResponse)
def admin_edit_page(id_serie: int, request: Request):
    return templates.TemplateResponse("PageEditSeries.html", {"request": request})


# API : récupérer une série complète
@router.get("/api/admin/series/{id_serie}")
def api_get_one_series(id_serie: int, db=Depends(get_db)):

    cur = db.cursor()

    #  INFO DE BASE 
    cur.execute("""
        SELECT id_serie, titre, description, date_sortie, image
        FROM serie
        WHERE id_serie = %s
    """, (id_serie,))
    serie = cur.fetchone()

    if not serie:
        raise HTTPException(404, "Série introuvable")

    # GENRES
    cur.execute("""
        SELECT g.libelle
        FROM genre g
        JOIN posseder p ON p.id_genre = g.id_genre
        WHERE p.id_serie = %s
    """, (id_serie,))
    genres = [r["libelle"] for r in cur.fetchall()]

    # ROLES (créateur, réalisateur, acteur)
    cur.execute("""
        SELECT pe.prenom, pe.nom, ro.libelle AS role
        FROM personne pe
        JOIN participer pa ON pa.id_personne = pe.id_personne
        JOIN jouer j ON j.id_personne = pe.id_personne
        JOIN role ro ON ro.id_role = j.id_role
        WHERE pa.id_serie = %s
    """, (id_serie,))
    persons = cur.fetchall()

    realisateurs = [p for p in persons if p["role"] == "Réalisateur"]
    createurs = [p for p in persons if p["role"] == "Créateur"]
    acteurs = [p for p in persons if p["role"] == "Acteur Principal"]

    # SAISONS + EPISODES
    cur.execute("""
        SELECT id_saison, numero
        FROM saison
        WHERE id_serie = %s
        ORDER BY numero
    """, (id_serie,))
    saisons_db = cur.fetchall()

    saisons = []
    for s in saisons_db:
        cur.execute("""
            SELECT numero
            FROM episode
            WHERE id_saison = %s
            ORDER BY numero
        """, (s["id_saison"],))
        episodes = [e["numero"] for e in cur.fetchall()]

        saisons.append({
            "id_saison": s["id_saison"],
            "numero": s["numero"],
            "episodes": episodes
        })

    cur.execute("""
        SELECT COUNT(*) AS total
        FROM episode e
        JOIN saison s ON e.id_saison = s.id_saison
        WHERE s.id_serie = %s
    """, (id_serie,))
    total_episodes = cur.fetchone()["total"]

    cur.close()

    return {
        "id_serie": serie["id_serie"],
        "titre": serie["titre"],
        "description": serie["description"],
        "date_sortie": serie["date_sortie"],
        "image": serie["image"],
        "genres": genres,
        "realisateurs": realisateurs,
        "createurs": createurs,
        "acteurs": acteurs,
        "saisons": saisons,
        "episodes": total_episodes
    }


# AJOUT SAISON
@router.post("/api/admin/series/{id_serie}/saisons")
def add_saison(id_serie: int, data: dict, db=Depends(get_db)):
    cur = db.cursor()
    cur.execute("""
        INSERT INTO saison (numero, id_serie)
        VALUES (%s, %s)
    """, (data["numero"], id_serie))

    db.commit()
    cur.close()
    return {"success": True}


# AJOUT EPISODE
@router.post("/api/admin/saisons/{id_saison}/episodes")
def add_episode(id_saison: int, data: dict, db=Depends(get_db)):
    cur = db.cursor()
    cur.execute("""
        INSERT INTO episode (numero, id_saison)
        VALUES (%s, %s)
    """, (data["numero"], id_saison))

    db.commit()
    cur.close()
    return {"success": True}


# MODIFICATION
@router.put("/api/admin/series/{id_serie}")
def update_series(id_serie: int, data: dict, db=Depends(get_db)):
    cur = db.cursor()

    cur.execute("""
        UPDATE serie
        SET description = %s,
            date_sortie = %s
        WHERE id_serie = %s
    """, (data["description"], data["date_sortie"], id_serie))

    db.commit()
    cur.close()

    return {"success": True}
