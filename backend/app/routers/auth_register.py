# backend/app/routers/auth_register.py

from fastapi import APIRouter, HTTPException
from pydantic import BaseModel, EmailStr
import bcrypt
from app.database.connection import get_db

router = APIRouter()

# ====== SCHEMA INSCRIPTION ======
class RegisterData(BaseModel):
    identifiant: str
    email: EmailStr
    mdp: str
    prenom: str
    nom: str
    adresse: str
    telephone: str


# ====== ENDPOINT : CREER UN COMPTE ======
@router.post("/api/auth/register")
def register(data: RegisterData):
    conn = get_db()
    cur = conn.cursor()

    # Vérifier identifiant ou email déjà existants
    cur.execute("""
        SELECT 1 FROM utilisateur 
        WHERE identifiant = %s OR email = %s
    """, (data.identifiant, data.email))

    if cur.fetchone():
        raise HTTPException(status_code=400, detail="Identifiant ou email déjà utilisé.")

    # Hash du mot de passe
    hashed = bcrypt.hashpw(data.mdp.encode("utf-8"), bcrypt.gensalt()).decode("utf-8")

    # Insertion SQL
    cur.execute("""
        INSERT INTO utilisateur
            (identifiant, email, mdp, mdp_clair, type_utilisateur,
             prenom, nom, adresse, telephone)
        VALUES (%s, %s, %s, %s, 'utilisateur', %s, %s, %s, %s)
        RETURNING id_utilisateur;
    """, (
        data.identifiant,
        data.email,
        hashed,
        data.mdp,          # <-- mdp_clair pour compatibilité login JSON
        data.prenom,
        data.nom,
        data.adresse,
        data.telephone
    ))

    conn.commit()
    cur.close()

    return {"message": "Compte créé", "identifiant": data.identifiant}
