from fastapi import APIRouter, HTTPException
from app.services.series_service import load_all_series, get_series_by_id

router = APIRouter()

# ---- LISTER TOUTES LES SERIES ----
@router.get("/api/series")
async def api_series_list():
    return load_all_series()

# ---- OBTENIR UNE SERIE PAR ID ----
@router.get("/api/series/{id}")
async def api_get_series(id: int):
    series = load_all_series()
    serie = get_series_by_id(series, id)

    if not serie:
        raise HTTPException(status_code=404, detail="Série introuvable")

    return serie