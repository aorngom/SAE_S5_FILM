from fastapi import APIRouter, Request, HTTPException
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from pathlib import Path
import json

router = APIRouter()

# Chargement des templates
BASE_DIR = Path(__file__).resolve().parents[3]
TEMPLATES_DIR = BASE_DIR / "frontend" / "templates"
templates = Jinja2Templates(directory=str(TEMPLATES_DIR))

# Fichier users.json
USERS_PATH = BASE_DIR / "backend" / "data" / "users.json"


def load_users():
    if USERS_PATH.exists():
        with open(USERS_PATH, "r", encoding="utf-8") as f:
            return json.load(f)
    return []


def save_users(users):
    with open(USERS_PATH, "w", encoding="utf-8") as f:
        json.dump(users, f, indent=4, ensure_ascii=False)


# ==============================================
# PAGE PROFIL (affichage HTML)
# ==============================================
@router.get("/profil", response_class=HTMLResponse)
async def profil_page(request: Request):
    return templates.TemplateResponse("PageProfil.html", {"request": request})


# ==============================================
# API GET /api/users/<identifiant>
# ==============================================
@router.get("/api/users/{identifiant}")
def get_user(identifiant: str):
    users = load_users()
    user = next((u for u in users if u["identifiant"] == identifiant), None)

    if not user:
        raise HTTPException(status_code=404, detail="Utilisateur introuvable")

    return user


# ==============================================
# API PUT /api/users/<identifiant>
# ==============================================
@router.put("/api/users/{identifiant}")
def update_user(identifiant: str, data: dict):
    users = load_users()

    for u in users:
        if u["identifiant"] == identifiant:
            u.update(data)
            save_users(users)
            return {"message": "Profil mis à jour"}

    raise HTTPException(status_code=404, detail="Utilisateur introuvable")
