# backend/app/routers/admin_edit.py

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
        SELECT id_serie, titre, description, date_sortie
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

    #  ACTEURS 
    cur.execute("""
        SELECT per.prenom, per.nom
        FROM personne per
        JOIN participer pa ON pa.id_personne = per.id_personne
        JOIN role r ON r.id_role = pa.id_serie  -- ⚠ Selon ton modèle, mais ici il manque une vraie liaison rôle/série
        WHERE pa.id_serie = %s
    """, (id_serie,))
    acteurs = [{"prenom": r["prenom"], "nom": r["nom"]} for r in cur.fetchall()]


    cur.execute("""
        SELECT per.prenom, per.nom
        FROM personne per
        JOIN participer pa ON pa.id_personne = per.id_personne
        WHERE pa.id_serie = %s
    """, (id_serie,))
    createurs_real = [{"prenom": r["prenom"], "nom": r["nom"]} for r in cur.fetchall()]

    # SAISONS 
    cur.execute("""
        SELECT id_saison, numero, description
        FROM saison
        WHERE id_serie = %s
        ORDER BY numero
    """, (id_serie,))
    saisons = cur.fetchall()

    #  EPISODES 
    cur.execute("""
        SELECT COUNT(*) AS total
        FROM episode e
        JOIN saison s ON e.id_saison = s.id_saison
        WHERE s.id_serie = %s
    """, (id_serie,))
    episodes = cur.fetchone()["total"]

    cur.close()

    return {
        "id_serie": serie["id_serie"],
        "titre": serie["titre"],
        "description": serie["description"],
        "date_sortie": serie["date_sortie"],
        "genres": genres,
        "createurs": createurs_real,
        "realisateurs": createurs_real,
        "acteurs": acteurs,
        "saisons": saisons,
        "episodes": episodes
    }
