# backend/app/routers/auth_register.py

from fastapi import APIRouter, HTTPException, Depends, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from pathlib import Path
from pydantic import BaseModel, EmailStr
import bcrypt

from app.database.connection import get_db

router = APIRouter()

#  CHARGEMENT DES TEMPLATES 
BASE_DIR = Path(__file__).resolve().parents[3]
TEMPLATES_DIR = BASE_DIR / "frontend" / "templates"
templates = Jinja2Templates(directory=str(TEMPLATES_DIR))


#  PAGE HTML INSCRIPTION → /inscription
@router.get("/inscription", response_class=HTMLResponse)
def inscription_page(request: Request):
    return templates.TemplateResponse("PageInscription.html", {"request": request})


# SCHEMA DE DONNÉES POUR L’API
class RegisterData(BaseModel):
    identifiant: str
    email: EmailStr
    mdp: str
    prenom: str
    nom: str
    adresse: str
    telephone: str


#  API INSCRIPTION → POST /api/auth/register
@router.post("/api/auth/register")
def register(data: RegisterData, db=Depends(get_db)):

    cur = db.cursor()

    # Vérification identifiant ou email déjà pris
    cur.execute("""
        SELECT 1 FROM utilisateur
        WHERE identifiant = %s OR email = %s
    """, (data.identifiant, data.email))

    if cur.fetchone():
        cur.close()
        raise HTTPException(
            status_code=400,
            detail="Identifiant ou email déjà utilisé."
        )

    # Hash du mot de passe
    hashed = bcrypt.hashpw(
        data.mdp.encode("utf-8"),
        bcrypt.gensalt()
    ).decode("utf-8")

    # Insertion du nouvel utilisateur
    cur.execute("""
        INSERT INTO utilisateur
            (identifiant, email, mdp, mdp_clair, type_utilisateur,
             prenom, nom, adresse, telephone)
        VALUES (%s, %s, %s, %s, 'utilisateur', %s, %s, %s, %s)
    """, (
        data.identifiant,
        data.email,
        hashed,
        data.mdp,         # mot de passe clair (Pour ne pa oublier mais mauvaise chose à faire pour un vrai projet)
        data.prenom,
        data.nom,
        data.adresse,
        data.telephone
    ))

    db.commit()
    cur.close()

    return {"message": "Compte créé avec succès", "identifiant": data.identifiant}
