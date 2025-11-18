import requests
import os
import regex as re

# Configuration API
api_key = '4d773f9b'
base_url = f'http://www.omdbapi.com/?apikey={api_key}'

def get_serie_info(title):
    """Récupère les informations d'une série depuis OMDb API"""
    url = f"{base_url}&t={title}"
    response = requests.get(url)
    return response.json()

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
        (r'(\w+)(tuck)', r'\1 \2'),
        (r'(\w+)(universe)', r'\1 \2'),
        (r'(\w+)(riches)', r'\1 \2'),
        (r'(\w+)(files)', r'\1 \2'),
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
    cleaned = cleaned.replace('_', ' ').replace('-', ' ').replace('_VF.txt', ' ').replace('_VO.txt', ' ')
    
    # Nettoie les espaces multiples
    cleaned = re.sub(r'\s+', ' ', cleaned).strip()
    
    return cleaned

def corriger_nom_serie(nom_dossier):
    """Corrige le nom des dossiers avec toutes les stratégies de nettoyage"""
    
    # Dictionnaire de corrections manuelles pour les cas spécifiques
    corrections_manuelles = {
        'thementalist': 'the mentalist',
        'gameofthrones': 'game of thrones',
        'breakingbad': 'breaking bad',
        'strangerthings': 'stranger things',
        'thebigbangtheory': 'the big bang theory',
        'howimetyourmother': 'how i met your mother',
        'thegoodwife': 'the good wife',
        'theblacklist': 'the blacklist',
        'thevampirediaries': 'the vampire diaries',
        'coldcase': 'cold case',
        'gossipgirl': 'gossip girl',
        'ghostwhisperer': 'ghost whisperer',
        'dollhouse': 'dollhouse',
        'torchwood': 'torchwood',
        'knightrider': 'knight rider',
        'starwars': 'star wars',
        'madmen': 'mad men',
        'theoffice': 'the office',
        'uglybetty': 'ugly betty',
        'whitechapel': 'whitechapel',
        'mastersofscifi': 'masters of science fiction'
    }
    
    # Vérifier d'abord les corrections manuelles
    nom_lower = nom_dossier.lower()
    if nom_lower in corrections_manuelles:
        return corrections_manuelles[nom_lower]
    
    # Appliquer le nettoyage automatique
    nom_corrige = clean_folder_name(nom_dossier)
    
    # Si le nettoyage n'a pas changé le nom, essayer d'ajouter des espaces
    if nom_corrige == nom_dossier:
        # Essayer d'ajouter des espaces avant les majuscules
        nom_corrige = re.sub(r'([a-z])([A-Z])', r'\1 \2', nom_dossier)
        
        # Si toujours pas de changement, essayer de détecter les mots communs
        if nom_corrige == nom_dossier:
            # Détecter les préfixes courants
            prefixes = ['the', 'how', 'what', 'when', 'where', 'why', 'my', 'your', 'our']
            for prefix in prefixes:
                if nom_lower.startswith(prefix) and len(nom_lower) > len(prefix):
                    # Vérifier si le reste du nom commence par une majuscule
                    rest = nom_dossier[len(prefix):]
                    if rest and rest[0].isupper():
                        nom_corrige = prefix + ' ' + rest
                        break
    
    # Nettoyer les espaces multiples et finaliser
    nom_corrige = re.sub(r'\s+', ' ', nom_corrige).strip()
    
    # Capitaliser correctement (première lettre de chaque mot en majuscule)
    nom_corrige = ' '.join(word.capitalize() for word in nom_corrige.split())
    
    # Corrections spécifiques pour les articles
    corrections_articles = {
        'The The': 'The',
        'A A': 'A',
        'An An': 'An'
    }
    
    for wrong, correct in corrections_articles.items():
        if wrong in nom_corrige:
            nom_corrige = nom_corrige.replace(wrong, correct)
    return nom_corrige

