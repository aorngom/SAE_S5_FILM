PRÉSENTATION DU PROJET

Ce projet est une application web composée de :

🔹 Backend (FastAPI – Python)

API REST permettant d’accéder aux séries, genres, acteurs, saisons, épisodes, favoris, notes, etc.

Gestion de l'administration : ajout, modification et suppression de séries.

🔹 Frontend (HTML/CSS/JS)

Pages statiques intégrant des appels API.

Affichage des séries, détails, recherche intelligente (TF-IDF).

Interface Admin complète (CRUD).

🔹 Base de données (PostgreSQL – Hébergée)

La base est déjà hébergée, il n’y a donc aucune manipulation à faire côté utilisateur.

Le backend se connecte directement à cette base via connection.py.



2. PRÉREQUIS (INSTALLATION)

Avant de lancer l’application, vous devez installer :

    - Python 3.10+

Vérifier :

python3 --version

    - pip & venv (environnement virtuel)
    - sudo apt install python3-pip python3-venv

 Git (optionnel)
    - sudo apt install git



3. INSTALLATION DU PROJET

 Cloner le projet :

    - git clone https://github.com/aorngom/SAE_S5_FILM.git
    - cd votre-projet

 Structure importante :
    - /Backend   ← C’est ici qu’on lance l’application
    - /Frontend

 1) Créer un environnement virtuel
     - cd Backend
     -  python3 -m venv venv

 2) Activer l'environnement

    Linux/Mac :

       - source venv/bin/activate


     Windows :

       - venv\Scripts\activate

3) Installer les dépendances
       - pip install -r requirements.txt


4) CONFIGURATION DE LA BASE DE DONNÉES

    - Aucune configuration à faire !
La base PostgreSQL est déjà hébergée et les identifiants sont déjà renseignés dans :

    - Backend/app/database/connection.py

5) LANCER L’APPLICATION

⚠️ IMPORTANT :
 Pour démarrer l’application, vous devez obligatoirement être dans le dossier Backend.

Commande :

    - uvicorn app.main:app --reload


L’application sera disponible à l’adresse :

    -  http://127.0.0.1:8000
