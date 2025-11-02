import os
import re
from string import punctuation
from langdetect import detect
from tqdm import tqdm
from spacy import load
from spacy.lang.en.stop_words import STOP_WORDS as EN_STOP_WORDS
from spacy.lang.fr.stop_words import STOP_WORDS as FR_STOP_WORDS

# ==============================================================================
# CONFIGURATION DES CHEMINS
# ==============================================================================
# Dossier contenant les fichiers extraits par votre premier script
DOSSIER_SOURCE = "sous_titres_extraits"
# Dossier de sortie final avec la structure souhaitée
DOSSIER_CIBLE = "sous_titres_nettoyes"

# Créer le dossier cible s'il n'existe pas
os.makedirs(DOSSIER_CIBLE, exist_ok=True)

# Charger les modèles SpaCy une seule fois pour optimiser la performance
try:
    NLP_FR = load("fr_core_news_sm")
    NLP_EN = load("en_core_web_sm")
except OSError:
    print("ERREUR: Les modèles SpaCy (fr_core_news_sm ou en_core_web_sm) ne sont pas installés.")
    print("Veuillez exécuter: python -m spacy download fr_core_news_sm et en_core_web_sm")
    exit()

# Dictionnaire des stop words
STOP_WORDS = {
    'fr': FR_STOP_WORDS,
    'en': EN_STOP_WORDS
}

# ==============================================================================
# FONCTIONS DE NETTOYAGE DES PARASITES
# ==============================================================================

def nettoyer_texte_srt(chemin_fichier):
    """Supprime les numéros, timestamps et balises d'un fichier .srt."""
    try:
        # Utiliser 'latin-1' ou 'utf-8' en fonction de l'encodage de vos fichiers
        with open(chemin_fichier, 'r', encoding='utf-8', errors='ignore') as f:
            texte = f.read()
    except Exception as e:
        print(f"Erreur de lecture du fichier {chemin_fichier}: {e}")
        return ""

    # 1. Supprimer les numéros de sous-titre (lignes contenant seulement des chiffres)
    texte = re.sub(r'^\d+\s*$', '', texte, flags=re.MULTILINE)
    # 2. Supprimer les horodatages (timestamps)
    texte = re.sub(r'\d{2}:\d{2}:\d{2},\d{3} --> \d{2}:\d{2}:\d{2},\d{3}', '', texte)
    # 3. Supprimer les balises HTML/XML (ex: <i>, </i>)
    texte = re.sub(r'<.*?>', '', texte)
    # 4. Supprimer les lignes vides et les espaces multiples
    texte = re.sub(r'\n\s*\n', '\n', texte).strip()
    
    # Remplacer la ponctuation par un espace pour ne pas coller les mots
    texte_sans_ponctuation = ''.join([char if char not in punctuation else ' ' for char in texte])
    
    return texte_sans_ponctuation.lower() # Mise en minuscule

# ==============================================================================
# FONCTION DE TRAITEMENT NLP (POS TAGGING & LEMMATISATION)
# ==============================================================================

def traiter_texte_nlp(texte, langue):
    """
    Applique le POS tagging, la lemmatisation et la suppression des stop words.
    Retourne une liste de lemmes pertinents.
    """
    if langue == 'fr':
        nlp = NLP_FR
        stop_words = STOP_WORDS['fr']
    elif langue == 'en':
        nlp = NLP_EN
        stop_words = STOP_WORDS['en']
    else:
        # Langue non supportée par nos modèles NLP
        return []

    doc = nlp(texte)
    
    mots_traites = []
    for token in doc:
        # 1. Filtrer les tokens non alphabétiques (chiffres restants, symboles)
        if not token.is_alpha:
            continue
        
        # 2. Suppression des Stop Words
        if token.text in stop_words:
            continue
            
        # 3. Lemmatisation (token.lemma_)
        # 4. POS Tagging (token.pos_) - Le lemme est conservé si le POS est pertinent
        # On ne garde que les noms, adjectifs, verbes et adverbes (mots porteurs de sens)
        if token.pos_ in ('NOUN', 'ADJ', 'VERB', 'ADV'):
            mots_traites.append(token.lemma_)
            
    return mots_traites

# ==============================================================================
# FONCTION PRINCIPALE DE STRUCTURATION ET DE NETTOYAGE
# ==============================================================================

def structurer_et_nettoyer():
    """
    Parcourt les fichiers extraits, nettoie le texte, détecte la langue,
    applique le NLP et stocke le résultat dans la structure cible.
    """
    print(f"\n🚀 Démarrage de la structuration et du nettoyage NLP vers {DOSSIER_CIBLE}...")
    
    # Parcourir les dossiers de séries (niveau 1 après extraction)
    series_dirs = [d for d in os.listdir(DOSSIER_SOURCE) if os.path.isdir(os.path.join(DOSSIER_SOURCE, d))]
    
    # Utilisation de tqdm pour suivre la progression des séries
    for nom_serie in tqdm(series_dirs, desc="Séries traitées"):
        chemin_serie_source = os.path.join(DOSSIER_SOURCE, nom_serie)
        
        # Initialiser les listes pour agréger les mots par langue (VF et VO) pour la série
        mots_vf = []
        mots_vo = []
        
        # Parcourir tous les fichiers dans le dossier de la série (y compris les sous-dossiers de saison)
        for racine, _, fichiers in os.walk(chemin_serie_source):
            for fichier in fichiers:
                chemin_fichier_source = os.path.join(racine, fichier)
                
                # Déterminer le type de fichier et appliquer le nettoyage approprié
                texte_nettoye = ""
                if fichier.lower().endswith(('.srt')):
                    texte_nettoye = nettoyer_texte_srt(chemin_fichier_source)
                
                if not texte_nettoye:
                    continue
                
                # Détection de la langue
                try:
                    langue_detectee = detect(texte_nettoye[:1000]) # Limiter pour la vitesse
                except Exception:
                    # Ignorer les fichiers dont la langue ne peut être détectée
                    continue
                
                # Traitement NLP (Stop words, POS tagging, Lemmatisation)
                if langue_detectee in ('fr', 'en'):
                    mots_lemmatises = traiter_texte_nlp(texte_nettoye, langue_detectee)
                    
                    if langue_detectee == 'fr':
                        mots_vf.extend(mots_lemmatises)
                    elif langue_detectee == 'en':
                        mots_vo.extend(mots_lemmatises)

        # === Écriture des fichiers finaux dans la structure cible ===
        
        # Créer la structure de dossiers cible : sous_titres_nettoyes / nom_série_langue.txt
        if mots_vf:
            chemin_fichier_vf = os.path.join(DOSSIER_CIBLE, f"{nom_serie}_VF.txt")
            with open(chemin_fichier_vf, 'w', encoding='utf-8') as f:
                f.write(' '.join(mots_vf))
                
        if mots_vo:
            chemin_fichier_vo = os.path.join(DOSSIER_CIBLE, f"{nom_serie}_VO.txt")
            with open(chemin_fichier_vo, 'w', encoding='utf-8') as f:
                f.write(' '.join(mots_vo))
            
    print("\n🎉 Structuration et nettoyage terminés. Les fichiers sont dans le dossier 'sous_titres_nettoyes'.")

# Exécuter la fonction principale
if __name__ == "__main__":
    structurer_et_nettoyer()