# backend/app/services/user_service.py

from typing import Optional, Dict, Any
from app.database.connection import get_db


# ================================================================
# GET USER BY IDENTIFIANT (PSYCOPG2)
# ================================================================
def get_user_by_identifiant(identifiant: str) -> Optional[Dict[str, Any]]:
    conn = get_db()
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

    if not row:
        return None

    return {
        "identifiant": row["identifiant"],
        "email": row["email"],
        "mdp": row["mdp"],
        "mdp_clair": row["mdp_clair"],
        "type_utilisateur": row["type_utilisateur"],
        "prenom": row["prenom"],
        "nom": row["nom"],
        "adresse": row["adresse"],
        "telephone": row["telephone"]
    }


# ================================================================
# UPDATE USER (PSYCOPG2)
# ================================================================
def update_user(identifiant: str, new_data: dict) -> bool:
    conn = get_db()
    cur = conn.cursor()

    # Vérifier existence utilisateur
    cur.execute("SELECT id_utilisateur FROM utilisateur WHERE identifiant = %s;", (identifiant,))
    exists = cur.fetchone()

    if not exists:
        cur.close()
        conn.close()
        return False

    # Champs modifiables
    allowed = ["email", "prenom", "nom", "adresse", "telephone", "mdp", "mdp_clair"]
    data = {k: v for k, v in new_data.items() if k in allowed}

    if not data:
        cur.close()
        conn.close()
        return False

    # Construction dynamique du SET
    set_clause = ", ".join([f"{key} = %s" for key in data.keys()])
    values = list(data.values())
    values.append(identifiant)

    query = f"""
        UPDATE utilisateur
        SET {set_clause}
        WHERE identifiant = %s;
    """

    cur.execute(query, values)
    conn.commit()

    cur.close()
    conn.close()

    return True
