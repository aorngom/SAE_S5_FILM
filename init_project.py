import os

def create_structure():
    folders = [
        'app',
        'app/routers',
        'app/models',
        'app/database',
        'app/search',
        'templates',
        'static/css',
        'static/js',
        'data'
    ]
    
    for folder in folders:
        os.makedirs(folder, exist_ok=True)
        print(f"Dossier cree: {folder}")
    
    init_files = [
        'app/__init__.py',
        'app/routers/__init__.py',
        'app/models/__init__.py',
        'app/database/__init__.py',
        'app/search/__init__.py'
    ]
    
    for file in init_files:
        open(file, 'a').close()
        print(f"Fichier cree: {file}")
    
    main_py = """from fastapi import FastAPI, Request
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
    return templates.TemplateResponse("index.html", {"request": request})

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
"""
    
    with open('app/main.py', 'w', encoding='utf-8') as f:
        f.write(main_py)
    print("Fichier cree: app/main.py")
    
    index_html = """<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recherche de Films</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            max-width: 600px;
            width: 100%;
        }
        h1 { color: #333; margin-bottom: 30px; text-align: center; }
        .search-box { display: flex; gap: 10px; margin-bottom: 20px; }
        input[type="text"] {
            flex: 1;
            padding: 15px;
            border: 2px solid #ddd;
            border-radius: 10px;
            font-size: 16px;
        }
        button {
            padding: 15px 30px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
        }
        #results { margin-top: 30px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Moteur de Recherche de Films</h1>
        <div class="search-box">
            <input type="text" id="searchInput" placeholder="Entrez un mot-cle">
            <button onclick="searchFilms()">Rechercher</button>
        </div>
        <div id="results"></div>
    </div>
    <script>
        async function searchFilms() {
            const query = document.getElementById('searchInput').value;
            const resultsDiv = document.getElementById('results');
            if (!query.trim()) {
                resultsDiv.innerHTML = '<p>Veuillez entrer un mot-cle</p>';
                return;
            }
            resultsDiv.innerHTML = '<p>Recherche en cours...</p>';
            try {
                const response = await fetch('/api/search?query=' + encodeURIComponent(query), { method: 'POST' });
                const data = await response.json();
                resultsDiv.innerHTML = '<p>Resultats: ' + data.count + '</p>';
            } catch (error) {
                resultsDiv.innerHTML = '<p>Erreur</p>';
            }
        }
    </script>
</body>
</html>
"""
    
    with open('templates/index.html', 'w', encoding='utf-8') as f:
        f.write(index_html)
    print("Fichier cree: templates/index.html")
    
    gitignore = """venv/
__pycache__/
*.pyc
.env
*.db
"""
    
    with open('.gitignore', 'w') as f:
        f.write(gitignore)
    print("Fichier cree: .gitignore")
    
    requirements = """fastapi==0.115.0
uvicorn[standard]==0.30.6
jinja2==3.1.4
python-multipart==0.0.9
"""
    
    with open('requirements.txt', 'w') as f:
        f.write(requirements)
    print("Fichier cree: requirements.txt")
    
    print("\nProjet cree! Lancez: uvicorn app.main:app --reload")

if __name__ == "__main__":
    create_structure()
