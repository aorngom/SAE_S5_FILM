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


# API ADMIN : LISTE TOUTES LES SERIES
@router.get("/api/admin/series")
async def admin_get_series(db = Depends(get_db)):

    cur = db.cursor()

    query = """
        SELECT id_serie, titre, date_sortie, description, image
        FROM serie
        ORDER BY id_serie;
    """

    cur.execute(query)
    rows = cur.fetchall()

    series = []

    for s in rows:

        sid = s["id_serie"]

        # Récup genres
        cur.execute("""
            SELECT g.libelle
            FROM genre g
            JOIN posseder p ON p.id_genre = g.id_genre
            WHERE p.id_serie = %s
        """, (sid,))
        genres = [r["libelle"] for r in cur.fetchall()]

        # Récup créateurs
        cur.execute("""
            SELECT prenom, nom
            FROM personne
            JOIN participer ON participer.id_personne = personne.id_personne
            JOIN role ON role.id_role = participer.id_personne
            WHERE participer.id_serie = %s AND role.id_role = 3
        """, (sid,))
        createurs = cur.fetchall()

        # Récup réalisateurs
        cur.execute("""
            SELECT prenom, nom
            FROM personne
            JOIN participer ON participer.id_personne = personne.id_personne
            JOIN role ON role.id_role = participer.id_personne
            WHERE participer.id_serie = %s AND role.id_role = 2
        """, (sid,))
        realisateurs = cur.fetchall()

        # Récup acteurs
        cur.execute("""
            SELECT prenom, nom
            FROM personne
            JOIN participer ON participer.id_personne = personne.id_personne
            JOIN role ON role.id_role = participer.id_personne
            WHERE participer.id_serie = %s AND role.id_role = 1
        """, (sid,))
        acteurs = cur.fetchall()

        # Récup saisons + épisodes
        cur.execute("""
            SELECT id_saison, numero
            FROM saison
            WHERE id_serie = %s
        """, (sid,))
        saisons_db = cur.fetchall()

        saisons = []
        for sa in saisons_db:
            cur.execute("""
                SELECT COUNT(*) AS nb
                FROM episode
                WHERE id_saison = %s
            """, (sa["id_saison"],))
            nb = cur.fetchone()["nb"]

            saisons.append({
                "numero": sa["numero"],
                "episodes": nb
            })

        series.append({
            "id_serie": sid,
            "titre": s["titre"],
            "image": s["image"],
            "genres": genres,
            "createurs": createurs,
            "realisateurs": realisateurs,
            "acteurs": acteurs,
            "saisons": saisons
        })

    cur.close()
    return {"series": series}
