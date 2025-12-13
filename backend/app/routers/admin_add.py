# backend/app/routers/admin_add.py

from fastapi import APIRouter, Request, UploadFile, File, Form, HTTPException, Depends
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from pathlib import Path
import json
import os
import shutil

from app.database.connection import get_db

router = APIRouter()

#  TEMPLATES 
BASE_DIR = Path(__file__).resolve().parents[3]
TEMPLATES_DIR = BASE_DIR / "frontend" / "templates"
templates = Jinja2Templates(directory=str(TEMPLATES_DIR))

#  DOSSIER DES IMAGES 
UPLOAD_DIR = BASE_DIR / "frontend" / "static" / "images" / "posters_series"
os.makedirs(UPLOAD_DIR, exist_ok=True)


# PAGE HTML : AJOUTER UNE SÉRIE
@router.get("/admin/ajout", response_class=HTMLResponse)
def ajout_serie_page(request: Request):
    return templates.TemplateResponse("PageAjoutSeries.html", {"request": request})



# API : AJOUT D’UNE SÉRIE
@router.post("/api/admin/series/add")
def add_series(
    titre: str = Form(...),
    description: str = Form(""),
    date_sortie: str = Form(None),
    genre: int = Form(...),

    prix: str = Form("[]"),
    realisateurs: str = Form("[]"),
    createurs: str = Form("[]"),
    acteurs: str = Form("[]"),

    saisons: str = Form("[]"),

    image_name: str = Form(...),
    imageFile: UploadFile = File(...),

    db = Depends(get_db)
):

    cur = db.cursor()

    if not image_name.lower().endswith(".jpg"):
        raise HTTPException(400, "Image .jpg obligatoire")

    safe_filename = image_name.lower().replace(" ", "")
    image_path = UPLOAD_DIR / safe_filename

    with open(image_path, "wb") as f:
        shutil.copyfileobj(imageFile.file, f)

    # Insertion série
    cur.execute("""
        INSERT INTO serie (titre, description, date_sortie, image)
        VALUES (%s, %s, %s, %s)
        RETURNING id_serie
    """, (titre, description, date_sortie, safe_filename))

    row = cur.fetchone()
    id_serie = row["id_serie"]

    # GENRE
    cur.execute("INSERT INTO posseder VALUES (%s, %s)", (id_serie, genre))

    # PRIX
    prix_list = json.loads(prix)
    for p in prix_list:
        if p.strip() == "":
            continue
        
        cur.execute("""
            INSERT INTO prix (libelle) VALUES (%s) RETURNING id_prix
        """, (p,))
        id_prix = cur.fetchone()["id_prix"]

        cur.execute("INSERT INTO recevoir VALUES (%s, %s)", (id_serie, id_prix))

    # PERSONNES
    def add_person_list(json_list, role_id):
        persons = json.loads(json_list)
        for full_name in persons:
            if full_name.strip() == "":
                continue

            parts = full_name.split(" ")
            if len(parts) == 1:
                prenom = ""
                nom = parts[0]
            else:
                prenom = " ".join(parts[:-1])
                nom = parts[-1]

            cur.execute("""
                INSERT INTO personne (nom, prenom)
                VALUES (%s, %s)
                RETURNING id_personne
            """, (nom, prenom))

            id_personne = cur.fetchone()["id_personne"]

            cur.execute("INSERT INTO participer VALUES (%s, %s)", (id_serie, id_personne))
            cur.execute("INSERT INTO jouer VALUES (%s, %s)", (role_id, id_personne))

    # role_id = 2 → Réalisateur
    add_person_list(realisateurs, 2)

    # role_id = 3 → Créateur
    add_person_list(createurs, 3)

    # role_id = 1 → Acteur principal
    add_person_list(acteurs, 1)

    # SAISONS + EPISODES
    saisons_data = json.loads(saisons)

    for s in saisons_data:
        cur.execute("""
            INSERT INTO saison (numero, description, id_serie)
            VALUES (%s, %s, %s)
            RETURNING id_saison
        """, (s["numero"], s["description"], id_serie))

        id_saison = cur.fetchone()["id_saison"]

        for ep in s["episodes"]:
            if ep.strip() == "":
                continue
            cur.execute("""
                INSERT INTO episode (numero, id_saison)
                VALUES (%s, %s)
            """, (ep, id_saison))

    db.commit()
    cur.close()

    return {"success": True, "message": "Série ajoutée avec succès !"}
