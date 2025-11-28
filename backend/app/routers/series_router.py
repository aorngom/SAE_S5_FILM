from fastapi import APIRouter, HTTPException
from app.services.series_service import load_all_series, get_series_by_id

router = APIRouter()

@router.get("/api/series")
def api_get_all_series():
    return load_all_series()

@router.get("/api/series/{id}")
def api_get_series(id: int):
    series = load_all_series()
    serie = get_series_by_id(series, id)

    if not serie:
        raise HTTPException(status_code=404, detail="Série introuvable")

    return serie
