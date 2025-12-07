# backend/app/services/series_service.py
from sqlalchemy.orm import Session
from fastapi import Depends
from typing import Any, Dict, List, Optional

# ================================================================
# CHARGE TOUTES LES SERIES (version SQL)
# ================================================================
def load_all_series(db: Session) -> List[Dict[str, Any]]:
    query = """
        SELECT Id_serie, titre, date_sortie, description
        FROM serie
        ORDER BY Id_serie;
    """
    rows = db.execute(query).fetchall()

    return [
        {
            "Id_serie": r.Id_serie,
            "titre": r.titre,
            "date_sortie": r.date_sortie,
            "description": r.description
        }
        for r in rows
    ]


# ================================================================
# RECUPERER UNE SERIE PAR ID (version SQL)
# ================================================================
def get_series_by_id(db: Session, serie_id: int) -> Optional[Dict[str, Any]]:
    query = """
        SELECT Id_serie, titre, date_sortie, description
        FROM serie
        WHERE Id_serie = :id;
    """
    r = db.execute(query, {"id": serie_id}).fetchone()

    if not r:
        return None

    return {
        "Id_serie": r.Id_serie,
        "titre": r.titre,
        "date_sortie": r.date_sortie,
        "description": r.description
    }
