#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
generate_sql_with_awards.py
Génère un fichier SQL incluant les prix (via Wikidata) pour les séries listées dans le dossier.
Schéma PostgreSQL : serie, saison, episode, genre, prix, recevoir, personne, role, jouer, participer.
VERSION AMÉLIORÉE avec meilleure recherche
"""

import requests
import time
from pathlib import Path
import re
import difflib

# ---------------- CONFIG ----------------
ROOT = r"C:\Users\adslc\3D Objects\SAE_S5_FILM\Préparation des données\sous_titres_extraits"
OUT_SQL = r"C:\Users\adslc\3D Objects\SAE_S5_FILM\Script BD PostgreSQL\insert_series_data.sql"
TMDB_API_KEY = "aaff78ef37354e874c47636ac74c9740"
TMDB_BASE = "https://api.themoviedb.org/3"
SLEEP = 0.25
TOP_CAST = 8
SIMILARITY_THRESHOLD = 0.6  # Réduit de 0.7 à 0.6 pour plus de flexibilité

# ---------------- HELPERS ----------------
def sql_escape(val):
    if val is None:
        return "NULL"
    s = str(val).replace("'", "''").replace("\n"," ").strip()
    return f"'{s}'"

def tmdb_get(endpoint, params=None):
    if params is None:
        params = {}
    params["api_key"] = TMDB_API_KEY
    r = requests.get(f"{TMDB_BASE}/{endpoint}", params=params)
    r.raise_for_status()
    time.sleep(SLEEP)
    return r.json()

def tmdb_search_tv(query, language="en-US"):
    return tmdb_get("search/tv", {"query": query, "language": language}).get("results", [])

def tmdb_get_tv_details(tv_id):
    return tmdb_get(f"tv/{tv_id}", {"language": "fr-FR"})

def tmdb_get_tv_credits(tv_id):
    return tmdb_get(f"tv/{tv_id}/credits")

def tmdb_get_tv_season(tv_id, season_number):
    return tmdb_get(f"tv/{tv_id}/season/{season_number}", {"language": "fr-FR"})

def wikidata_get_awards(series_label):
    query = """
    SELECT ?awardLabel WHERE {
      ?item rdfs:label "%s"@fr.
      ?item wdt:P31/wdt:P279* wd:Q5398426.
      ?item p:P166 ?awardStatement.
      ?awardStatement ps:P166 ?award.
      SERVICE wikibase:label { bd:serviceParam wikibase:language "fr,en". }
    }
    """ % series_label.replace('"','\\"')
    url = "https://query.wikidata.org/sparql"
    headers = {"Accept":"application/sparql-results+json"}
    try:
        r = requests.get(url, params={"query": query}, headers=headers, timeout=30)
        if r.status_code != 200:
            return []
        data = r.json().get("results",{}).get("bindings",[])
        awards = [b["awardLabel"]["value"] for b in data if "awardLabel" in b]
        return list(set(awards))
    except:
        return []

def gather_series_list(root):
    path = Path(root)
    if not path.exists():
        raise FileNotFoundError(f"Dossier {root} introuvable.")
    return [p.name for p in path.iterdir() if p.is_dir()]

def normalize_title(name):
    """Normalise un titre pour comparaison: minuscule + suppression des caractères non alphanumériques"""
    if not name:
        return ""
    return re.sub(r"[^a-z0-9]", "", name.lower())

def add_spaces_to_camelcase(text):
    """Transforme 'coldcase' en 'cold case', 'breakingbad' en 'breaking bad', etc."""
    # Insère des espaces avant les majuscules
    text = re.sub(r'([a-z])([A-Z])', r'\1 \2', text)
    
    # Détecte les mots composés communs en anglais/français
    common_patterns = [
        (r'(\w+)(galactica)', r'\1 \2'),
        (r'(\w+)(woman)', r'\1 \2'),
        (r'(\w+)(notice)', r'\1 \2'),
        (r'(\w+)(minds)', r'\1 \2'),
        (r'(\w+)(sexy)(money)', r'\1 \2 \3'),
        (r'(\w+)(hour)', r'\1 \2'),
        (r'(\w+)(itself)', r'\1 \2'),
        (r'(\w+)(of)(the)(conchords)', r'\1 \2 \3 \4'),
        (r'(\w+)(night)(lights)', r'\1 \2 \3'),
        (r'(\w+)(unmarried)', r'\1 \2'),
        (r'(\w+)(anatomy)', r'\1 \2'),
        (r'(\w+)(i)(met)(your)(mother)', r'\1 \2 \3 \4 \5'),
        (r'(\w+)(from)(cincinnati)', r'\1 \2 \3'),
        (r'(\w+)(xy)', r'\1 \2'),
        (r'(\w+)(of)(the)(seeker)', r'\1 \2 \3 \4'),
        (r'(\w+)(to)(me)', r'\1 \2 \3'),
        (r'(\w+)(of)(scifi)', r'\1 \2 \3'),
        (r'(\w+)(place)', r'\1 \2'),
        (r'(\w+)(name)(is)(earl)', r'\1 \2 \3'),
        (r'(\w+)(los)(angeles)', r'\1 \2 \3'),
        (r'(\w+)(tree)(hill)', r'\1 \2 \3'),
        (r'(\w+)(jane)', r'\1 \2'),
        (r'(\w+)(practice)', r'\1 \2'),
        (r'(\w+)(daisies)', r'\1 \2'),
        (r'(\w+)(who)', r'\1 \2'),
        (r'(\w+)(and)(the)(city)', r'\1 \2 \3 \4'),
        (r'(\w+)(feet)(under)', r'\1 \2 \3'),
        (r'(\w+)(of)(anarchy)', r'\1 \2 \3'),
        (r'(\w+)(park)', r'\1 \2'),
        (r'(\w+)(atlantis)', r'\1 \2'),
        (r'(\w+)(4400)', r'\1 \2'),
        (r'(\w+)(big)(bang)(theory)', r'\1 \2 \3 \4'),
        (r'(\w+)(black)(donnellys)', r'\1 \2 \3'),
        (r'(\w+)(kill)(point)', r'\1 \2 \3'),
        (r'(\w+)(lost)(room)', r'\1 \2 \3'),
        (r'(\w+)(nine)', r'\1 \2'),
        (r'(\w+)(oc)', r'\1 \2'),
        (r'(\w+)(pretender)', r'\1 \2'),
        (r'(\w+)(sarah)(connor)(chronicles)', r'\1 \2 \3 \4'),
        (r'(\w+)(shield)', r'\1 \2'),
        (r'(\w+)(sopranos)', r'\1 \2'),
        (r'(\w+)(tudors)', r'\1 \2'),
        (r'(\w+)(murder)(club)', r'\1 \2 \3'),
        (r'(\w+)(mars)', r'\1 \2'),
        (r'(\w+)(blood)', r'\1 \2'),
        (r'(\w+)(calling)', r'\1 \2'),
        (r'(\w+)(wire)', r'\1 \2'),
        (r'(\w+)(treatment)', r'\1 \2'),
        (r'(\w+)(sg)(1)', r'\1 \2 \3'),
        (r'(\w+)(off)(ted)', r'\1 \2 \3'),
        (r'(\w+)(vampire)(diaries)', r'\1 \2 \3'),
        (r'(\w+)(case)', r'\1 \2'),      # coldcase -> cold case
        (r'(\w+)(bad)', r'\1 \2'),       # breakingbad -> breaking bad
        (r'(\w+)(break)', r'\1 \2'),     # daybreak -> day break
        (r'(\w+)(girl)', r'\1 \2'),      # gossipgirl -> gossip girl
        (r'(\w+)(whisperer)', r'\1 \2'), # ghostwhisperer -> ghost whisperer
        (r'(\w+)(island)', r'\1 \2'),    # desertisland -> desert island
        (r'(\w+)(house)', r'\1 \2'),     # dollhouse -> doll house
        (r'(\w+)(wood)', r'\1 \2'),      # torchwood -> torch wood
        (r'(\w+)(land)', r'\1 \2'),      # supernatural -> super natural
        (r'(\w+)(rider)', r'\1 \2'),     # knightrider -> knight rider
        (r'(\w+)(wars)', r'\1 \2'),      # starwars -> star wars
        (r'(\w+)(men)', r'\1 \2'),       # madmen -> mad men
        (r'(\w+)(office)', r'\1 \2'),    # theoffice -> the office
        (r'(\w+)(point)', r'\1 \2'),     # thekillpoint -> the kill point
        (r'(\w+)(room)', r'\1 \2'),      # thelostroom -> the lost room
        (r'(\w+)(betty)', r'\1 \2'),     # uglybetty -> ugly betty
        (r'(\w+)(chapel)', r'\1 \2'),    # whitechapel -> white chapel
    ]
    
    text_lower = text.lower()
    for pattern, replacement in common_patterns:
        if re.search(pattern, text_lower):
            text = re.sub(pattern, replacement, text, flags=re.IGNORECASE)
            break
    
    return text

def clean_folder_name(folder):
    """Nettoie le nom du dossier pour créer une requête de recherche optimale"""
    # Ajoute des espaces si nécessaire (camelCase, mots collés)
    cleaned = add_spaces_to_camelcase(folder)
    
    # Enlève les underscores et tirets
    cleaned = cleaned.replace('_', ' ').replace('-', ' ')
    
    # Nettoie les espaces multiples
    cleaned = re.sub(r'\s+', ' ', cleaned).strip()
    
    return cleaned

def best_match(folder_name, results):
    """Retourne le résultat TMDb le plus proche du nom du dossier"""
    folder_norm = normalize_title(folder_name)
    best = None
    best_score = 0
    
    for r in results:
        # Compare avec le titre principal
        tv_norm = normalize_title(r.get("name", ""))
        score = difflib.SequenceMatcher(None, folder_norm, tv_norm).ratio()
        
        # Compare aussi avec le titre original si différent
        original_name = r.get("original_name", "")
        if original_name and original_name != r.get("name"):
            original_norm = normalize_title(original_name)
            score_original = difflib.SequenceMatcher(None, folder_norm, original_norm).ratio()
            score = max(score, score_original)
        
        if score > best_score:
            best_score = score
            best = r
    
    if best_score >= SIMILARITY_THRESHOLD:
        return best, best_score
    
    return None, best_score

def find_tv_series(folder):
    """Recherche une série sur TMDb avec stratégies multiples"""
    
    # Stratégie 1 : Recherche directe en anglais avec le nom du dossier
    results = tmdb_search_tv(folder, "en-US")
    if results:
        if len(results) == 1:
            return results[0], 1.0, "direct_single_en"
        match, score = best_match(folder, results)
        if match:
            return match, score, "direct_match_en"
    
    # Stratégie 2 : Nettoyage du nom du dossier et recherche en anglais
    cleaned = clean_folder_name(folder)
    if cleaned != folder:
        print(f"  🔍 Recherche alternative : '{cleaned}'")
        results = tmdb_search_tv(cleaned, "en-US")
        if results:
            if len(results) == 1:
                return results[0], 1.0, "cleaned_single_en"
            match, score = best_match(cleaned, results)
            if match:
                return match, score, "cleaned_match_en"
    
    # Stratégie 3 : Recherche en français comme fallback
    print(f"  🔍 Tentative en français...")
    results_fr = tmdb_search_tv(cleaned or folder, "fr-FR")
    if results_fr:
        match, score = best_match(folder, results_fr)
        if match:
            return match, score, "french_match"
    
    return None, 0.0, "not_found"

# ---------------- MAIN ----------------
def build_sql():
    lines = []
    lines.append("-- SQL généré avec TMDb + Wikidata (prix inclus)")
    lines.append("BEGIN;")
    lines.append("-- Roles")
    lines.append("INSERT INTO role (libelle) VALUES ('Acteur'), ('Créateur'), ('Réalisateur') ON CONFLICT DO NOTHING;")
    lines.append("")

    series_list = gather_series_list(ROOT)
    print(f"{len(series_list)} séries à traiter.\n")

    not_found_count = 0
    found_series = []
    not_found_series = []

    for idx, folder in enumerate(series_list, 1):
        print(f"[{idx}/{len(series_list)}] Traitement : {folder}")

        tv_data, score, strategy = find_tv_series(folder)
        
        if not tv_data:
            print(f"  ❌ Aucun résultat TMDb pour {folder}")
            lines.append(f"-- Série non trouvée : {folder}")
            lines.append(f"INSERT INTO serie (titre, date_sortie, description) VALUES ({sql_escape(folder)}, NULL, NULL);")
            not_found_count += 1
            not_found_series.append(folder)
            lines.append("")
            continue

        tv_id = tv_data["id"]
        print(f"  ✅ Trouvée : {tv_data.get('name')} (score: {score:.2f}, stratégie: {strategy})")
        found_series.append((folder, tv_data.get('name'), score, strategy))
        
        try:
            details = tmdb_get_tv_details(tv_id)
            credits = tmdb_get_tv_credits(tv_id)

            titre = details.get("name")
            date_sortie = details.get("first_air_date")
            description = details.get("overview")

            lines.append(f"-- Série : {titre} (dossier: {folder})")
            lines.append(f"INSERT INTO serie (titre, date_sortie, description) VALUES ({sql_escape(titre)}, {sql_escape(date_sortie)}, {sql_escape(description)});")

            # Genres
            for g in details.get("genres", []):
                lib = g.get("name")
                lines.append(f"INSERT INTO genre (libelle) VALUES ({sql_escape(lib)}) ON CONFLICT DO NOTHING;")
                lines.append(f"INSERT INTO posseder (Id_serie, Id_genre) VALUES ((SELECT Id_serie FROM serie WHERE titre={sql_escape(titre)}), (SELECT Id_genre FROM genre WHERE libelle={sql_escape(lib)})) ON CONFLICT DO NOTHING;")

            # Saisons & épisodes
            for s in details.get("seasons", []):
                num = s.get("season_number")
                desc = s.get("name") or f"Saison {num}"
                lines.append(f"INSERT INTO saison (numero, description, Id_serie) VALUES ({num}, {sql_escape(desc)}, (SELECT Id_serie FROM serie WHERE titre={sql_escape(titre)}));")
                if num == 0:
                    continue
                try:
                    season_info = tmdb_get_tv_season(tv_id, num)
                    for ep in season_info.get("episodes", []):
                        ep_num = ep.get("episode_number")
                        runtime = ep.get("runtime") or 0
                        lines.append(f"INSERT INTO episode (numero, duree, Id_saison) VALUES ({ep_num}, {sql_escape(str(runtime))}, (SELECT Id_saison FROM saison WHERE numero={num} AND Id_serie=(SELECT Id_serie FROM serie WHERE titre={sql_escape(titre)})));")
                except Exception as e:
                    print(f"  ⚠ Erreur saisons/episodes {titre} saison {num} : {e}")

            # Personnes : créateurs
            for c in details.get("created_by", []):
                name = c.get("name")
                parts = name.split()
                prenom = parts[0] if parts else ""
                nom = " ".join(parts[1:]) if len(parts)>1 else ""
                lines.append(f"INSERT INTO personne (nom, prenom) VALUES ({sql_escape(nom)}, {sql_escape(prenom)}) ON CONFLICT DO NOTHING;")
                lines.append(f"INSERT INTO jouer (Id_role, Id_personne) VALUES ((SELECT Id_role FROM role WHERE libelle='Créateur'), (SELECT Id_personne FROM personne WHERE nom={sql_escape(nom)} AND prenom={sql_escape(prenom)})) ON CONFLICT DO NOTHING;")
                lines.append(f"INSERT INTO participer (Id_serie, Id_personne) VALUES ((SELECT Id_serie FROM serie WHERE titre={sql_escape(titre)}), (SELECT Id_personne FROM personne WHERE nom={sql_escape(nom)} AND prenom={sql_escape(prenom)})) ON CONFLICT DO NOTHING;")

            # Acteurs
            for c in credits.get("cast", [])[:TOP_CAST]:
                name = c.get("name")
                parts = name.split()
                prenom = parts[0] if parts else ""
                nom = " ".join(parts[1:]) if len(parts)>1 else ""
                lines.append(f"INSERT INTO personne (nom, prenom) VALUES ({sql_escape(nom)}, {sql_escape(prenom)}) ON CONFLICT DO NOTHING;")
                lines.append(f"INSERT INTO jouer (Id_role, Id_personne) VALUES ((SELECT Id_role FROM role WHERE libelle='Acteur'), (SELECT Id_personne FROM personne WHERE nom={sql_escape(nom)} AND prenom={sql_escape(prenom)})) ON CONFLICT DO NOTHING;")
                lines.append(f"INSERT INTO participer (Id_serie, Id_personne) VALUES ((SELECT Id_serie FROM serie WHERE titre={sql_escape(titre)}), (SELECT Id_personne FROM personne WHERE nom={sql_escape(nom)} AND prenom={sql_escape(prenom)})) ON CONFLICT DO NOTHING;")

            # Réalisateurs
            for crew in credits.get("crew", []):
                if "director" in crew.get("job","").lower():
                    name = crew.get("name")
                    parts = name.split()
                    prenom = parts[0] if parts else ""
                    nom = " ".join(parts[1:]) if len(parts)>1 else ""
                    lines.append(f"INSERT INTO personne (nom, prenom) VALUES ({sql_escape(nom)}, {sql_escape(prenom)}) ON CONFLICT DO NOTHING;")
                    lines.append(f"INSERT INTO jouer (Id_role, Id_personne) VALUES ((SELECT Id_role FROM role WHERE libelle='Réalisateur'), (SELECT Id_personne FROM personne WHERE nom={sql_escape(nom)} AND prenom={sql_escape(prenom)})) ON CONFLICT DO NOTHING;")
                    lines.append(f"INSERT INTO participer (Id_serie, Id_personne) VALUES ((SELECT Id_serie FROM serie WHERE titre={sql_escape(titre)}), (SELECT Id_personne FROM personne WHERE nom={sql_escape(nom)} AND prenom={sql_escape(prenom)})) ON CONFLICT DO NOTHING;")

            # Prix via Wikidata
            awards = wikidata_get_awards(titre)
            for award in awards:
                lines.append(f"INSERT INTO prix (libelle) VALUES ({sql_escape(award)}) ON CONFLICT DO NOTHING;")
                lines.append(f"INSERT INTO recevoir (Id_serie, Id_prix) VALUES ((SELECT Id_serie FROM serie WHERE titre={sql_escape(titre)}), (SELECT Id_prix FROM prix WHERE libelle={sql_escape(award)})) ON CONFLICT DO NOTHING;")

            lines.append("")  # espace
            
        except Exception as e:
            print(f"  ❌ Erreur lors du traitement de {folder}: {e}")
            not_found_count += 1
            not_found_series.append(folder)

    lines.append("COMMIT;")

    with open(OUT_SQL, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    # Statistiques finales
    percent_not_found = (not_found_count / len(series_list)) * 100
    percent_found = 100 - percent_not_found
    
    print("\n" + "="*60)
    print("📊 STATISTIQUES FINALES")
    print("="*60)
    print(f"✅ Séries trouvées : {len(found_series)} / {len(series_list)} ({percent_found:.2f}%)")
    print(f"❌ Séries non trouvées : {not_found_count} / {len(series_list)} ({percent_not_found:.2f}%)")
    
    if not_found_series:
        print("\n🔍 Séries non trouvées :")
        for series in not_found_series:
            print(f"  - {series}")
    
    print(f"\n✅ Fichier SQL généré : {OUT_SQL}")

if __name__ == "__main__":
    build_sql()