import pandas as pd
import os

# --- IMPORT des fonctions DE TON FICHIER omd_api_code ---
from omd_api_code import corriger_nom_serie   # ✔ même nettoyage que pour OMDb

def nettoyer_titre_serie(brut):
    """Nettoie un titre de série venant du CSV TFIDF"""
    if not isinstance(brut, str):
        brut = str(brut)

    brut = brut.strip()
    return corriger_nom_serie(brut)

CSV_FOLDER = r"C:\Users\adslc\3D Objects\SAE_S5_FILM\backend\data\tfidf_cleaned"
OUTPUT_SQL = r"C:\Users\adslc\3D Objects\SAE_S5_FILM\backend\Préparation des données\script_sql\insert_mots_cles.sql"

sql_lines = []

for filename in os.listdir(CSV_FOLDER):
    if filename.endswith(".csv"):
        df = pd.read_csv(os.path.join(CSV_FOLDER, filename))

        # garder top 25 TF-IDF
        df = df.sort_values(by="poids_tfidf", ascending=False).head(25)

        for _, row in df.iterrows():
            mot = str(row["mot"]).replace("'", "''")
            langue = str(row["langue"])
            poids = row["poids_tfidf"]
            serie_brut = row["serie"]

            # CORRECTION DU TITRE DE LA SÉRIE (clé du problème)
            serie = nettoyer_titre_serie(serie_brut)
            serie_sql = serie.replace("'", "''")

            # INSERT mot clé
            sql_lines.append(
                f"INSERT INTO mot_cle (libelle, langue, poids) "
                f"VALUES ('{mot}', '{langue}', {poids});"
            )

            # INSERT lien série-mot_clé
            # et IGNORE si la série n’existe pas dans la BD
            sql_lines.append(
                f"""INSERT INTO decrire (Id_serie, Id_mot_cle)
                SELECT s.Id_serie, (
                    SELECT currval(pg_get_serial_sequence('mot_cle','id_mot_cle'))
                )
                FROM serie s
                WHERE s.titre = '{serie_sql}';
                """
            )

        sql_lines.append("\n")

# Sauvegarde
with open(OUTPUT_SQL, "w", encoding="utf-8") as f:
    f.write("\n".join(sql_lines))

print("SQL généré avec nettoyage automatique des titres !")