def generer_sql_serie(serie_info):
    """Génère les scripts SQL pour insérer une série et ses données associées"""
    scripts_sql = []
    
    # Échapper les apostrophes pour SQL
    title = serie_info.get('Title', '').replace("'", "''")
    plot = serie_info.get('Plot', '').replace("'", "''")
    
    # 1. Insertion dans la table 'serie'
    sql_serie = f"""
-- Insertion de la série : {serie_info.get('Title', 'Inconnu')}
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    '{title}',
    '{serie_info.get('Released', 'N/A')}',
    '{plot}'
);
"""
    scripts_sql.append(sql_serie)
    
    # 2. Gestion des genres
    genres = serie_info.get('Genre', '').split(', ')
    for genre in genres:
        if genre.strip():
            genre_clean = genre.strip().replace("'", "''")
            sql_genre = f"""
-- Insertion du genre : {genre_clean}
INSERT INTO genre (libelle) 
SELECT '{genre_clean}'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = '{genre_clean}');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = '{title}' AND g.libelle = '{genre_clean}';
"""
            scripts_sql.append(sql_genre)
    
    # 3. Gestion des prix/récompenses
    awards = serie_info.get('Awards', '')
    if awards and awards != 'N/A':
        sql_prix = f"""
-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '{awards}'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '{awards}');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = '{title}' AND p.libelle = '{awards}';
"""
        scripts_sql.append(sql_prix)
    
    # 4. Gestion des personnes (acteurs, réalisateurs, scénaristes)
    # Acteurs
    actors = serie_info.get('Actors', '').split(', ')
    for actor in actors:
        if actor.strip() and actor != 'N/A':
            scripts_sql.extend(gerer_personne_et_role(actor, 'Acteur', title))
    
    # Réalisateurs
    directors = serie_info.get('Director', '').split(', ')
    for director in directors:
        if director.strip() and director != 'N/A':
            scripts_sql.extend(gerer_personne_et_role(director, 'Realisateur', title))
    
    # Scénaristes
    writers = serie_info.get('Writer', '').split(', ')
    for writer in writers:
        if writer.strip() and writer != 'N/A':
            scripts_sql.extend(gerer_personne_et_role(writer, 'Scénariste', title))
    
    return '\n'.join(scripts_sql)

def gerer_personne_et_role(nom_complet, role_libelle, serie_titre):
    """Gère l'insertion d'une personne et de son rôle"""
    scripts = []
    
    # Séparer nom et prénom
    parties = nom_complet.strip().split(' ')
    if len(parties) >= 2:
        prenom = parties[0].replace("'", "''")
        nom = ' '.join(parties[1:]).replace("'", "''")
    else:
        prenom = ''
        nom = nom_complet.replace("'", "''")
    
    if not nom: nom = 'Inconnu'
    if not prenom: prenom = 'Inconnu'
    
    # 1. Insérer la personne
    sql_personne = f"""
-- Insertion de la personne : {nom_complet}
INSERT INTO personne (nom, prenom) 
SELECT '{nom}', '{prenom}'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = '{nom}' AND prenom = '{prenom}'
);
"""
    scripts.append(sql_personne)
    
    # 2. Insérer le rôle
    role_clean = role_libelle.replace("'", "''")
    sql_role = f"""
-- Insertion du rôle : {role_libelle}
INSERT INTO role (libelle) 
SELECT '{role_clean}'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = '{role_clean}');
"""
    scripts.append(sql_role)
    
    # 3. Lier la personne au rôle
    sql_jouer = f"""
-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = '{role_clean}' 
  AND p.nom = '{nom}' 
  AND p.prenom = '{prenom}'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);
"""
    scripts.append(sql_jouer)
    
    # 4. Lier la personne à la série
    sql_participer = f"""
-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = '{serie_titre}' 
  AND p.nom = '{nom}' 
  AND p.prenom = '{prenom}'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);
"""
    scripts.append(sql_participer)
    
    return scripts

