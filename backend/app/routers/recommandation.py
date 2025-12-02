from fastapi import APIRouter, Request
import psycopg2
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from pathlib import Path

router = APIRouter()

# -----------------------------
# Localisation des templates
# -----------------------------
BASE_DIR = Path(__file__).resolve().parents[3]
TEMPLATES_DIR = BASE_DIR / "frontend" / "templates"
templates = Jinja2Templates(directory=str(TEMPLATES_DIR))

@router.get("/recommandation", response_class=HTMLResponse)
async def recommandation_page(request: Request):
    return templates.TemplateResponse("PageRecommandation.html", {"request": request})

utilisateur = "postgres"
mdp = "iutinfo"
db_name = "SAE_S5_FILM"

# Connexion PostgreSQL
conn = psycopg2.connect(
    dbname = db_name,
    user = utilisateur,
    password = mdp,
    host = "localhost",
    port = "5432"
)

@router.get("/recommendations/top_rated")
def top_rated():
    cur = conn.cursor()
    cur.execute("""
        SELECT s.id_serie, s.titre, AVG(n.score) AS note_moyenne
        FROM serie s, noter n
        WHERE s.Id_serie = n.Id_serie
        GROUP BY s.Id_serie, s.titre
        ORDER BY note_moyenne DESC
        LIMIT 12;
    """)
    rows = cur.fetchall()
    cur.close()
    return [{"id_serie": r[0], "serie": r[1]} for r in rows]

@router.get("/recommendations/awards")
def awards():
    cur = conn.cursor()
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
    return [{"id_serie": r[0],"serie": r[1]} for r in rows]

@router.get("/recommendations/trending")
def trending():
    cur = conn.cursor()
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