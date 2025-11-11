import os
from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates

app = FastAPI(
    title="Moteur de Recherche de Films",
    description="API de recherche de films par mots-clés",
    version="1.0.0"
)

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

# Chemins vers frontend
FRONTEND_STATIC_DIR = os.path.join(BASE_DIR, "../../frontend/static")
FRONTEND_TEMPLATES_DIR = os.path.join(BASE_DIR, "../../frontend/templates")
FRONTEND_DATA_DIR = os.path.join(BASE_DIR, "../../frontend/data")  # <-- ici le JSON

# Monte les dossiers static et data
app.mount("/static", StaticFiles(directory=FRONTEND_STATIC_DIR), name="static")
app.mount("/data", StaticFiles(directory=FRONTEND_DATA_DIR), name="data")

# Initialise les templates
templates = Jinja2Templates(directory=FRONTEND_TEMPLATES_DIR)

# Route racine
@app.get("/", response_class=HTMLResponse)
async def read_root(request: Request):
    return templates.TemplateResponse("PageAccueil.html", {"request": request})

# Endpoint santé
@app.get("/api/health")
async def health_check():
    return {"status": "ok", "message": "API opérationnelle"}

# Endpoint recherche (vide pour l'instant)
@app.post("/api/search")
async def search_films(query: str):
    return {"query": query, "results": [], "count": 0}
