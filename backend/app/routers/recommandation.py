# backend/app/routers/recommandation.py

from fastapi import APIRouter, Request, Depends
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from pathlib import Path

from app.database.connection import get_db


router = APIRouter()

# -----------------------------
# Localisation des templates
# -----------------------------
BASE_DIR = Path(__file__).resolve().parents[3]
TEMPLATES_DIR = BASE_DIR / "frontend" / "templates"
templates = Jinja2Templates(directory=str(TEMPLATES_DIR))


# -----------------------------
# PAGE HTML
# -----------------------------
@router.get("/recommandation", response_class=HTMLResponse)
async def recommandation_page(request: Request):
    return templates.TemplateResponse("PageRecommandation.html", {"request": request})


# -----------------------------
# TOP RATED
# -----------------------------
@router.get("/recommendations/top_rated")
def top_rated(db = Depends(get_db)):

    cur = db.cursor()
    cur.execute("""
        SELECT s.id_serie, s.titre, AVG(n.score) AS note_moyenne
        FROM serie s, noter n
        WHERE s.id_serie = n.id_serie
        GROUP BY s.id_serie, s.titre
        ORDER BY note_moyenne DESC
        LIMIT 12;
    """)
    rows = cur.fetchall()
    cur.close()

    return [{"id_serie": r[0], "serie": r[1]} for r in rows]


# -----------------------------
# AWARDS
# -----------------------------
@router.get("/recommendations/awards")
def awards(db = Depends(get_db)):

    cur = db.cursor()
    cur.execute("""
        SELECT 
            s.id_serie, s.titre,
            SUBSTRING(p.libelle FROM '([0-9]+)\\s*win[s]?')::int AS nb_wins
        FROM prix p, serie s, recevoir r
        WHERE r.id_serie = s.id_serie
        AND r.id_prix = p.id_prix
        AND SUBSTRING(p.libelle FROM '([0-9]+)\\s*win[s]?')::int is not null
        ORDER BY nb_wins DESC
        LIMIT 12;
    """)
    rows = cur.fetchall()
    cur.close()

    return [{"id_serie": r[0], "serie": r[1]} for r in rows]


# -----------------------------
# TRENDING
# -----------------------------
@router.get("/recommendations/trending")
def trending(db = Depends(get_db)):

    cur = db.cursor()
    cur.execute("""
        SELECT
            s.id_serie, 
            s.titre,
            SUBSTRING(p.libelle FROM '([0-9]+)\\s*nomination[s]?')::int AS nb_wins
        FROM prix p, serie s, recevoir r
        WHERE r.id_serie = s.id_serie
        AND r.id_prix = p.id_prix
        AND SUBSTRING(p.libelle FROM '([0-9]+)\\s*nomination[s]?')::int is not null
        ORDER BY nb_wins DESC
        LIMIT 12;
    """)
    rows = cur.fetchall()
    cur.close()

    return [{"id_serie": r[0], "serie": r[1]} for r in rows]
