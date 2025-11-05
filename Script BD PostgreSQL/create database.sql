CREATE TABLE serie(
   Id_serie SERIAL,
   titre VARCHAR(50),
   date_sortie DATE,
   description VARCHAR(50),
   PRIMARY KEY(Id_serie)
);

CREATE TABLE utilisateur(
   Id_utilisateur SERIAL,
   identifiant VARCHAR(50) NOT NULL,
   email VARCHAR(50),
   mdp VARCHAR(50),
   type_utilisateur VARCHAR(50),
   PRIMARY KEY(Id_utilisateur)
);

CREATE TABLE saison(
   Id_saison SERIAL,
   numero SMALLINT,
   description VARCHAR(50),
   Id_serie INT NOT NULL,
   PRIMARY KEY(Id_saison),
   FOREIGN KEY(Id_serie) REFERENCES serie(Id_serie)
);

CREATE TABLE mot_cle(
   Id_mot_cle SERIAL,
   libelle VARCHAR(50),
   langue CHAR(2),
   PRIMARY KEY(Id_mot_cle)
);

CREATE TABLE episode(
   Id_episode SERIAL,
   numero SMALLINT,
   duree VARCHAR(50),
   Id_saison INT NOT NULL,
   PRIMARY KEY(Id_episode),
   FOREIGN KEY(Id_saison) REFERENCES saison(Id_saison)
);

CREATE TABLE prix(
   Id_prix SERIAL,
   libelle VARCHAR(50),
   PRIMARY KEY(Id_prix)
);

CREATE TABLE genre(
   Id_genre SERIAL,
   libelle VARCHAR(50),
   PRIMARY KEY(Id_genre)
);

CREATE TABLE role(
   Id_role SERIAL,
   libelle VARCHAR(50),
   PRIMARY KEY(Id_role)
);

CREATE TABLE recherche(
   Id_recherche SERIAL,
   date_recherche DATE,
   PRIMARY KEY(Id_recherche)
);

CREATE TABLE personne(
   Id_personne SERIAL,
   nom VARCHAR(50),
   prenom VARCHAR(50),
   PRIMARY KEY(Id_personne)
);

CREATE TABLE historique_recherche(
   Id_serie INT,
   Id_utilisateur INT,
   Id_recherche INT,
   PRIMARY KEY(Id_serie, Id_utilisateur, Id_recherche),
   FOREIGN KEY(Id_serie) REFERENCES serie(Id_serie),
   FOREIGN KEY(Id_utilisateur) REFERENCES utilisateur(Id_utilisateur),
   FOREIGN KEY(Id_recherche) REFERENCES recherche(Id_recherche)
);

CREATE TABLE decrire(
   Id_serie INT,
   Id_mot_cle INT,
   PRIMARY KEY(Id_serie, Id_mot_cle),
   FOREIGN KEY(Id_serie) REFERENCES serie(Id_serie),
   FOREIGN KEY(Id_mot_cle) REFERENCES mot_cle(Id_mot_cle)
);

CREATE TABLE recevoir(
   Id_serie INT,
   Id_prix INT,
   PRIMARY KEY(Id_serie, Id_prix),
   FOREIGN KEY(Id_serie) REFERENCES serie(Id_serie),
   FOREIGN KEY(Id_prix) REFERENCES prix(Id_prix)
);

CREATE TABLE posseder(
   Id_serie INT,
   Id_genre INT,
   PRIMARY KEY(Id_serie, Id_genre),
   FOREIGN KEY(Id_serie) REFERENCES serie(Id_serie),
   FOREIGN KEY(Id_genre) REFERENCES genre(Id_genre)
);

CREATE TABLE participer(
   Id_serie INT,
   Id_personne INT,
   PRIMARY KEY(Id_serie, Id_personne),
   FOREIGN KEY(Id_serie) REFERENCES serie(Id_serie),
   FOREIGN KEY(Id_personne) REFERENCES personne(Id_personne)
);

CREATE TABLE jouer(
   Id_role INT,
   Id_personne INT,
   PRIMARY KEY(Id_role, Id_personne),
   FOREIGN KEY(Id_role) REFERENCES role(Id_role),
   FOREIGN KEY(Id_personne) REFERENCES personne(Id_personne)
);

CREATE TABLE favori(
   Id_serie INT,
   Id_utilisateur INT,
   PRIMARY KEY(Id_serie, Id_utilisateur),
   FOREIGN KEY(Id_serie) REFERENCES serie(Id_serie),
   FOREIGN KEY(Id_utilisateur) REFERENCES utilisateur(Id_utilisateur)
);

CREATE TABLE noter(
   Id_serie INT,
   Id_utilisateur INT,
   score SMALLINT,
   PRIMARY KEY(Id_serie, Id_utilisateur),
   FOREIGN KEY(Id_serie) REFERENCES serie(Id_serie),
   FOREIGN KEY(Id_utilisateur) REFERENCES utilisateur(Id_utilisateur)
);