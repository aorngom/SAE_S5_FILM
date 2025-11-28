# app/routers/admin.py
from fastapi import APIRouter, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from pathlib import Path
import json

router = APIRouter()

BASE_DIR = Path(__file__).resolve().parents[3]  # dossier racine SAE_FILMS
TEMPLATES_DIR = BASE_DIR / "frontend" / "templates"
SERIES_PATH = BASE_DIR / "backend" / "data" / "series.json"

templates = Jinja2Templates(directory=str(TEMPLATES_DIR))


@router.get("/admin", response_class=HTMLResponse)
async def admin_page(request: Request):
    return templates.TemplateResponse("PageAdmin.html", {"request": request})


@router.get("/api/admin/series")
async def get_all_series():
    if not SERIES_PATH.exists():
        return {"series": []}

    with open(SERIES_PATH, "r", encoding="utf-8") as f:
        data = json.load(f)

    # On renvoie tel quel (tableau de tableaux)
    return {"series": data}
