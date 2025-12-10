from typing import Optional, Dict, Any
from app.database.connection import get_db


# Récupère un utilisateur
def get_user_by_identifiant(identifiant: str) -> Optional[Dict[str, Any]]:
    conn = next(get_db())
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
    conn.close()

    return dict(row) if row else None


# Met à jour un utilisateur
def update_user(identifiant: str, new_data: dict) -> bool:
    conn = next(get_db())
    cur = conn.cursor()

    cur.execute("SELECT 1 FROM utilisateur WHERE identifiant = %s;", (identifiant,))
    if not cur.fetchone():
        cur.close()
        conn.close()
        return False

    allowed = ["email", "prenom", "nom", "adresse", "telephone", "mdp", "mdp_clair"]
    fields = {k: v for k, v in new_data.items() if k in allowed}

    if not fields:
        cur.close()
        conn.close()
        return False

    set_clause = ", ".join([f"{k} = %s" for k in fields.keys()])
    values = list(fields.values()) + [identifiant]

    query = f"UPDATE utilisateur SET {set_clause} WHERE identifiant = %s;"
    cur.execute(query, values)
    conn.commit()

    cur.close()
    conn.close()

    return True
