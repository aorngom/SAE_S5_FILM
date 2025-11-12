import os
from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates

app = FastAPI(
    title="Moteur de Recherche de Séries",
    description="API de recherche de séries par mots-clés",
    version="1.0.0"
)

# Répertoire de base = backend/app/
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

# Dossiers frontend
FRONTEND_DIR = os.path.abspath(os.path.join(BASE_DIR, "../../frontend"))
FRONTEND_STATIC_DIR = os.path.join(FRONTEND_DIR, "static")
FRONTEND_TEMPLATES_DIR = os.path.join(FRONTEND_DIR, "templates")

# === MONTAGES ===
#  fichiers statiques (images, CSS, JS)
app.mount("/static", StaticFiles(directory=FRONTEND_STATIC_DIR), name="static")

#  fichiers JSON dans static/data/
DATA_DIR = os.path.join(FRONTEND_STATIC_DIR, "data")

# templates HTML
templates = Jinja2Templates(directory=FRONTEND_TEMPLATES_DIR)

# === ROUTES ===
@app.get("/", response_class=HTMLResponse)
async def read_root(request: Request):
    return templates.TemplateResponse("PageAccueil.html", {"request": request})

@app.get("/api/health")
async def health_check():
    return {"status": "ok", "message": "API opérationnelle"}

@app.get("/connexion", response_class=HTMLResponse)
async def connexion_page(request: Request):
    return templates.TemplateResponse("PageConnexion.html", {"request": request})

@app.get("/inscription", response_class=HTMLResponse)
async def inscription_page(request: Request):
    return templates.TemplateResponse("PageInscription.html", {"request": request})
