# backend/app/database/connection.py

import psycopg2
from psycopg2.extras import RealDictCursor


# ===== CONFIGURATION NEON: BDD HEBERGÉ=====
DB_NAME = "neondb"
DB_USER = "neondb_owner"
DB_PASSWORD = "npg_lJTAnHoB83La"
DB_HOST = "ep-silent-bird-agbjq7ow-pooler.c-2.eu-central-1.aws.neon.tech"
DB_PORT = "5432"


# ===== FONCTION DE CONNEXION =====
def get_db():
    conn = psycopg2.connect(
        dbname=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD,
        host=DB_HOST,
        port=DB_PORT,
        sslmode="require",
        cursor_factory=RealDictCursor
    )
    try:
        yield conn
    finally:
        conn.close()
