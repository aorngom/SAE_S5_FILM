# backend/app/routers/favoris.py

from fastapi import APIRouter, Depends, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from pathlib import Path

from app.database.connection import get_db

router = APIRouter()

# Templates
BASE_DIR = Path(__file__).resolve().parents[3]
TEMPLATES_DIR = BASE_DIR / "frontend" / "templates"
templates = Jinja2Templates(directory=str(TEMPLATES_DIR))


# Page HTML FAVORIS
@router.get("/favoris", response_class=HTMLResponse)
async def favoris_page(request: Request):
    return templates.TemplateResponse("PageFavoris.html", {"request": request})


# API : TOGGLE FAVORI
@router.post("/api/favori/toggle")
def toggle_favori(data: dict, db=Depends(get_db)):
    id_serie = data["id_serie"]
    identifiant = data["identifiant"]

    cur = db.cursor()

    # Récupérer id utilisateur
    cur.execute(
        "SELECT id_utilisateur FROM utilisateur WHERE identifiant = %s",
        (identifiant,)
    )
    row = cur.fetchone()

    if not row:
        cur.close()
        return {"error": "Utilisateur introuvable"}

    id_user = row["id_utilisateur"]

    # Vérifier si favori existe
    cur.execute(
        "SELECT 1 FROM favori WHERE id_serie = %s AND id_utilisateur = %s",
        (id_serie, id_user)
    )

    if cur.fetchone():
        cur.execute(
            "DELETE FROM favori WHERE id_serie = %s AND id_utilisateur = %s",
            (id_serie, id_user)
        )
        status = "removed"
    else:
        cur.execute(
            "INSERT INTO favori (id_serie, id_utilisateur) VALUES (%s, %s)",
            (id_serie, id_user)
        )
        status = "added"

    db.commit()
    cur.close()

    return {"success": True, "status": status}


# API : STATUS FAVORI
@router.get("/api/favori/status")
def favori_status(id_serie: int, identifiant: str, db=Depends(get_db)):
    cur = db.cursor()

    cur.execute(
        "SELECT id_utilisateur FROM utilisateur WHERE identifiant = %s",
        (identifiant,)
    )
    row = cur.fetchone()

    if not row:
        cur.close()
        return {"is_favori": False}

    id_user = row["id_utilisateur"]

    cur.execute(
        "SELECT 1 FROM favori WHERE id_serie = %s AND id_utilisateur = %s",
        (id_serie, id_user)
    )

    exists = cur.fetchone() is not None
    cur.close()

    return {"is_favori": exists}


# API : AJOUT / UPDATE 
@router.post("/api/note")
def add_note(data: dict, db=Depends(get_db)):
    id_serie = data["id_serie"]
    identifiant = data["identifiant"]
    score = int(data["score"])

    cur = db.cursor()

    # Récupérer user
    cur.execute(
        "SELECT id_utilisateur FROM utilisateur WHERE identifiant = %s",
        (identifiant,)
    )
    row = cur.fetchone()

    if not row:
        cur.close()
        return {"error": "Utilisateur introuvable"}

    id_user = row["id_utilisateur"]

    # Vérifier si note existe
    cur.execute(
        "SELECT 1 FROM noter WHERE id_serie = %s AND id_utilisateur = %s",
        (id_serie, id_user)
    )

    if cur.fetchone():
        cur.execute(
            "UPDATE noter SET score = %s WHERE id_serie = %s AND id_utilisateur = %s",
            (score, id_serie, id_user)
        )
    else:
        cur.execute(
            "INSERT INTO noter (id_serie, id_utilisateur, score) VALUES (%s, %s, %s)",
            (id_serie, id_user, score)
        )

    db.commit()
    cur.close()

    return {"success": True, "score": score}



@router.get("/api/note/status")
def note_status(id_serie: int, identifiant: str, db=Depends(get_db)):
    cur = db.cursor()

    cur.execute(
        "SELECT id_utilisateur FROM utilisateur WHERE identifiant = %s",
        (identifiant,)
    )
    row = cur.fetchone()

    if not row:
        cur.close()
        return {"score": None}

    id_user = row["id_utilisateur"]

    cur.execute(
        "SELECT score FROM noter WHERE id_serie = %s AND id_utilisateur = %s",
        (id_serie, id_user)
    )
    row2 = cur.fetchone()
    cur.close()

    if not row2:
        return {"score": None}

    return {"score": row2["score"]}


# API : LISTE FAVORIS + BIEN NOTÉS
@router.get("/api/favoris/{identifiant}")
def api_get_favoris(identifiant: str, db=Depends(get_db)):
    cur = db.cursor()

    cur.execute(
        "SELECT id_utilisateur FROM utilisateur WHERE identifiant = %s",
        (identifiant,)
    )
    row = cur.fetchone()

    if not row:
        cur.close()
        return {"favoris": [], "bien_notes": []}

    id_user = row["id_utilisateur"]

    # Séries en favoris
    cur.execute("""
        SELECT s.id_serie, s.titre, s.image
        FROM favori f
        JOIN serie s ON s.id_serie = f.id_serie
        WHERE f.id_utilisateur = %s
        ORDER BY s.titre;
    """, (id_user,))
    fav_rows = cur.fetchall()

    # Séries bien notées (score >= 3)
    cur.execute("""
        SELECT s.id_serie, s.titre, s.image, n.score
        FROM noter n
        JOIN serie s ON s.id_serie = n.id_serie
        WHERE n.id_utilisateur = %s AND n.score >= 3
        ORDER BY n.score DESC, s.titre;
    """, (id_user,))
    note_rows = cur.fetchall()

    cur.close()

    favoris = [
        {
            "id_serie": r["id_serie"],
            "titre": r["titre"],
            "image": r["image"] or "default.jpg"
        }
        for r in fav_rows
    ]

    bien_notes = [
        {
            "id_serie": r["id_serie"],
            "titre": r["titre"],
            "image": r["image"] or "default.jpg",
            "score": r["score"]
        }
        for r in note_rows
    ]

    return {"favoris": favoris, "bien_notes": bien_notes}
