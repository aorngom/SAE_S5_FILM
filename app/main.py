from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates

app = FastAPI(
    title="Moteur de Recherche de Films",
    description="API de recherche de films par mots-cles",
    version="1.0.0"
)

app.mount("/static", StaticFiles(directory="static"), name="static")
templates = Jinja2Templates(directory="templates")

@app.get("/", response_class=HTMLResponse)
async def read_root(request: Request):
    return templates.TemplateResponse("home.html", {"request": request})

@app.get("/api/health")
async def health_check():
    return {"status": "ok", "message": "API operationnelle"}

@app.post("/api/search")
async def search_films(query: str):
    return {
        "query": query,
        "results": [],
        "count": 0
    }
