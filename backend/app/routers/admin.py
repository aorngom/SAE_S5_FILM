# backend/app/routers/admin.py

from fastapi import APIRouter, Request, Depends
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from pathlib import Path
from app.database.connection import get_db

router = APIRouter()

# TEMPLATES
BASE_DIR = Path(__file__).resolve().parents[3]
TEMPLATES_DIR = BASE_DIR / "frontend" / "templates"
templates = Jinja2Templates(directory=str(TEMPLATES_DIR))


# PAGE HTML ADMIN
@router.get("/admin", response_class=HTMLResponse)
async def admin_page(request: Request):
    return templates.TemplateResponse("PageAdmin.html", {"request": request})


# API ADMIN : VERSION OPTIMISÉE
@router.get("/api/admin/series/light")
async def admin_get_series_light(db = Depends(get_db)):
    cur = db.cursor()

    query = """
    SELECT 
        s.id_serie,
        s.titre,
        s.image,

        -- nombre de saisons
        (SELECT COUNT(*) FROM saison sa WHERE sa.id_serie = s.id_serie) AS nb_saisons,

        -- nombre total d'épisodes
        (SELECT COUNT(*) 
         FROM episode e 
         JOIN saison sa ON sa.id_saison = e.id_saison
         WHERE sa.id_serie = s.id_serie) AS nb_episodes,

        -- créateur (rôle = 3)
        (
            SELECT pers.prenom || ' ' || pers.nom
            FROM participer p
            JOIN jouer j ON j.id_personne = p.id_personne
            JOIN personne pers ON pers.id_personne = p.id_personne
            WHERE p.id_serie = s.id_serie AND j.id_role = 3
            LIMIT 1
        ) AS createur,

        -- réalisateur (rôle = 2)
        (
            SELECT pers.prenom || ' ' || pers.nom
            FROM participer p
            JOIN jouer j ON j.id_personne = p.id_personne
            JOIN personne pers ON pers.id_personne = p.id_personne
            WHERE p.id_serie = s.id_serie AND j.id_role = 2
            LIMIT 1
        ) AS realisateur,

        -- acteur (rôle = 1)
        (
            SELECT pers.prenom || ' ' || pers.nom
            FROM participer p
            JOIN jouer j ON j.id_personne = p.id_personne
            JOIN personne pers ON pers.id_personne = p.id_personne
            WHERE p.id_serie = s.id_serie AND j.id_role = 1
            LIMIT 1
        ) AS acteur

    FROM serie s
    ORDER BY s.id_serie;
    """

    cur.execute(query)
    rows = cur.fetchall()
    cur.close()
    return {"series": rows}

# API : Liste des genres
@router.get("/api/genres")
async def get_genres(db = Depends(get_db)):
    cur = db.cursor()
    cur.execute("SELECT id_genre, libelle FROM genre ORDER BY libelle;")
    rows = cur.fetchall()
    cur.close()

    return [{"id_genre": r["id_genre"], "libelle": r["libelle"]} for r in rows]
