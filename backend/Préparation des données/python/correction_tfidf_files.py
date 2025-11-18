import pandas as pd
from nltk.corpus import stopwords
import os
import glob

class KeywordFilter:
    def __init__(self, language='english'):
        self.language = language
        
        # Stop words personnalisées étendues
        if language == 'english':
            self.custom_stopwords = set(stopwords.words('english')).union({
                'know', 'get', 'go', 'tell', 'want', 'need', 'think', 'say',
                'come', 'look', 'make', 'take', 'see', 'give', 'find', 'let',
                'put', 'mean', 'keep', 'ask', 'feel', 'try', 'leave', 'call',
                'thing', 'things', 'way', 'time', 'people', 'man', 'woman',
                'day', 'year', 'lot', 'kind', 'sort', 'guy', 'minute',
                'yeah', 'okay', 'ok', 'oh', 'ah', 'uh', 'um', 'hey', 'well',
                'right', 'sir', 'thank', 'please', 'sorry', 'excuse', 'yes', 'no',
                'now', 'just', 'really', 'still', 'maybe', 'gonna', 'gotta',
                'wanna', 'good', 'listen', 'wait', 'hold',
            })
        elif language == 'french':
            self.custom_stopwords = set(stopwords.words('french')).union({
                # Verbes très fréquents
                'savoir', 'avoir', 'être', 'faire', 'dire', 'voir', 'venir', 'aller',
                'vouloir', 'pouvoir', 'devoir', 'falloir', 'prendre', 'donner', 'mettre',
                'partir', 'arriver', 'rester', 'passer', 'comprendre', 'connaître',
                'trouver', 'rendre', 'tenir', 'laisser', 'entendre', 'croire', 'penser',
                
                # Mots génériques
                'chose', 'truc', 'façon', 'temps', 'gens', 'personne', 'homme', 'femme',
                'jour', 'année', 'fois', 'monde', 'vie', 'cas', 'moment', 'part',
                'genre', 'sorte', 'type', 'histoire', 'idée', 'probleme',
                
                # Interjections et remplissage
                'alors', 'donc', 'voilà', 'bon', 'ben', 'hein', 'euh', 'ah', 'oh',
                'eh', 'tiens', 'écoute', 'dis', 'voyons', 'attention', 'pardon',
                'merci', 'silence', 'oui', 'non', 'daccord', 'ok', 'okay',
                
                # Adverbes et expressions
                'maintenant', 'juste', 'vraiment', 'encore', 'peutêtre', 'peut',
                'beaucoup', 'trop', 'très', 'assez', 'plus', 'moins', 'bien',
                'jamais', 'toujours', 'souvent', 'parfois',
                
                # Pronoms supplémentaires
                'quelquun', 'quelque', 'certains', 'chaque', 'plusieurs',
                
                # Termes de dialogue
                'monsieur', 'madame', 'mademoiselle', 'dis', 'dit', 'dire',
                'repondre', 'demander', 'parler', 'écouter'
            })
        else:
            self.custom_stopwords = set(stopwords.words(language))
    
    def is_valid_keyword(self, word, min_length=3, min_alpha_ratio=0.7):
        """Vérifier si un mot est un bon candidat mot-clé"""
        if len(word) < min_length:
            return False
        
        alpha_count = sum(c.isalpha() for c in word)
        if len(word) > 0 and alpha_count / len(word) < min_alpha_ratio:
            return False
        
        if word.isupper() and len(word) <= 2:
            return False
            
        if len(word) > 2 and len(set(word)) < len(word) * 0.4:
            return False
            
        if word.isdigit():
            return False
            
        return True
    
    def filter_dataframe(self, df, text_column='mot'):
        """Filtrer un DataFrame de mots-clés"""
        df_clean = df[df[text_column].apply(
            lambda x: self.is_valid_keyword(str(x)) and 
                    str(x).lower() not in self.custom_stopwords
        )]
        return df_clean

input_folder='tfidf_results'
output_folder='tfidf_cleaned'

# Créer le dossier de sortie s'il n'existe pas
os.makedirs(output_folder, exist_ok=True)

# Initialiser les filtres par langue
filter_en = KeywordFilter(language='english')
filter_fr = KeywordFilter(language='french')

# Trouver tous les fichiers CSV
csv_files = glob.glob(os.path.join(input_folder, "*.csv"))

print(f"🔍 {len(csv_files)} fichiers CSV trouvés à traiter...")

for csv_file in csv_files:
    filename = os.path.basename(csv_file)
    print(f"\n📁 Traitement de : {filename}")
    
    try:
        # Charger le CSV
        df = pd.read_csv(csv_file)
        print(f"   ✅ {len(df)} mots avant filtrage")
        # Déterminer la langue basée sur le nom du fichier
        if '_en_' in filename or 'VO' in filename:
            filter_to_use = filter_en
            lang = "anglais"
        elif '_fr_' in filename or 'VF' in filename:
            filter_to_use = filter_fr
            lang = "français"
        else:
            # Par défaut, utiliser l'anglais
            filter_to_use = filter_en
            lang = "anglais (par défaut)"
        
        print(f"   🌐 Langue détectée : {lang}")
        
        # Appliquer le filtrage
        df_clean = filter_to_use.filter_dataframe(df)
        print(f"   ✅ {len(df_clean)} mots après filtrage")
        
        # Sauvegarder le résultat
        output_filename = filename.replace('.csv', '_cleaned.csv')
        output_path = os.path.join(output_folder, output_filename)
        df_clean.to_csv(output_path, index=False, encoding='utf-8')
        print(f"   💾 Sauvegardé : {output_filename}")
        
    except Exception as e:
        print(f"   ❌ Erreur avec {filename}: {e}")

print(f"\n🎉 Tous les fichiers ont été traités !")
print(f"📁 Dossier de sortie : {output_folder}")