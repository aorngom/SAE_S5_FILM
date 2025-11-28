import json
from pathlib import Path

USERS_PATH = Path("static/data/users.json")

def load_users():
    with open(USERS_PATH, "r", encoding="utf-8") as f:
        return json.load(f)

def save_users(users):
    with open(USERS_PATH, "w", encoding="utf-8") as f:
        json.dump(users, f, indent=4, ensure_ascii=False)

def get_user_by_identifiant(identifiant: str):
    users = load_users()
    for u in users:
        if u["identifiant"] == identifiant:
            return u
    return None

def update_user(identifiant: str, new_data: dict):
    users = load_users()
    for u in users:
        if u["identifiant"] == identifiant:
            u.update(new_data)
            save_users(users)
            return True
    return False
