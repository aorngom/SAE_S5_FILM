# backend/app/routers/series.py

from fastapi import APIRouter, Depends
from app.database.connection import get_db

router = APIRouter()

# ================================================================
# LISTER TOUTES LES SERIES (PageAccueil)
# ================================================================
@router.get("/api/series")
def api_series_list(db = Depends(get_db)):
    query = """
        SELECT id_serie, titre, date_sortie, description, image
        FROM serie
        ORDER BY id_serie;
    """

    cur = db.cursor()
    cur.execute(query)
    rows = cur.fetchall()
    cur.close()

    return [
        {
            "id_serie": r["id_serie"],
            "titre": r["titre"],
            "date_sortie": r["date_sortie"],
            "description": r["description"],
            "image": r["image"] or "default.jpg"
        }
        for r in rows
    ]
