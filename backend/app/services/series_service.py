import json
from pathlib import Path
from typing import Any, Dict, List, Optional

BASE_DIR = Path(__file__).resolve().parents[2]   # -> backend/
DATA_DIR = BASE_DIR / "data"
SERIES_PATH = DATA_DIR / "series.json"

def load_all_series() -> List[Dict[str, Any]]:
    if not SERIES_PATH.exists():
        print(" series.json introuvable :", SERIES_PATH)
        return []

    with open(SERIES_PATH, "r", encoding="utf-8") as f:
        data = json.load(f)

    # Si c’est déjà une liste de listes -> flatten
    if len(data) > 0 and isinstance(data[0], list):
        flat = []
        for block in data:
            flat.extend(block)
        return flat
    
    # Sinon c’est une liste simple
    return data


def get_series_by_id(series: List[Dict[str, Any]], serie_id: int) -> Optional[Dict[str, Any]]:
    for s in series:
        if int(s.get("Id_serie", -1)) == int(serie_id):
            return s
    return None