def traiter_dossiers_sous_titres(chemin_dossiers):
    """Traite tous les dossiers de sous-titres"""
    scripts_sql = []
    series_non_trouvees = []
    
    # Vérifier si le dossier existe
    if not os.path.exists(chemin_dossiers):
        print(f"❌ Le dossier '{chemin_dossiers}' n'existe pas")
        return scripts_sql, series_non_trouvees
    
    # Lister tous les fichiers texte
    fichiers = [f for f in os.listdir(chemin_dossiers) 
                if os.path.isfile(os.path.join(chemin_dossiers, f)) and f.endswith('.txt')]
    
    print(f"📁 {len(fichiers)} fichiers trouvés")
    
    # Éviter les doublons en traitant chaque série une seule fois
    series_traitees = set()
    
    for fichier in fichiers:
        print(f"\n🔍 Traitement du fichier: {fichier}")
        
        # Extraire le nom de série du nom de fichier
        # Enlever '_VF.txt' et '_VO.txt'
        nom_serie = fichier.replace('_VF.txt', '').replace('_VO.txt', '')
        
        # Si cette série a déjà été traitée, passer au fichier suivant
        if nom_serie in series_traitees:
            print(f"   ⏭️ Série déjà traitée: {nom_serie}")
            continue
            
        # Marquer cette série comme traitée
        series_traitees.add(nom_serie)
        
        # 1. Corriger le nom
        nom_corrige = corriger_nom_serie(nom_serie)
        print(f"   Nom de série extrait: {nom_serie}")
        print(f"   Nom corrigé: {nom_corrige}")
        
        # 2. Rechercher dans OMDb API
        serie_info = get_serie_info(nom_corrige)
        
        # 3. Vérifier la réponse
        if serie_info.get('Response') == 'True':
            print(f"   ✅ Série trouvée: {serie_info.get('Title')}")
            
            # 4. Stocker les informations essentielles
            infos_essentielles = {
                'Title': serie_info.get('Title'),
                'Released': serie_info.get('Released'),
                'Plot': serie_info.get('Plot'),
                'Genre': serie_info.get('Genre'),
                'Director': serie_info.get('Director'),
                'Writer': serie_info.get('Writer'),
                'Actors': serie_info.get('Actors'),
                'Awards': serie_info.get('Awards')
            }
            
            # 5. Générer le script SQL
            script_sql = generer_sql_serie(serie_info)
            scripts_sql.append(script_sql)
            
            # Afficher un résumé
            print(f"   📊 Titre: {serie_info.get('Title')}")
            print(f"   🎬 Genre: {serie_info.get('Genre')}")
            print(f"   📅 Sortie: {serie_info.get('Released')}")
            
        else:
            print(f"   ❌ Série non trouvée dans OMDb API: {nom_corrige}")
            series_non_trouvees.append(nom_corrige)
    
    return scripts_sql, series_non_trouvees

# Exécution du programme
if __name__ == "__main__":
    ROOT = r"C:\Users\adslc\3D Objects\SAE_S5_FILM\backend\data\sous_titres_nettoyes"
    OUT_SQL = r"C:\Users\adslc\3D Objects\SAE_S5_FILM\backend\Préparation des données\script_sql\insertions_series.sql"
    
    print("🚀 Début du traitement des dossiers de sous-titres...")
    
    scripts_sql, series_non_trouvees = traiter_dossiers_sous_titres(ROOT)
    
    # Sauvegarder les scripts SQL
    with open(OUT_SQL, 'w', encoding='utf-8') as f:
        for script in scripts_sql:
            f.write(script + '\n')
    
    print(f"\n📊 RÉSULTATS FINAUX:")
    print(f"✅ {len(scripts_sql)} séries traitées avec succès")
    print(f"❌ {len(series_non_trouvees)} séries non trouvées")
    
    if series_non_trouvees:
        print(f"\n📋 Séries non trouvées:")
        for serie in series_non_trouvees:
            print(f"   - {serie}")
    
    print(f"\n💾 Script SQL sauvegardé dans: insertions_series.sql")