from fastapi import APIRouter, Request, HTTPException
from fastapi.templating import Jinja2Templates
from pathlib import Path

from app.services.profil_service import get_profil, update_profil

router = APIRouter()

BASE_DIR = Path(__file__).resolve().parents[3]
TEMPLATES_DIR = BASE_DIR / "frontend" / "templates"
templates = Jinja2Templates(directory=str(TEMPLATES_DIR))


@router.get("/profil")
async def profil_page(request: Request):
    return templates.TemplateResponse("PageProfil.html", {"request": request})


@router.get("/api/profil/{identifiant}")
async def api_get_profil(identifiant: str):
    user = get_profil(identifiant)
    if not user:
        raise HTTPException(404, "Utilisateur introuvable")
    return user


@router.put("/api/profil/{identifiant}")
async def api_update_profil(identifiant: str, data: dict):
    ok = update_profil(identifiant, data)
    if not ok:
        raise HTTPException(404, "Utilisateur introuvable ou aucune donnée valide")
    return {"status": "ok"}
