from fastapi import APIRouter, Request, Query
from fastapi.responses import JSONResponse
from fastapi.templating import Jinja2Templates
from pathlib import Path

from app.services.search_service import (
    get_suggestions,
    search_series
)

router = APIRouter()

# CONFIG TEMPLATES
BASE_DIR = Path(__file__).resolve().parents[3]   # remonte jusqu'à SAE_FILMS/
TEMPLATES_DIR = BASE_DIR / "frontend" / "templates"

templates = Jinja2Templates(directory=str(TEMPLATES_DIR))


#PAGE HTML : /recherche
@router.get("/recherche")
def page_recherche(request: Request, q: str | None = None):
    """
    Affiche la page HTML des résultats de recherche.
    La recherche est gérée en JS côté client.
    """
    return templates.TemplateResponse(
        "PageRecherche.html",
        {
            "request": request,
            "query": q or ""
        }
    )


#  API AUTOCOMPLÉTION
@router.get("/api/search/suggestions")
def api_suggestions(query: str = Query(..., min_length=1)):
    """
    Retourne une liste de mots-clés commençant par la chaîne tapée.
    Utilisé par la navbar.
    """
    suggestions = get_suggestions(query)
    return JSONResponse(content=suggestions)


#  API RECHERCHE PRINCIPALE
@router.get("/api/search")
def api_search(query: str = Query(..., min_length=1)):
    """
    Recherche les séries correspondantes au mot-clé (TF-IDF).
    Utilisé par PageRecherche.js.
    """
    results = search_series(query)
    return JSONResponse(content=results)
