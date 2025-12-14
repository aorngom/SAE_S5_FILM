# backend/app/database/connection.py

# Ce fichier n'est pas utilisé dans le projet. il contient juste la connexion vers la base de données local. Si j'ai besoin de tester quelque chose dessus 
# avant de faire la requête au niveau de la bdd hebergé par exemple, je vais juste mettre ce code dans connection.py pour les tests.

import psycopg2
from psycopg2.extras import RealDictCursor


# ===== CONFIGURATION =====
DB_NAME = "sae_series"
DB_USER = "sae_user"
DB_PASSWORD = "SAESERIES"
DB_HOST = "localhost"
DB_PORT = "5432"


# ===== FONCTION DE CONNEXION COMPATIBLE FASTAPI =====
def get_db():
    conn = psycopg2.connect(
        dbname=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD,
        host=DB_HOST,
        port=DB_PORT,
        cursor_factory=RealDictCursor
    )
    try:
        yield conn                #  FastAPI récupère la connexion ici
    finally:
        conn.close()              #  ferme proprement après la requête
        
