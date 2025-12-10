# backend/app/routers/series.py

from fastapi import APIRouter, Depends
from app.database.connection import get_db

router = APIRouter()

# LISTER TOUTES LES SERIES (PageAccueil + PageAdmin)
@router.get("/api/series")
def api_series_list(db = Depends(get_db)):

    query = """
        SELECT
            s.id_serie,
            s.titre,
            s.date_sortie,
            s.description,
            s.image,

            -- 🔹 Nombre total d'épisodes
            (
                SELECT COUNT(*)
                FROM episode e
                JOIN saison sa ON e.id_saison = sa.id_saison
                WHERE sa.id_serie = s.id_serie
            ) AS total_episodes,

            -- 🔹 Nombre total de saisons
            (
                SELECT COUNT(*)
                FROM saison sa2
                WHERE sa2.id_serie = s.id_serie
            ) AS total_saisons

        FROM serie s
        ORDER BY s.id_serie;
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
            "image": r["image"] or "default.jpg",
            "episodes": r["total_episodes"],
            "saisons": r["total_saisons"],
        }
        for r in rows
    ]
