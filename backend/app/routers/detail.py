# backend/app/routers/detail.py
# Router pour la page détail + endpoint JSON

from pathlib import Path

from fastapi import APIRouter, Request, HTTPException
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates

from app.services.series_service import load_all_series, get_series_by_id

BASE_DIR = Path(__file__).resolve().parents[3]  # -> SAE_FILMS/
TEMPLATES_DIR = BASE_DIR / "frontend" / "templates"

templates = Jinja2Templates(directory=str(TEMPLATES_DIR))
router = APIRouter()


# === PAGE DETAIL (HTML) ===
@router.get("/detail", response_class=HTMLResponse)
async def detail_page(request: Request):
    return templates.TemplateResponse("PageDetailSeries.html", {"request": request})


# === ENDPOINT API JSON DETAIL ===
@router.get("/api/series/{id}")
async def api_series_detail(id: int):
    serie = get_series_by_id(id)
    if not serie:
        raise HTTPException(status_code=404, detail="Série introuvable")
    return serie
