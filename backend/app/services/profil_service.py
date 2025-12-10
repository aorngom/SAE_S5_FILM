# backend/app/services/profil_service.py

from typing import Optional, Dict, Any
from app.database.connection import get_db


# --- fonction interne pour gérer proprement get_db() ---
def _open_conn():
    gen = get_db()          # générateur FastAPI
    conn = next(gen)        # on récupère la connexion
    return conn, gen        # on garde le générateur pour le fermer plus tard


# --- GET profil par identifiant ---
def get_profil(identifiant: str) -> Optional[Dict[str, Any]]:
    conn, gen = _open_conn()

    try:
        cur = conn.cursor()

        cur.execute("""
            SELECT 
                identifiant, email, mdp, mdp_clair, type_utilisateur,
                prenom, nom, adresse, telephone
            FROM utilisateur
            WHERE identifiant = %s;
        """, (identifiant,))

        row = cur.fetchone()
        cur.close()

    finally:
        # ferme proprement la connexion via le générateur
        gen.close()

    if not row:
        return None

    # row est un dict (RealDictCursor)
    return {
        "identifiant": row["identifiant"],
        "email": row["email"],
        "mdp": row["mdp"],
        "mdp_clair": row["mdp_clair"],
        "type_utilisateur": row["type_utilisateur"],
        "prenom": row["prenom"],
        "nom": row["nom"],
        "adresse": row["adresse"],
        "telephone": row["telephone"],
    }


# --- UPDATE profil ---
def update_profil(identifiant: str, data: dict) -> bool:
    conn, gen = _open_conn()

    try:
        cur = conn.cursor()

        # Vérifier que l'utilisateur existe
        cur.execute(
            "SELECT id_utilisateur FROM utilisateur WHERE identifiant = %s;",
            (identifiant,)
        )
        exists = cur.fetchone()
        if not exists:
            cur.close()
            return False

        # Champs autorisés
        allowed = ["email", "prenom", "nom", "adresse", "telephone", "mdp", "mdp_clair"]
        fields = {k: v for k, v in data.items() if k in allowed}

        if not fields:
            cur.close()
            return False

        set_clause = ", ".join([f"{k} = %s" for k in fields.keys()])
        values = list(fields.values()) + [identifiant]

        cur.execute(f"""
            UPDATE utilisateur
            SET {set_clause}
            WHERE identifiant = %s;
        """, values)

        conn.commit()
        cur.close()

    finally:
        gen.close()

    return True
