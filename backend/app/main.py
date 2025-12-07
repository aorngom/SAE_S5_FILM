# backend/app/main.py

from pathlib import Path
from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates

# === CALCUL DU DOSSIER RACINE DU PROJET ===
BASE_DIR = Path(__file__).resolve().parents[2]   # SAE_FILMS/

FRONTEND_DIR = BASE_DIR / "frontend"
STATIC_DIR = FRONTEND_DIR / "static"
TEMPLATES_DIR = FRONTEND_DIR / "templates"

print("➡️ BASE_DIR =", BASE_DIR)
print("➡️ STATIC_DIR =", STATIC_DIR)
print("➡️ TEMPLATES_DIR =", TEMPLATES_DIR)

# === APP ===
app = FastAPI()

# === STATIC FILES ===
app.mount("/static", StaticFiles(directory=str(STATIC_DIR)), name="static")

# === TEMPLATES ===
templates = Jinja2Templates(directory=str(TEMPLATES_DIR))

# === ROUTERS ===
from app.routers import series, auth, detail, users, admin, recommandation, auth_register

app.include_router(series.router)
app.include_router(auth.router)     # pages + API auth
app.include_router(detail.router)
app.include_router(users.router)
app.include_router(admin.router)
app.include_router(recommandation.router)
app.include_router(auth_register.router)
# === HOME ===
@app.get("/", response_class=HTMLResponse)
async def home(request: Request):
    return templates.TemplateResponse("PageAccueil.html", {"request": request})
