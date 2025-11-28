# backend/app/routers/auth.py

from fastapi import APIRouter, Request, HTTPException
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from pydantic import BaseModel
from pathlib import Path
import json
import bcrypt

router = APIRouter()

# -----------------------------
# Localisation des templates
# -----------------------------
BASE_DIR = Path(__file__).resolve().parents[3]
TEMPLATES_DIR = BASE_DIR / "frontend" / "templates"
templates = Jinja2Templates(directory=str(TEMPLATES_DIR))

# -----------------------------
# Fichier users.json
# -----------------------------
USERS_PATH = BASE_DIR / "backend" / "data" / "users.json"
print("USERS_PATH utilisé :", USERS_PATH)


def load_users():
    if USERS_PATH.exists():
        with open(USERS_PATH, "r", encoding="utf-8") as f:
            users = json.load(f)
            print(f"[DEBUG] {len(users)} utilisateurs chargés depuis users.json")
            return users
    print("[DEBUG] Fichier users.json introuvable")
    return []


# -----------------------------
# Page connexion
# -----------------------------
@router.get("/connexion", response_class=HTMLResponse)
async def connexion_page(request: Request):
    return templates.TemplateResponse("PageConnexion.html", {"request": request})


# -----------------------------
# Login API (bcrypt + secours mdp_clair)
# -----------------------------
class LoginData(BaseModel):
    identifiant_ou_email: str
    mdp: str


@router.post("/api/auth/login")
def login(data: LoginData):
    print("[DEBUG] Tentative de login pour :", data.identifiant_ou_email)
    users = load_users()

    # Chercher utilisateur
    user = next(
        (u for u in users
         if u.get("identifiant") == data.identifiant_ou_email
         or u.get("email") == data.identifiant_ou_email),
        None
    )

    if not user:
        print("[DEBUG] Aucun utilisateur trouvé")
        raise HTTPException(status_code=401, detail="Identifiant/email incorrect")

    print("[DEBUG] Utilisateur trouvé :", user.get("identifiant"))

    password_ok = False

    # 1) Tentative avec bcrypt sur le champ "mdp"
    stored_hash = user.get("mdp")
    if stored_hash:
        try:
            password_ok = bcrypt.checkpw(
                data.mdp.encode("utf-8"),
                stored_hash.encode("utf-8")
            )
            print("[DEBUG] Résultat bcrypt.checkpw :", password_ok)
        except ValueError as e:
            print("[DEBUG] Erreur bcrypt :", e)
            password_ok = False

    # 2) Secours : comparaison directe avec mdp_clair (utile si hash foireux)
    if not password_ok and "mdp_clair" in user:
        if data.mdp == user["mdp_clair"]:
            print("[DEBUG] Mot de passe accepté via mdp_clair (secours)")
            password_ok = True

    if not password_ok:
        raise HTTPException(status_code=401, detail="Mot de passe incorrect")

    print("[DEBUG] Connexion OK pour", user["identifiant"])

    return {
        "message": "Connexion réussie",
        "identifiant": user["identifiant"],
        "type_utilisateur": user["type_utilisateur"]
    }
