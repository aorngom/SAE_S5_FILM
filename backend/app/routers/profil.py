from fastapi import APIRouter, Request, HTTPException
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates

from app.services.user_service import get_user_by_identifiant, update_user

router = APIRouter()
templates = Jinja2Templates(directory="frontend/templates")

# ---- PAGE HTML ----
@router.get("/profil", response_class=HTMLResponse)
async def profil_page(request: Request):
    return templates.TemplateResponse("PageProfil.html", {"request": request})


# ---- API POUR RECUPÉRER UN USER ----
@router.get("/api/users/{identifiant}")
async def api_get_user(identifiant: str):
    user = get_user_by_identifiant(identifiant)
    if not user:
        raise HTTPException(status_code=404, detail="Utilisateur introuvable")
    return user


# ---- API POUR UPDATE ----
@router.put("/api/users/{identifiant}")
async def api_update_user(identifiant: str, data: dict):
    updated = update_user(identifiant, data)
    if not updated:
        raise HTTPException(status_code=404, detail="Utilisateur introuvable")
    return {"status": "ok"}
