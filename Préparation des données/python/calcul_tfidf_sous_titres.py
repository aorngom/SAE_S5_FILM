import os
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from tqdm import tqdm
import re

# ==============================================================================
# CONFIGURATION DES CHEMINS
# ==============================================================================
# Dossier contenant les fichiers nettoyés
DOSSIER_SOURCE_NETTOYE = "sous_titres_nettoyes"
# Dossier où seront stockés les fichiers CSV de TF-IDF
DOSSIER_SORTIE_TFIDF = "tfidf_results"

# Créer le dossier de sortie s'il n'existe pas
os.makedirs(DOSSIER_SORTIE_TFIDF, exist_ok=True)

# ==============================================================================
# FONCTIONS UTILITAIRES
# ==============================================================================

def charger_documents_par_langue(dossier_source):
    """
    Charge tous les documents (séries) à partir des fichiers TXT à la racine du dossier
    et les regroupe par langue (fr/en) et par série.
    """
    documents = {'fr': [], 'en': []}
    series_names = {'fr': [], 'en': []}
    
    # Dictionnaire pour stocker le texte agrégé par série et par langue
    corpus_par_serie_langue = {} # Clé: (nom_serie, langue_code) -> texte
    
    # Parcourir les fichiers à la racine du dossier
    for fichier in os.listdir(dossier_source):
        if fichier.endswith(".txt"):
            chemin_fichier = os.path.join(dossier_source, fichier)
            
            # Extraire le nom de la série et la langue du nom de fichier
            match = re.match(r'(.+)_(VF|VO)\.txt', fichier, re.IGNORECASE)
            
            if match:
                nom_serie = match.group(1)
                langue_code_display = match.group(2).upper()
                langue_code_nlp = 'fr' if langue_code_display == 'VF' else 'en'
                
                try:
                    with open(chemin_fichier, 'r', encoding='utf-8') as f:
                        texte = f.read()
                        
                    # Agrégation du texte (au cas où il y aurait plusieurs fichiers pour une série/langue)
                    cle = (nom_serie, langue_code_nlp)
                    corpus_par_serie_langue[cle] = corpus_par_serie_langue.get(cle, "") + " " + texte
                    
                except Exception as e:
                    print(f"Erreur de lecture du fichier {chemin_fichier}: {e}")
            else:
                print(f"Avertissement: Nom de fichier non standard ignoré: {fichier}")

    # Reconstruire les listes pour le TfidfVectorizer
    for (nom_serie, langue_code_nlp), texte in corpus_par_serie_langue.items():
        if langue_code_nlp == 'fr':
            documents['fr'].append(texte)
            series_names['fr'].append(nom_serie)
        elif langue_code_nlp == 'en':
            documents['en'].append(texte)
            series_names['en'].append(nom_serie)
            
    return documents, series_names

# ==============================================================================
# CALCUL ET SAUVEGARDE DU TF-IDF
# ==============================================================================

def calculer_et_sauvegarder_tfidf():
    """
    Calcule le TF-IDF pour chaque mot dans chaque série, par langue,
    et sauvegarde les résultats dans des fichiers CSV par série.
    """
    print("📚 Chargement des documents à partir du dossier plat...")
    documents_par_langue, series_names_par_langue = charger_documents_par_langue(DOSSIER_SOURCE_NETTOYE)
    
    if not documents_par_langue['fr'] and not documents_par_langue['en']:
        print("⚠️ Aucun document trouvé. Assurez-vous que les fichiers sont nommés correctement.")
        return

    # Traiter chaque langue séparément
    for langue_code, docs in documents_par_langue.items():
        if not docs:
            continue
            
        langue_display = "Français (VF)" if langue_code == 'fr' else "Anglais (VO)"
        series_list = series_names_par_langue[langue_code]
        print(f"\n🔬 Calcul du TF-IDF pour la langue : {langue_display} ({len(docs)} séries)")

        # 1. Initialiser le Vectorizer
        vectorizer = TfidfVectorizer(
            lowercase=False,
            tokenizer=lambda x: x.split(),
            token_pattern=None
        )
        
        # 2. Calculer la matrice TF-IDF pour tous les documents de cette langue
        tfidf_matrix = vectorizer.fit_transform(docs)
        feature_names = vectorizer.get_feature_names_out()
        
        # 3. Parcourir chaque série pour extraire et sauvegarder ses scores
        for i, nom_serie in enumerate(tqdm(series_list, desc=f"Sauvegarde {langue_code}")):
            
            # Extraire la ligne de la matrice correspondant à la série actuelle
            feature_index = tfidf_matrix[i,:].nonzero()[1]
            tfidf_scores = zip(feature_index, [tfidf_matrix[i, x] for x in feature_index])
            
            data = []
            for index, score in tfidf_scores:
                mot = feature_names[index]
                data.append({
                    'mot': mot,
                    'poids_tfidf': score,
                    'langue': langue_code,
                    'serie': nom_serie
                })
            
            # Créer un DataFrame et le trier par poids décroissant
            df_serie = pd.DataFrame(data)
            df_serie = df_serie.sort_values(by='poids_tfidf', ascending=False)
            
            # Sauvegarder dans un fichier CSV spécifique à la série et à la langue
            chemin_csv = os.path.join(DOSSIER_SORTIE_TFIDF, f"{nom_serie}_{langue_code}_tfidf.csv")
            df_serie.to_csv(chemin_csv, index=False, encoding='utf-8')
            
    print("\n✅ Calcul et sauvegarde du TF-IDF terminés.")
    print(f"Les fichiers CSV sont disponibles dans le dossier '{DOSSIER_SORTIE_TFIDF}'.")

# Exécuter la fonction principale
if __name__ == "__main__":
    calculer_et_sauvegarder_tfidf()