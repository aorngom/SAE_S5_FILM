import os
import shutil
from py7zr import SevenZipFile
from zipfile import ZipFile

# === Chemins ===
CHEMIN_FICHIER_7Z = "sous-titres.7z"       # le fichier principal
DOSSIER_SORTIE = "sous_titres_extraits"    # dossier où tout sera extrait

# Créer le dossier de sortie s'il n'existe pas
os.makedirs(DOSSIER_SORTIE, exist_ok=True)

# === Étape 1 : extraction du fichier principal .7z ===
print("📦 Extraction du fichier principal .7z ...")
with SevenZipFile(CHEMIN_FICHIER_7Z, 'r') as archive:
    archive.extractall(path=DOSSIER_SORTIE)

# Certains fichiers .7z créent un dossier racine "sous-titres"
# On le déplace directement à la racine du dossier de sortie
sous_dossier = os.path.join(DOSSIER_SORTIE, "sous-titres")
if os.path.exists(sous_dossier):
    print("📂 Déplacement du contenu du dossier 'sous-titres' ...")
    for element in os.listdir(sous_dossier):
        src = os.path.join(sous_dossier, element)
        dest = os.path.join(DOSSIER_SORTIE, element)
        if os.path.isdir(src):
            shutil.move(src, dest)
        else:
            shutil.move(src, dest)
    shutil.rmtree(sous_dossier)
print("✅ Extraction principale terminée et dossier nettoyé !")


# === Étape 2 : fonction d’extraction récursive ===
def extraire_tout(dossier):
    """
    Extrait tous les fichiers ZIP et 7Z trouvés dans un dossier et ses sous-dossiers.
    - Crée un dossier du même nom que l’archive pour y placer les fichiers extraits.
    - Supprime ensuite les fichiers compressés (sauf le fichier sous-titres.7z principal).
    """
    for racine, _, fichiers in os.walk(dossier):
        for fichier in fichiers:
            chemin_fichier = os.path.join(racine, fichier)

            # --- Extraction des .zip ---
            if fichier.lower().endswith(".zip"):
                nom_dossier = os.path.splitext(fichier)[0]
                dossier_destination = os.path.join(racine, nom_dossier)
                os.makedirs(dossier_destination, exist_ok=True)

                print(f"🗂️ Extraction de {fichier} vers {dossier_destination} ...")
                try:
                    with ZipFile(chemin_fichier, 'r') as zip_ref:
                        zip_ref.extractall(dossier_destination)
                    os.remove(chemin_fichier)
                    print(f"   ✅ {fichier} extrait et supprimé.")
                except Exception as e:
                    print(f"   ❌ Erreur avec {fichier} : {e}")

            # --- Extraction des .7z imbriqués ---
            elif fichier.lower().endswith(".7z") and fichier != "sous-titres.7z":
                nom_dossier = os.path.splitext(fichier)[0]
                dossier_destination = os.path.join(racine, nom_dossier)
                os.makedirs(dossier_destination, exist_ok=True)

                print(f"🗂️ Extraction de {fichier} vers {dossier_destination} ...")
                try:
                    with SevenZipFile(chemin_fichier, 'r') as archive:
                        archive.extractall(path=dossier_destination)
                    os.remove(chemin_fichier)
                    print(f"   ✅ {fichier} extrait et supprimé.")
                except Exception as e:
                    print(f"   ❌ Erreur avec {fichier} : {e}")

# === Étape 3 : extraction récursive de tous les sous-archives ===
print("🔍 Recherche et extraction des fichiers zip imbriqués ...")
extraire_tout(DOSSIER_SORTIE)
print("🎉 Toutes les archives ont été extraites, réorganisées et nettoyées !")