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

    realisateurs: str = Form("[]"),
    createurs: str = Form("[]"),
    acteurs: str = Form("[]"),

    saisons: str = Form("[]"),

    imageFile: UploadFile = File(...),
    db = Depends(get_db)
):

    cur = db.cursor()

    #  Vérification du fichier image (.jpg obligatoire)
    if not imageFile.filename.lower().endswith(".jpg"):
        raise HTTPException(status_code=400, detail="L'image doit être un fichier .jpg")

    # Génération du nom image final (ex: "breaking_bad.jpg")
    safe_filename = titre.lower().replace(" ", "_") + ".jpg"
    image_path = UPLOAD_DIR / safe_filename


    
    #  Inserer la série dans la table SERIE
    cur.execute("""
        INSERT INTO serie (titre, description, date_sortie)
        VALUES (%s, %s, %s)
        RETURNING id_serie
    """, (titre, description, date_sortie))

    id_serie = cur.fetchone()[0]


    #  Sauvegarde physique de l’image
    with open(image_path, "wb") as f:
        shutil.copyfileobj(imageFile.file, f)


    #  Ajouter GENRE
    cur.execute("INSERT INTO posseder VALUES (%s, %s)", (id_serie, genre))


    # Ajouter PERSONNES (acteurs, créateurs, réalisateurs)
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

            # Insert personne
            cur.execute("""
                INSERT INTO personne (nom, prenom)
                VALUES (%s, %s)
                RETURNING id_personne
            """, (nom, prenom))

            id_personne = cur.fetchone()[0]

            # Lier à la série
            cur.execute("INSERT INTO participer VALUES (%s, %s)", (id_serie, id_personne))

            # Lier au rôle
            cur.execute("INSERT INTO jouer VALUES (%s, %s)", (role_id, id_personne))

    # role_id = 2 → Réalisateur
    add_person_list(realisateurs, 2)

    # role_id = 3 → Créateur
    add_person_list(createurs, 3)

    # role_id = 1 → Acteur principal
    add_person_list(acteurs, 1)


    #  Ajouter SAISONS
    saisons_data = json.loads(saisons)

    for s in saisons_data:
        cur.execute("""
            INSERT INTO saison (numero, description, id_serie)
            VALUES (%s, %s, %s)
        """, (s["numero"], s["description"], id_serie))


    db.commit()
    cur.close()

    return {"success": True, "message": "Série ajoutée avec succès !"}
