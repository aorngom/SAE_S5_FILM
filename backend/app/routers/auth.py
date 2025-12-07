# backend/app/routers/auth.py

from fastapi import APIRouter, Request, HTTPException, Depends
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from pydantic import BaseModel
from pathlib import Path
import bcrypt

from app.database.connection import get_db

router = APIRouter()

# ======================================================
# Localisation des templates
# ======================================================
BASE_DIR = Path(__file__).resolve().parents[3]
TEMPLATES_DIR = BASE_DIR / "frontend" / "templates"
templates = Jinja2Templates(directory=str(TEMPLATES_DIR))


# ======================================================
# Page HTML : Connexion
# ======================================================
@router.get("/connexion", response_class=HTMLResponse)
async def connexion_page(request: Request):
    return templates.TemplateResponse("PageConnexion.html", {"request": request})


# ======================================================
# DATA MODEL LOGIN
# ======================================================
class LoginData(BaseModel):
    identifiant_ou_email: str
    mdp: str


# ======================================================
# LOGIN API (psycopg2 + bcrypt + fallback mdp_clair)
# ======================================================
@router.post("/api/auth/login")
def login(data: LoginData, db = Depends(get_db)):

    # --- 1) Chercher l'utilisateur ---
    query = """
        SELECT 
            id_utilisateur,
            identifiant,
            email,
            mdp,
            mdp_clair,
            type_utilisateur
        FROM utilisateur
        WHERE identifiant = %(u)s OR email = %(u)s;
    """

    cur = db.cursor()
    cur.execute(query, {"u": data.identifiant_ou_email})
    user = cur.fetchone()

    if not user:
        cur.close()
        raise HTTPException(status_code=401, detail="Identifiant/email incorrect")

    password_ok = False
    input_pwd = data.mdp.encode("utf-8")

    # --- 2) Vérification bcrypt ---
    if user["mdp"]:
        try:
            stored_hash = user["mdp"].encode("utf-8")
            if bcrypt.checkpw(input_pwd, stored_hash):
                password_ok = True
        except:
            password_ok = False

    # --- 3) Fallback si mdp_clair existe ---
    if not password_ok and user["mdp_clair"]:
        if data.mdp == user["mdp_clair"]:
            password_ok = True

    cur.close()

    if not password_ok:
        raise HTTPException(status_code=401, detail="Mot de passe incorrect")

    # --- 4) Réponse OK ---
    return {
        "message": "Connexion réussie",
        "id_utilisateur": user["id_utilisateur"],
        "identifiant": user["identifiant"],
        "email": user["email"],
        "type_utilisateur": user["type_utilisateur"]
    }
