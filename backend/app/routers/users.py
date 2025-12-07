# backend/app/routers/users.py

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
# API GET USER
# ============================================
@router.get("/api/users/{identifiant}")
async def api_get_user(identifiant: str, db = Depends(get_db)):

    cur = db.cursor()

    query = """
        SELECT 
            identifiant, email, mdp, mdp_clair, type_utilisateur,
            prenom, nom, adresse, telephone
        FROM utilisateur
        WHERE identifiant = %s;
    """

    cur.execute(query, (identifiant,))
    row = cur.fetchone()
    cur.close()

    if not row:
        raise HTTPException(status_code=404, detail="Utilisateur introuvable")

    return {
        "identifiant": row[0],
        "email": row[1],
        "mdp": row[2],
        "mdp_clair": row[3],
        "type_utilisateur": row[4],
        "prenom": row[5],
        "nom": row[6],
        "adresse": row[7],
        "telephone": row[8],
    }


# ============================================
# API UPDATE USER
# ============================================
@router.put("/api/users/{identifiant}")
async def api_update_user(identifiant: str, data: dict, db = Depends(get_db)):

    cur = db.cursor()

    # Vérifier existence
    cur.execute("SELECT 1 FROM utilisateur WHERE identifiant = %s;", (identifiant,))
    if not cur.fetchone():
        cur.close()
        raise HTTPException(status_code=404, detail="Utilisateur introuvable")

    allowed_fields = ["email", "prenom", "nom", "adresse", "telephone", "mdp", "mdp_clair"]
    update_data = {k: v for k, v in data.items() if k in allowed_fields}

    if not update_data:
        cur.close()
        raise HTTPException(400, "Aucune donnée valide à mettre à jour")

    # Construire dynamique SET
    set_clause = ", ".join([f"{field} = %s" for field in update_data])
    values = list(update_data.values())
    values.append(identifiant)

    update_query = f"""
        UPDATE utilisateur
        SET {set_clause}
        WHERE identifiant = %s;
    """

    cur.execute(update_query, values)
    db.commit()
    cur.close()

    return {"message": "Profil mis à jour"}
