# backend/app/routers/profil.py

from fastapi import APIRouter, Request, HTTPException, Depends
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from pathlib import Path

from app.database.connection import get_db

router = APIRouter()

# ============================================
# TEMPLATES
# ============================================
BASE_DIR = Path(__file__).resolve().parents[3]
TEMPLATES_DIR = BASE_DIR / "frontend" / "templates"
templates = Jinja2Templates(directory=str(TEMPLATES_DIR))


# ============================================
# PAGE HTML PROFIL
# ============================================
@router.get("/profil", response_class=HTMLResponse)
async def profil_page(request: Request):
    return templates.TemplateResponse("PageProfil.html", {"request": request})


# ============================================
# API GET PROFIL (récupérer un utilisateur)
# ============================================
@router.get("/api/profil/{identifiant}")
async def api_get_profil(identifiant: str, db = Depends(get_db)):

    query = """
        SELECT 
            identifiant, email, mdp, mdp_clair, type_utilisateur,
            prenom, nom, adresse, telephone
        FROM utilisateur
        WHERE identifiant = %s;
    """

    cur = db.cursor()
    cur.execute(query, (identifiant,))
    row = cur.fetchone()
    cur.close()

    if not row:
        raise HTTPException(status_code=404, detail="Utilisateur introuvable")

    # row est un dict grâce à RealDictCursor
    return {
        "identifiant": row["identifiant"],
        "email": row["email"],
        "mdp": row["mdp"],
        "mdp_clair": row["mdp_clair"],
        "type_utilisateur": row["type_utilisateur"],
        "prenom": row["prenom"],
        "nom": row["nom"],
        "adresse": row["adresse"],
        "telephone": row["telephone"],
    }


# ============================================
# API UPDATE PROFIL (mettre à jour un utilisateur)
# ============================================
@router.put("/api/profil/{identifiant}")
async def api_update_profil(identifiant: str, data: dict, db = Depends(get_db)):

    # Vérifier si l'utilisateur existe
    cur = db.cursor()
    cur.execute(
        "SELECT id_utilisateur FROM utilisateur WHERE identifiant = %s;",
        (identifiant,)
    )
    exists = cur.fetchone()

    if not exists:
        cur.close()
        raise HTTPException(status_code=404, detail="Utilisateur introuvable")

    # Champs autorisés à être modifiés
    allowed_fields = ["email", "prenom", "nom", "adresse", "telephone", "mdp", "mdp_clair"]
    fields_to_update = {k: v for k, v in data.items() if k in allowed_fields}

    if not fields_to_update:
        cur.close()
        raise HTTPException(status_code=400, detail="Aucune donnée valide à mettre à jour")

    # Construction dynamique de la clause SET
    set_clause = ", ".join([f"{field} = %s" for field in fields_to_update.keys()])
    params = list(fields_to_update.values()) + [identifiant]

    update_query = f"""
        UPDATE utilisateur
        SET {set_clause}
        WHERE identifiant = %s;
    """

    cur.execute(update_query, params)
    db.commit()
    cur.close()

    return {"status": "ok"}
