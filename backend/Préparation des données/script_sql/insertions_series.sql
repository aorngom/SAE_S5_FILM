
-- Insertion de la série : 24
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    '24',
    '06 Nov 2001',
    'Counter Terrorism Agent Jack Bauer races against the clock to subvert terrorist plots and save his nation from ultimate disaster.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = '24' AND g.libelle = 'Action';


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = '24' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = '24' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 20 Primetime Emmys. 74 wins & 208 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 20 Primetime Emmys. 74 wins & 208 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = '24' AND p.libelle = 'Won 20 Primetime Emmys. 74 wins & 208 nominations total';


-- Insertion de la personne : Kiefer Sutherland
INSERT INTO personne (nom, prenom) 
SELECT 'Sutherland', 'Kiefer'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Sutherland' AND prenom = 'Kiefer'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Sutherland' 
  AND p.prenom = 'Kiefer'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = '24' 
  AND p.nom = 'Sutherland' 
  AND p.prenom = 'Kiefer'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Mary Lynn Rajskub
INSERT INTO personne (nom, prenom) 
SELECT 'Lynn Rajskub', 'Mary'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Lynn Rajskub' AND prenom = 'Mary'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Lynn Rajskub' 
  AND p.prenom = 'Mary'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = '24' 
  AND p.nom = 'Lynn Rajskub' 
  AND p.prenom = 'Mary'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Carlos Bernard
INSERT INTO personne (nom, prenom) 
SELECT 'Bernard', 'Carlos'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Bernard' AND prenom = 'Carlos'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Bernard' 
  AND p.prenom = 'Carlos'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = '24' 
  AND p.nom = 'Bernard' 
  AND p.prenom = 'Carlos'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Robert Cochran
INSERT INTO personne (nom, prenom) 
SELECT 'Cochran', 'Robert'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Cochran' AND prenom = 'Robert'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Cochran' 
  AND p.prenom = 'Robert'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = '24' 
  AND p.nom = 'Cochran' 
  AND p.prenom = 'Robert'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Joel Surnow
INSERT INTO personne (nom, prenom) 
SELECT 'Surnow', 'Joel'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Surnow' AND prenom = 'Joel'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Surnow' 
  AND p.prenom = 'Joel'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = '24' 
  AND p.nom = 'Surnow' 
  AND p.prenom = 'Joel'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : 90210
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    '90210',
    '02 Sep 2008',
    'A Kansas family relocates to Beverly Hills, where their two children adapt to the infamous social drama of West Beverly Hills High.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = '90210' AND g.libelle = 'Comedy';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = '90210' AND g.libelle = 'Drama';


-- Insertion du genre : Romance
INSERT INTO genre (libelle) 
SELECT 'Romance'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Romance');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = '90210' AND g.libelle = 'Romance';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '2 wins & 17 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '2 wins & 17 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = '90210' AND p.libelle = '2 wins & 17 nominations total';


-- Insertion de la personne : Shenae Grimes-Beech
INSERT INTO personne (nom, prenom) 
SELECT 'Grimes-Beech', 'Shenae'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Grimes-Beech' AND prenom = 'Shenae'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Grimes-Beech' 
  AND p.prenom = 'Shenae'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = '90210' 
  AND p.nom = 'Grimes-Beech' 
  AND p.prenom = 'Shenae'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Tristan Mack Wilds
INSERT INTO personne (nom, prenom) 
SELECT 'Mack Wilds', 'Tristan'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Mack Wilds' AND prenom = 'Tristan'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Mack Wilds' 
  AND p.prenom = 'Tristan'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = '90210' 
  AND p.nom = 'Mack Wilds' 
  AND p.prenom = 'Tristan'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : AnnaLynne McCord
INSERT INTO personne (nom, prenom) 
SELECT 'McCord', 'AnnaLynne'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'McCord' AND prenom = 'AnnaLynne'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'McCord' 
  AND p.prenom = 'AnnaLynne'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = '90210' 
  AND p.nom = 'McCord' 
  AND p.prenom = 'AnnaLynne'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jeff Judah
INSERT INTO personne (nom, prenom) 
SELECT 'Judah', 'Jeff'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Judah' AND prenom = 'Jeff'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Judah' 
  AND p.prenom = 'Jeff'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = '90210' 
  AND p.nom = 'Judah' 
  AND p.prenom = 'Jeff'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Gabe Sachs
INSERT INTO personne (nom, prenom) 
SELECT 'Sachs', 'Gabe'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Sachs' AND prenom = 'Gabe'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Sachs' 
  AND p.prenom = 'Gabe'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = '90210' 
  AND p.nom = 'Sachs' 
  AND p.prenom = 'Gabe'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Darren Star
INSERT INTO personne (nom, prenom) 
SELECT 'Star', 'Darren'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Star' AND prenom = 'Darren'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Star' 
  AND p.prenom = 'Darren'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = '90210' 
  AND p.nom = 'Star' 
  AND p.prenom = 'Darren'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Alias
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Alias',
    '30 Sep 2001',
    'Sydney Bristow agrees to become an international spy for a secret branch of the CIA. The secrecy complicates her social and love lives, but it''s nothing compared to what happens when she finds out her employer has no ties to the CIA.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Alias' AND g.libelle = 'Action';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Alias' AND g.libelle = 'Drama';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Alias' AND g.libelle = 'Mystery';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 4 Primetime Emmys. 33 wins & 146 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 4 Primetime Emmys. 33 wins & 146 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Alias' AND p.libelle = 'Won 4 Primetime Emmys. 33 wins & 146 nominations total';


-- Insertion de la personne : Jennifer Garner
INSERT INTO personne (nom, prenom) 
SELECT 'Garner', 'Jennifer'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Garner' AND prenom = 'Jennifer'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Garner' 
  AND p.prenom = 'Jennifer'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Alias' 
  AND p.nom = 'Garner' 
  AND p.prenom = 'Jennifer'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Ron Rifkin
INSERT INTO personne (nom, prenom) 
SELECT 'Rifkin', 'Ron'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Rifkin' AND prenom = 'Ron'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Rifkin' 
  AND p.prenom = 'Ron'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Alias' 
  AND p.nom = 'Rifkin' 
  AND p.prenom = 'Ron'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Carl Lumbly
INSERT INTO personne (nom, prenom) 
SELECT 'Lumbly', 'Carl'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Lumbly' AND prenom = 'Carl'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Lumbly' 
  AND p.prenom = 'Carl'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Alias' 
  AND p.nom = 'Lumbly' 
  AND p.prenom = 'Carl'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : J.J. Abrams
INSERT INTO personne (nom, prenom) 
SELECT 'Abrams', 'J.J.'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Abrams' AND prenom = 'J.J.'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Abrams' 
  AND p.prenom = 'J.J.'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Alias' 
  AND p.nom = 'Abrams' 
  AND p.prenom = 'J.J.'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Angel
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Angel',
    '05 Oct 1999',
    'The vampire Angel, cursed with a soul, moves to Los Angeles and aids people with supernatural-related problems while questing for his own redemption.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Angel' AND g.libelle = 'Action';


-- Insertion du genre : Adventure
INSERT INTO genre (libelle) 
SELECT 'Adventure'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Adventure');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Angel' AND g.libelle = 'Adventure';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Angel' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 1 Primetime Emmy. 15 wins & 59 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 1 Primetime Emmy. 15 wins & 59 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Angel' AND p.libelle = 'Nominated for 1 Primetime Emmy. 15 wins & 59 nominations total';


-- Insertion de la personne : David Boreanaz
INSERT INTO personne (nom, prenom) 
SELECT 'Boreanaz', 'David'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Boreanaz' AND prenom = 'David'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Boreanaz' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Angel' 
  AND p.nom = 'Boreanaz' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Charisma Carpenter
INSERT INTO personne (nom, prenom) 
SELECT 'Carpenter', 'Charisma'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Carpenter' AND prenom = 'Charisma'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Carpenter' 
  AND p.prenom = 'Charisma'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Angel' 
  AND p.nom = 'Carpenter' 
  AND p.prenom = 'Charisma'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Alexis Denisof
INSERT INTO personne (nom, prenom) 
SELECT 'Denisof', 'Alexis'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Denisof' AND prenom = 'Alexis'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Denisof' 
  AND p.prenom = 'Alexis'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Angel' 
  AND p.nom = 'Denisof' 
  AND p.prenom = 'Alexis'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : David Greenwalt
INSERT INTO personne (nom, prenom) 
SELECT 'Greenwalt', 'David'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Greenwalt' AND prenom = 'David'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Greenwalt' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Angel' 
  AND p.nom = 'Greenwalt' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Joss Whedon
INSERT INTO personne (nom, prenom) 
SELECT 'Whedon', 'Joss'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Whedon' AND prenom = 'Joss'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Whedon' 
  AND p.prenom = 'Joss'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Angel' 
  AND p.nom = 'Whedon' 
  AND p.prenom = 'Joss'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Battlestar Galactica
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Battlestar Galactica',
    '14 Jan 2005',
    'When an old enemy, the Cylons, resurface and obliterate the 12 colonies, the crew of the aged Galactica protect a small civilian fleet - the last of humanity - as they journey toward the fabled 13th colony, Earth.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Battlestar Galactica' AND g.libelle = 'Action';


-- Insertion du genre : Adventure
INSERT INTO genre (libelle) 
SELECT 'Adventure'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Adventure');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Battlestar Galactica' AND g.libelle = 'Adventure';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Battlestar Galactica' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 3 Primetime Emmys. 43 wins & 114 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 3 Primetime Emmys. 43 wins & 114 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Battlestar Galactica' AND p.libelle = 'Won 3 Primetime Emmys. 43 wins & 114 nominations total';


-- Insertion de la personne : Edward James Olmos
INSERT INTO personne (nom, prenom) 
SELECT 'James Olmos', 'Edward'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'James Olmos' AND prenom = 'Edward'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'James Olmos' 
  AND p.prenom = 'Edward'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Battlestar Galactica' 
  AND p.nom = 'James Olmos' 
  AND p.prenom = 'Edward'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Mary McDonnell
INSERT INTO personne (nom, prenom) 
SELECT 'McDonnell', 'Mary'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'McDonnell' AND prenom = 'Mary'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'McDonnell' 
  AND p.prenom = 'Mary'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Battlestar Galactica' 
  AND p.nom = 'McDonnell' 
  AND p.prenom = 'Mary'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jamie Bamber
INSERT INTO personne (nom, prenom) 
SELECT 'Bamber', 'Jamie'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Bamber' AND prenom = 'Jamie'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Bamber' 
  AND p.prenom = 'Jamie'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Battlestar Galactica' 
  AND p.nom = 'Bamber' 
  AND p.prenom = 'Jamie'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Glen A. Larson
INSERT INTO personne (nom, prenom) 
SELECT 'A. Larson', 'Glen'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'A. Larson' AND prenom = 'Glen'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'A. Larson' 
  AND p.prenom = 'Glen'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Battlestar Galactica' 
  AND p.nom = 'A. Larson' 
  AND p.prenom = 'Glen'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Ronald D. Moore
INSERT INTO personne (nom, prenom) 
SELECT 'D. Moore', 'Ronald'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'D. Moore' AND prenom = 'Ronald'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'D. Moore' 
  AND p.prenom = 'Ronald'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Battlestar Galactica' 
  AND p.nom = 'D. Moore' 
  AND p.prenom = 'Ronald'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Better Off Ted
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Better Off Ted',
    '18 Mar 2009',
    'In an amoral science-based company, a manager tries to keep control of his scientists while being pressured by his shrewd boss.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Better Off Ted' AND g.libelle = 'Comedy';


-- Insertion du genre : Sci-Fi
INSERT INTO genre (libelle) 
SELECT 'Sci-Fi'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Sci-Fi');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Better Off Ted' AND g.libelle = 'Sci-Fi';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '1 win & 1 nomination total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '1 win & 1 nomination total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Better Off Ted' AND p.libelle = '1 win & 1 nomination total';


-- Insertion de la personne : Jay Harrington
INSERT INTO personne (nom, prenom) 
SELECT 'Harrington', 'Jay'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Harrington' AND prenom = 'Jay'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Harrington' 
  AND p.prenom = 'Jay'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Better Off Ted' 
  AND p.nom = 'Harrington' 
  AND p.prenom = 'Jay'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Portia de Rossi
INSERT INTO personne (nom, prenom) 
SELECT 'de Rossi', 'Portia'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'de Rossi' AND prenom = 'Portia'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'de Rossi' 
  AND p.prenom = 'Portia'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Better Off Ted' 
  AND p.nom = 'de Rossi' 
  AND p.prenom = 'Portia'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Andrea Anders
INSERT INTO personne (nom, prenom) 
SELECT 'Anders', 'Andrea'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Anders' AND prenom = 'Andrea'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Anders' 
  AND p.prenom = 'Andrea'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Better Off Ted' 
  AND p.nom = 'Anders' 
  AND p.prenom = 'Andrea'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Victor Fresco
INSERT INTO personne (nom, prenom) 
SELECT 'Fresco', 'Victor'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Fresco' AND prenom = 'Victor'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Fresco' 
  AND p.prenom = 'Victor'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Better Off Ted' 
  AND p.nom = 'Fresco' 
  AND p.prenom = 'Victor'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Bionic Woman
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Bionic Woman',
    '26 Sep 2007',
    'A reimagining of the popular 1970s TV series about a female athlete who is given bionic strength.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Bionic Woman' AND g.libelle = 'Action';


-- Insertion du genre : Sci-Fi
INSERT INTO genre (libelle) 
SELECT 'Sci-Fi'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Sci-Fi');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Bionic Woman' AND g.libelle = 'Sci-Fi';


-- Insertion du genre : Thriller
INSERT INTO genre (libelle) 
SELECT 'Thriller'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Thriller');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Bionic Woman' AND g.libelle = 'Thriller';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '1 nomination total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '1 nomination total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Bionic Woman' AND p.libelle = '1 nomination total';


-- Insertion de la personne : Michelle Ryan
INSERT INTO personne (nom, prenom) 
SELECT 'Ryan', 'Michelle'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Ryan' AND prenom = 'Michelle'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Ryan' 
  AND p.prenom = 'Michelle'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Bionic Woman' 
  AND p.nom = 'Ryan' 
  AND p.prenom = 'Michelle'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Miguel Ferrer
INSERT INTO personne (nom, prenom) 
SELECT 'Ferrer', 'Miguel'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Ferrer' AND prenom = 'Miguel'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Ferrer' 
  AND p.prenom = 'Miguel'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Bionic Woman' 
  AND p.nom = 'Ferrer' 
  AND p.prenom = 'Miguel'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Molly Price
INSERT INTO personne (nom, prenom) 
SELECT 'Price', 'Molly'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Price' AND prenom = 'Molly'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Price' 
  AND p.prenom = 'Molly'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Bionic Woman' 
  AND p.nom = 'Price' 
  AND p.prenom = 'Molly'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Kenneth Johnson
INSERT INTO personne (nom, prenom) 
SELECT 'Johnson', 'Kenneth'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Johnson' AND prenom = 'Kenneth'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Johnson' 
  AND p.prenom = 'Kenneth'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Bionic Woman' 
  AND p.nom = 'Johnson' 
  AND p.prenom = 'Kenneth'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Blade
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Blade',
    '21 Aug 1998',
    'A half-vampire, half-mortal man becomes a protector of the mortal race, while slaying evil vampires.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Blade' AND g.libelle = 'Action';


-- Insertion du genre : Horror
INSERT INTO genre (libelle) 
SELECT 'Horror'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Horror');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Blade' AND g.libelle = 'Horror';


-- Insertion du genre : Sci-Fi
INSERT INTO genre (libelle) 
SELECT 'Sci-Fi'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Sci-Fi');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Blade' AND g.libelle = 'Sci-Fi';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '5 wins & 11 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '5 wins & 11 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Blade' AND p.libelle = '5 wins & 11 nominations total';


-- Insertion de la personne : Wesley Snipes
INSERT INTO personne (nom, prenom) 
SELECT 'Snipes', 'Wesley'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Snipes' AND prenom = 'Wesley'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Snipes' 
  AND p.prenom = 'Wesley'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Blade' 
  AND p.nom = 'Snipes' 
  AND p.prenom = 'Wesley'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Stephen Dorff
INSERT INTO personne (nom, prenom) 
SELECT 'Dorff', 'Stephen'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Dorff' AND prenom = 'Stephen'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Dorff' 
  AND p.prenom = 'Stephen'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Blade' 
  AND p.nom = 'Dorff' 
  AND p.prenom = 'Stephen'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Kris Kristofferson
INSERT INTO personne (nom, prenom) 
SELECT 'Kristofferson', 'Kris'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Kristofferson' AND prenom = 'Kris'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Kristofferson' 
  AND p.prenom = 'Kris'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Blade' 
  AND p.nom = 'Kristofferson' 
  AND p.prenom = 'Kris'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Stephen Norrington
INSERT INTO personne (nom, prenom) 
SELECT 'Norrington', 'Stephen'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Norrington' AND prenom = 'Stephen'
);


-- Insertion du rôle : Realisateur
INSERT INTO role (libelle) 
SELECT 'Realisateur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Realisateur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Realisateur' 
  AND p.nom = 'Norrington' 
  AND p.prenom = 'Stephen'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Blade' 
  AND p.nom = 'Norrington' 
  AND p.prenom = 'Stephen'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : David S. Goyer
INSERT INTO personne (nom, prenom) 
SELECT 'S. Goyer', 'David'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'S. Goyer' AND prenom = 'David'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'S. Goyer' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Blade' 
  AND p.nom = 'S. Goyer' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Bloodties
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Bloodties',
    '24 Jan 2016',
    'Anthony has a decision he must make. After he decides, everything unravels around him.'
);


-- Insertion du genre : Short
INSERT INTO genre (libelle) 
SELECT 'Short'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Short');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Bloodties' AND g.libelle = 'Short';


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Bloodties' AND g.libelle = 'Crime';


-- Insertion de la personne : David Barnett
INSERT INTO personne (nom, prenom) 
SELECT 'Barnett', 'David'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Barnett' AND prenom = 'David'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Barnett' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Bloodties' 
  AND p.nom = 'Barnett' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Dallas Maginn
INSERT INTO personne (nom, prenom) 
SELECT 'Maginn', 'Dallas'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Maginn' AND prenom = 'Dallas'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Maginn' 
  AND p.prenom = 'Dallas'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Bloodties' 
  AND p.nom = 'Maginn' 
  AND p.prenom = 'Dallas'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Johnny Philebaum
INSERT INTO personne (nom, prenom) 
SELECT 'Philebaum', 'Johnny'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Philebaum' AND prenom = 'Johnny'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Philebaum' 
  AND p.prenom = 'Johnny'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Bloodties' 
  AND p.nom = 'Philebaum' 
  AND p.prenom = 'Johnny'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Michael Muench
INSERT INTO personne (nom, prenom) 
SELECT 'Muench', 'Michael'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Muench' AND prenom = 'Michael'
);


-- Insertion du rôle : Realisateur
INSERT INTO role (libelle) 
SELECT 'Realisateur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Realisateur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Realisateur' 
  AND p.nom = 'Muench' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Bloodties' 
  AND p.nom = 'Muench' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Michael Muench
INSERT INTO personne (nom, prenom) 
SELECT 'Muench', 'Michael'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Muench' AND prenom = 'Michael'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Muench' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Bloodties' 
  AND p.nom = 'Muench' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Bones
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Bones',
    '13 Sep 2005',
    'F.B.I. Special Agent Seeley Booth teams up with the Jeffersonian''s top anthropologist, Dr. Temperance Brennan, to investigate cases where all that''s left of the victims are their bones.'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Bones' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Bones' AND g.libelle = 'Drama';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Bones' AND g.libelle = 'Mystery';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 2 Primetime Emmys. 8 wins & 42 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 2 Primetime Emmys. 8 wins & 42 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Bones' AND p.libelle = 'Nominated for 2 Primetime Emmys. 8 wins & 42 nominations total';


-- Insertion de la personne : Emily Deschanel
INSERT INTO personne (nom, prenom) 
SELECT 'Deschanel', 'Emily'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Deschanel' AND prenom = 'Emily'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Deschanel' 
  AND p.prenom = 'Emily'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Bones' 
  AND p.nom = 'Deschanel' 
  AND p.prenom = 'Emily'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : David Boreanaz
INSERT INTO personne (nom, prenom) 
SELECT 'Boreanaz', 'David'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Boreanaz' AND prenom = 'David'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Boreanaz' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Bones' 
  AND p.nom = 'Boreanaz' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Michaela Conlin
INSERT INTO personne (nom, prenom) 
SELECT 'Conlin', 'Michaela'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Conlin' AND prenom = 'Michaela'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Conlin' 
  AND p.prenom = 'Michaela'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Bones' 
  AND p.nom = 'Conlin' 
  AND p.prenom = 'Michaela'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Hart Hanson
INSERT INTO personne (nom, prenom) 
SELECT 'Hanson', 'Hart'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hanson' AND prenom = 'Hart'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Hanson' 
  AND p.prenom = 'Hart'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Bones' 
  AND p.nom = 'Hanson' 
  AND p.prenom = 'Hart'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Breaking Bad
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Breaking Bad',
    '20 Jan 2008',
    'A chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine with a former student to secure his family''s future.'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Breaking Bad' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Breaking Bad' AND g.libelle = 'Drama';


-- Insertion du genre : Thriller
INSERT INTO genre (libelle) 
SELECT 'Thriller'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Thriller');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Breaking Bad' AND g.libelle = 'Thriller';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 16 Primetime Emmys. 172 wins & 269 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 16 Primetime Emmys. 172 wins & 269 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Breaking Bad' AND p.libelle = 'Won 16 Primetime Emmys. 172 wins & 269 nominations total';


-- Insertion de la personne : Bryan Cranston
INSERT INTO personne (nom, prenom) 
SELECT 'Cranston', 'Bryan'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Cranston' AND prenom = 'Bryan'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Cranston' 
  AND p.prenom = 'Bryan'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Breaking Bad' 
  AND p.nom = 'Cranston' 
  AND p.prenom = 'Bryan'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Anna Gunn
INSERT INTO personne (nom, prenom) 
SELECT 'Gunn', 'Anna'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Gunn' AND prenom = 'Anna'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Gunn' 
  AND p.prenom = 'Anna'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Breaking Bad' 
  AND p.nom = 'Gunn' 
  AND p.prenom = 'Anna'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Aaron Paul
INSERT INTO personne (nom, prenom) 
SELECT 'Paul', 'Aaron'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Paul' AND prenom = 'Aaron'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Paul' 
  AND p.prenom = 'Aaron'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Breaking Bad' 
  AND p.nom = 'Paul' 
  AND p.prenom = 'Aaron'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Vince Gilligan
INSERT INTO personne (nom, prenom) 
SELECT 'Gilligan', 'Vince'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Gilligan' AND prenom = 'Vince'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Gilligan' 
  AND p.prenom = 'Vince'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Breaking Bad' 
  AND p.nom = 'Gilligan' 
  AND p.prenom = 'Vince'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Buffy
INSERT INTO serie (titre, description) 
VALUES (
    'Buffy',
    'A portrait of Canadian folk music icon Buffy Sainte-Marie'
);


-- Insertion du genre : Short
INSERT INTO genre (libelle) 
SELECT 'Short'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Short');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Buffy' AND g.libelle = 'Short';


-- Insertion de la personne : Buffy Sainte-Marie
INSERT INTO personne (nom, prenom) 
SELECT 'Sainte-Marie', 'Buffy'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Sainte-Marie' AND prenom = 'Buffy'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Sainte-Marie' 
  AND p.prenom = 'Buffy'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Buffy' 
  AND p.nom = 'Sainte-Marie' 
  AND p.prenom = 'Buffy'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : John Walker
INSERT INTO personne (nom, prenom) 
SELECT 'Walker', 'John'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Walker' AND prenom = 'John'
);


-- Insertion du rôle : Realisateur
INSERT INTO role (libelle) 
SELECT 'Realisateur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Realisateur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Realisateur' 
  AND p.nom = 'Walker' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Buffy' 
  AND p.nom = 'Walker' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : John Walker
INSERT INTO personne (nom, prenom) 
SELECT 'Walker', 'John'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Walker' AND prenom = 'John'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Walker' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Buffy' 
  AND p.nom = 'Walker' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Burn Notice
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Burn Notice',
    '28 Jun 2007',
    'US spy Michael Weston suddenly finds himself ''burned''-discredited without any form of procedure. Since no one will really help him, he survives by doing impossible jobs for desperate people in Miami.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Burn Notice' AND g.libelle = 'Action';


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Burn Notice' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Burn Notice' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 4 Primetime Emmys. 6 wins & 17 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 4 Primetime Emmys. 6 wins & 17 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Burn Notice' AND p.libelle = 'Nominated for 4 Primetime Emmys. 6 wins & 17 nominations total';


-- Insertion de la personne : Jeffrey Donovan
INSERT INTO personne (nom, prenom) 
SELECT 'Donovan', 'Jeffrey'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Donovan' AND prenom = 'Jeffrey'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Donovan' 
  AND p.prenom = 'Jeffrey'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Burn Notice' 
  AND p.nom = 'Donovan' 
  AND p.prenom = 'Jeffrey'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Gabrielle Anwar
INSERT INTO personne (nom, prenom) 
SELECT 'Anwar', 'Gabrielle'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Anwar' AND prenom = 'Gabrielle'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Anwar' 
  AND p.prenom = 'Gabrielle'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Burn Notice' 
  AND p.nom = 'Anwar' 
  AND p.prenom = 'Gabrielle'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Bruce Campbell
INSERT INTO personne (nom, prenom) 
SELECT 'Campbell', 'Bruce'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Campbell' AND prenom = 'Bruce'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Campbell' 
  AND p.prenom = 'Bruce'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Burn Notice' 
  AND p.nom = 'Campbell' 
  AND p.prenom = 'Bruce'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Matt Nix
INSERT INTO personne (nom, prenom) 
SELECT 'Nix', 'Matt'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Nix' AND prenom = 'Matt'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Nix' 
  AND p.prenom = 'Matt'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Burn Notice' 
  AND p.nom = 'Nix' 
  AND p.prenom = 'Matt'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Californication
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Californication',
    '13 Aug 2007',
    'A writer tries to juggle his career, his relationship with his daughter and his ex-girlfriend, as well as his addiction to beautiful women.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Californication' AND g.libelle = 'Comedy';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Californication' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 2 Primetime Emmys. 6 wins & 32 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 2 Primetime Emmys. 6 wins & 32 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Californication' AND p.libelle = 'Won 2 Primetime Emmys. 6 wins & 32 nominations total';


-- Insertion de la personne : David Duchovny
INSERT INTO personne (nom, prenom) 
SELECT 'Duchovny', 'David'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Duchovny' AND prenom = 'David'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Duchovny' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Californication' 
  AND p.nom = 'Duchovny' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Natascha McElhone
INSERT INTO personne (nom, prenom) 
SELECT 'McElhone', 'Natascha'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'McElhone' AND prenom = 'Natascha'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'McElhone' 
  AND p.prenom = 'Natascha'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Californication' 
  AND p.nom = 'McElhone' 
  AND p.prenom = 'Natascha'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Evan Handler
INSERT INTO personne (nom, prenom) 
SELECT 'Handler', 'Evan'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Handler' AND prenom = 'Evan'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Handler' 
  AND p.prenom = 'Evan'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Californication' 
  AND p.nom = 'Handler' 
  AND p.prenom = 'Evan'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Tom Kapinos
INSERT INTO personne (nom, prenom) 
SELECT 'Kapinos', 'Tom'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Kapinos' AND prenom = 'Tom'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Kapinos' 
  AND p.prenom = 'Tom'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Californication' 
  AND p.nom = 'Kapinos' 
  AND p.prenom = 'Tom'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Caprica
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Caprica',
    '22 Jan 2010',
    'Two families, the Graystones and the Adamas, live together on a peaceful planet known as Caprica, where a startling breakthrough in artificial intelligence brings about unforeseen consequences.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Caprica' AND g.libelle = 'Action';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Caprica' AND g.libelle = 'Drama';


-- Insertion du genre : Sci-Fi
INSERT INTO genre (libelle) 
SELECT 'Sci-Fi'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Sci-Fi');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Caprica' AND g.libelle = 'Sci-Fi';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 1 Primetime Emmy. 1 win & 9 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 1 Primetime Emmy. 1 win & 9 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Caprica' AND p.libelle = 'Nominated for 1 Primetime Emmy. 1 win & 9 nominations total';


-- Insertion de la personne : Eric Stoltz
INSERT INTO personne (nom, prenom) 
SELECT 'Stoltz', 'Eric'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Stoltz' AND prenom = 'Eric'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Stoltz' 
  AND p.prenom = 'Eric'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Caprica' 
  AND p.nom = 'Stoltz' 
  AND p.prenom = 'Eric'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Esai Morales
INSERT INTO personne (nom, prenom) 
SELECT 'Morales', 'Esai'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Morales' AND prenom = 'Esai'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Morales' 
  AND p.prenom = 'Esai'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Caprica' 
  AND p.nom = 'Morales' 
  AND p.prenom = 'Esai'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Paula Malcomson
INSERT INTO personne (nom, prenom) 
SELECT 'Malcomson', 'Paula'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Malcomson' AND prenom = 'Paula'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Malcomson' 
  AND p.prenom = 'Paula'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Caprica' 
  AND p.nom = 'Malcomson' 
  AND p.prenom = 'Paula'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Remi Aubuchon
INSERT INTO personne (nom, prenom) 
SELECT 'Aubuchon', 'Remi'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Aubuchon' AND prenom = 'Remi'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Aubuchon' 
  AND p.prenom = 'Remi'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Caprica' 
  AND p.nom = 'Aubuchon' 
  AND p.prenom = 'Remi'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Ronald D. Moore
INSERT INTO personne (nom, prenom) 
SELECT 'D. Moore', 'Ronald'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'D. Moore' AND prenom = 'Ronald'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'D. Moore' 
  AND p.prenom = 'Ronald'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Caprica' 
  AND p.nom = 'D. Moore' 
  AND p.prenom = 'Ronald'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Charmed
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Charmed',
    '07 Oct 1998',
    'Three sisters discover that they are descendants of a line of good female witches and are destined to fight against the forces of evil.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Charmed' AND g.libelle = 'Drama';


-- Insertion du genre : Fantasy
INSERT INTO genre (libelle) 
SELECT 'Fantasy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Fantasy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Charmed' AND g.libelle = 'Fantasy';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Charmed' AND g.libelle = 'Mystery';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '5 wins & 20 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '5 wins & 20 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Charmed' AND p.libelle = '5 wins & 20 nominations total';


-- Insertion de la personne : Holly Marie Combs
INSERT INTO personne (nom, prenom) 
SELECT 'Marie Combs', 'Holly'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Marie Combs' AND prenom = 'Holly'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Marie Combs' 
  AND p.prenom = 'Holly'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Charmed' 
  AND p.nom = 'Marie Combs' 
  AND p.prenom = 'Holly'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Alyssa Milano
INSERT INTO personne (nom, prenom) 
SELECT 'Milano', 'Alyssa'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Milano' AND prenom = 'Alyssa'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Milano' 
  AND p.prenom = 'Alyssa'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Charmed' 
  AND p.nom = 'Milano' 
  AND p.prenom = 'Alyssa'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Brian Krause
INSERT INTO personne (nom, prenom) 
SELECT 'Krause', 'Brian'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Krause' AND prenom = 'Brian'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Krause' 
  AND p.prenom = 'Brian'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Charmed' 
  AND p.nom = 'Krause' 
  AND p.prenom = 'Brian'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Constance M. Burge
INSERT INTO personne (nom, prenom) 
SELECT 'M. Burge', 'Constance'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'M. Burge' AND prenom = 'Constance'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'M. Burge' 
  AND p.prenom = 'Constance'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Charmed' 
  AND p.nom = 'M. Burge' 
  AND p.prenom = 'Constance'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Chuck
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Chuck',
    '24 Sep 2007',
    'When a computer geek inadvertently downloads critical government secrets into his brain, both the CIA and the NSA assign an agent to protect him and exploit his newfound skills.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Chuck' AND g.libelle = 'Action';


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Chuck' AND g.libelle = 'Comedy';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Chuck' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 2 Primetime Emmys. 9 wins & 34 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 2 Primetime Emmys. 9 wins & 34 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Chuck' AND p.libelle = 'Won 2 Primetime Emmys. 9 wins & 34 nominations total';


-- Insertion de la personne : Zachary Levi
INSERT INTO personne (nom, prenom) 
SELECT 'Levi', 'Zachary'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Levi' AND prenom = 'Zachary'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Levi' 
  AND p.prenom = 'Zachary'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Chuck' 
  AND p.nom = 'Levi' 
  AND p.prenom = 'Zachary'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Yvonne Strahovski
INSERT INTO personne (nom, prenom) 
SELECT 'Strahovski', 'Yvonne'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Strahovski' AND prenom = 'Yvonne'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Strahovski' 
  AND p.prenom = 'Yvonne'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Chuck' 
  AND p.nom = 'Strahovski' 
  AND p.prenom = 'Yvonne'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Joshua Gomez
INSERT INTO personne (nom, prenom) 
SELECT 'Gomez', 'Joshua'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Gomez' AND prenom = 'Joshua'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Gomez' 
  AND p.prenom = 'Joshua'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Chuck' 
  AND p.nom = 'Gomez' 
  AND p.prenom = 'Joshua'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Chris Fedak
INSERT INTO personne (nom, prenom) 
SELECT 'Fedak', 'Chris'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Fedak' AND prenom = 'Chris'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Fedak' 
  AND p.prenom = 'Chris'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Chuck' 
  AND p.nom = 'Fedak' 
  AND p.prenom = 'Chris'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Josh Schwartz
INSERT INTO personne (nom, prenom) 
SELECT 'Schwartz', 'Josh'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Schwartz' AND prenom = 'Josh'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Schwartz' 
  AND p.prenom = 'Josh'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Chuck' 
  AND p.nom = 'Schwartz' 
  AND p.prenom = 'Josh'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Cold Case
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Cold Case',
    '28 Sep 2003',
    'The Philadelphia homicide squad''s lone female detective finds her calling when she is assigned "cold cases". Detective Lilly Rush combines her instincts with the updated technology to bring about justice for all the victims she can.'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Cold Case' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Cold Case' AND g.libelle = 'Drama';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Cold Case' AND g.libelle = 'Mystery';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 1 Primetime Emmy. 12 wins & 28 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 1 Primetime Emmy. 12 wins & 28 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Cold Case' AND p.libelle = 'Nominated for 1 Primetime Emmy. 12 wins & 28 nominations total';


-- Insertion de la personne : Kathryn Morris
INSERT INTO personne (nom, prenom) 
SELECT 'Morris', 'Kathryn'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Morris' AND prenom = 'Kathryn'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Morris' 
  AND p.prenom = 'Kathryn'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Cold Case' 
  AND p.nom = 'Morris' 
  AND p.prenom = 'Kathryn'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Danny Pino
INSERT INTO personne (nom, prenom) 
SELECT 'Pino', 'Danny'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Pino' AND prenom = 'Danny'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Pino' 
  AND p.prenom = 'Danny'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Cold Case' 
  AND p.nom = 'Pino' 
  AND p.prenom = 'Danny'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : John Finn
INSERT INTO personne (nom, prenom) 
SELECT 'Finn', 'John'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Finn' AND prenom = 'John'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Finn' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Cold Case' 
  AND p.nom = 'Finn' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Meredith Stiehm
INSERT INTO personne (nom, prenom) 
SELECT 'Stiehm', 'Meredith'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Stiehm' AND prenom = 'Meredith'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Stiehm' 
  AND p.prenom = 'Meredith'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Cold Case' 
  AND p.nom = 'Stiehm' 
  AND p.prenom = 'Meredith'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Community
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Community',
    '17 Sep 2009',
    'A suspended lawyer is forced to enroll in a community college with an eccentric staff and student body.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Community' AND g.libelle = 'Comedy';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 1 Primetime Emmy. 24 wins & 90 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 1 Primetime Emmy. 24 wins & 90 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Community' AND p.libelle = 'Won 1 Primetime Emmy. 24 wins & 90 nominations total';


-- Insertion de la personne : Joel McHale
INSERT INTO personne (nom, prenom) 
SELECT 'McHale', 'Joel'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'McHale' AND prenom = 'Joel'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'McHale' 
  AND p.prenom = 'Joel'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Community' 
  AND p.nom = 'McHale' 
  AND p.prenom = 'Joel'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Danny Pudi
INSERT INTO personne (nom, prenom) 
SELECT 'Pudi', 'Danny'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Pudi' AND prenom = 'Danny'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Pudi' 
  AND p.prenom = 'Danny'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Community' 
  AND p.nom = 'Pudi' 
  AND p.prenom = 'Danny'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Donald Glover
INSERT INTO personne (nom, prenom) 
SELECT 'Glover', 'Donald'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Glover' AND prenom = 'Donald'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Glover' 
  AND p.prenom = 'Donald'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Community' 
  AND p.nom = 'Glover' 
  AND p.prenom = 'Donald'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Dan Harmon
INSERT INTO personne (nom, prenom) 
SELECT 'Harmon', 'Dan'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Harmon' AND prenom = 'Dan'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Harmon' 
  AND p.prenom = 'Dan'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Community' 
  AND p.nom = 'Harmon' 
  AND p.prenom = 'Dan'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Criminal Minds
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Criminal Minds',
    '22 Sep 2005',
    'The FBI''s Behavioral Analysis Unit in Quantico helps police solve violent serial crimes using profiling. Team members analyze evidence and psychology to catch unknown subjects, but their demanding work affects personal lives.'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Criminal Minds' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Criminal Minds' AND g.libelle = 'Drama';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Criminal Minds' AND g.libelle = 'Mystery';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 3 Primetime Emmys. 24 wins & 35 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 3 Primetime Emmys. 24 wins & 35 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Criminal Minds' AND p.libelle = 'Nominated for 3 Primetime Emmys. 24 wins & 35 nominations total';


-- Insertion de la personne : Kirsten Vangsness
INSERT INTO personne (nom, prenom) 
SELECT 'Vangsness', 'Kirsten'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Vangsness' AND prenom = 'Kirsten'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Vangsness' 
  AND p.prenom = 'Kirsten'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Criminal Minds' 
  AND p.nom = 'Vangsness' 
  AND p.prenom = 'Kirsten'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : A.J. Cook
INSERT INTO personne (nom, prenom) 
SELECT 'Cook', 'A.J.'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Cook' AND prenom = 'A.J.'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Cook' 
  AND p.prenom = 'A.J.'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Criminal Minds' 
  AND p.nom = 'Cook' 
  AND p.prenom = 'A.J.'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Matthew Gray Gubler
INSERT INTO personne (nom, prenom) 
SELECT 'Gray Gubler', 'Matthew'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Gray Gubler' AND prenom = 'Matthew'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Gray Gubler' 
  AND p.prenom = 'Matthew'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Criminal Minds' 
  AND p.nom = 'Gray Gubler' 
  AND p.prenom = 'Matthew'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jeff Davis
INSERT INTO personne (nom, prenom) 
SELECT 'Davis', 'Jeff'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Davis' AND prenom = 'Jeff'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Davis' 
  AND p.prenom = 'Jeff'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Criminal Minds' 
  AND p.nom = 'Davis' 
  AND p.prenom = 'Jeff'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Cupid
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Cupid',
    '06 Feb 2020',
    'After being horrendously embarrassed by the mean girls at school, Faye, a practicing witch, summons the evil Cupid to take revenge on all those who wronged her.'
);


-- Insertion du genre : Horror
INSERT INTO genre (libelle) 
SELECT 'Horror'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Horror');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Cupid' AND g.libelle = 'Horror';


-- Insertion de la personne : Georgina Jane
INSERT INTO personne (nom, prenom) 
SELECT 'Jane', 'Georgina'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Jane' AND prenom = 'Georgina'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Jane' 
  AND p.prenom = 'Georgina'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Cupid' 
  AND p.nom = 'Jane' 
  AND p.prenom = 'Georgina'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Michael Owusu
INSERT INTO personne (nom, prenom) 
SELECT 'Owusu', 'Michael'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Owusu' AND prenom = 'Michael'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Owusu' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Cupid' 
  AND p.nom = 'Owusu' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Abi Casson Thompson
INSERT INTO personne (nom, prenom) 
SELECT 'Casson Thompson', 'Abi'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Casson Thompson' AND prenom = 'Abi'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Casson Thompson' 
  AND p.prenom = 'Abi'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Cupid' 
  AND p.nom = 'Casson Thompson' 
  AND p.prenom = 'Abi'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Scott Chambers
INSERT INTO personne (nom, prenom) 
SELECT 'Chambers', 'Scott'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Chambers' AND prenom = 'Scott'
);


-- Insertion du rôle : Realisateur
INSERT INTO role (libelle) 
SELECT 'Realisateur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Realisateur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Realisateur' 
  AND p.nom = 'Chambers' 
  AND p.prenom = 'Scott'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Cupid' 
  AND p.nom = 'Chambers' 
  AND p.prenom = 'Scott'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Scott Chambers
INSERT INTO personne (nom, prenom) 
SELECT 'Chambers', 'Scott'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Chambers' AND prenom = 'Scott'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Chambers' 
  AND p.prenom = 'Scott'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Cupid' 
  AND p.nom = 'Chambers' 
  AND p.prenom = 'Scott'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Day Break
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Day Break',
    '15 Nov 2006',
    'Today Detective Brett Hopper will be accused of shooting state attorney Alberto Garza. He will offer his rock solid alibi. He will realize he''s been framed. And he will run. Then he will wake up and start the day over again.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Day Break' AND g.libelle = 'Action';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Day Break' AND g.libelle = 'Drama';


-- Insertion du genre : Sci-Fi
INSERT INTO genre (libelle) 
SELECT 'Sci-Fi'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Sci-Fi');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Day Break' AND g.libelle = 'Sci-Fi';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '3 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '3 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Day Break' AND p.libelle = '3 nominations total';


-- Insertion de la personne : Taye Diggs
INSERT INTO personne (nom, prenom) 
SELECT 'Diggs', 'Taye'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Diggs' AND prenom = 'Taye'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Diggs' 
  AND p.prenom = 'Taye'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Day Break' 
  AND p.nom = 'Diggs' 
  AND p.prenom = 'Taye'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Moon Bloodgood
INSERT INTO personne (nom, prenom) 
SELECT 'Bloodgood', 'Moon'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Bloodgood' AND prenom = 'Moon'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Bloodgood' 
  AND p.prenom = 'Moon'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Day Break' 
  AND p.nom = 'Bloodgood' 
  AND p.prenom = 'Moon'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Victoria Pratt
INSERT INTO personne (nom, prenom) 
SELECT 'Pratt', 'Victoria'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Pratt' AND prenom = 'Victoria'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Pratt' 
  AND p.prenom = 'Victoria'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Day Break' 
  AND p.nom = 'Pratt' 
  AND p.prenom = 'Victoria'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Paul Zbyszewski
INSERT INTO personne (nom, prenom) 
SELECT 'Zbyszewski', 'Paul'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Zbyszewski' AND prenom = 'Paul'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Zbyszewski' 
  AND p.prenom = 'Paul'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Day Break' 
  AND p.nom = 'Zbyszewski' 
  AND p.prenom = 'Paul'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Demons
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Demons',
    '30 May 1986',
    'A group of random people are invited to a screening of a mysterious movie, only to find themselves trapped in the theater with ravenous demons.'
);


-- Insertion du genre : Horror
INSERT INTO genre (libelle) 
SELECT 'Horror'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Horror');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Demons' AND g.libelle = 'Horror';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '2 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '2 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Demons' AND p.libelle = '2 nominations total';


-- Insertion de la personne : Urbano Barberini
INSERT INTO personne (nom, prenom) 
SELECT 'Barberini', 'Urbano'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Barberini' AND prenom = 'Urbano'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Barberini' 
  AND p.prenom = 'Urbano'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Demons' 
  AND p.nom = 'Barberini' 
  AND p.prenom = 'Urbano'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Natasha Hovey
INSERT INTO personne (nom, prenom) 
SELECT 'Hovey', 'Natasha'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hovey' AND prenom = 'Natasha'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Hovey' 
  AND p.prenom = 'Natasha'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Demons' 
  AND p.nom = 'Hovey' 
  AND p.prenom = 'Natasha'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Karl Zinny
INSERT INTO personne (nom, prenom) 
SELECT 'Zinny', 'Karl'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Zinny' AND prenom = 'Karl'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Zinny' 
  AND p.prenom = 'Karl'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Demons' 
  AND p.nom = 'Zinny' 
  AND p.prenom = 'Karl'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Lamberto Bava
INSERT INTO personne (nom, prenom) 
SELECT 'Bava', 'Lamberto'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Bava' AND prenom = 'Lamberto'
);


-- Insertion du rôle : Realisateur
INSERT INTO role (libelle) 
SELECT 'Realisateur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Realisateur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Realisateur' 
  AND p.nom = 'Bava' 
  AND p.prenom = 'Lamberto'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Demons' 
  AND p.nom = 'Bava' 
  AND p.prenom = 'Lamberto'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Dardano Sacchetti
INSERT INTO personne (nom, prenom) 
SELECT 'Sacchetti', 'Dardano'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Sacchetti' AND prenom = 'Dardano'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Sacchetti' 
  AND p.prenom = 'Dardano'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Demons' 
  AND p.nom = 'Sacchetti' 
  AND p.prenom = 'Dardano'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Dario Argento
INSERT INTO personne (nom, prenom) 
SELECT 'Argento', 'Dario'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Argento' AND prenom = 'Dario'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Argento' 
  AND p.prenom = 'Dario'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Demons' 
  AND p.nom = 'Argento' 
  AND p.prenom = 'Dario'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Lamberto Bava
INSERT INTO personne (nom, prenom) 
SELECT 'Bava', 'Lamberto'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Bava' AND prenom = 'Lamberto'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Bava' 
  AND p.prenom = 'Lamberto'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Demons' 
  AND p.nom = 'Bava' 
  AND p.prenom = 'Lamberto'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Desperate Housewives
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Desperate Housewives',
    '03 Oct 2004',
    'A close-knit group of housewives reside in Wisteria Lane. It may appear to be a seemingly perfect neighborhood but it hides many secrets, crimes, forbidden romances and domestic struggles.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Desperate Housewives' AND g.libelle = 'Comedy';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Desperate Housewives' AND g.libelle = 'Drama';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Desperate Housewives' AND g.libelle = 'Mystery';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 7 Primetime Emmys. 67 wins & 190 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 7 Primetime Emmys. 67 wins & 190 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Desperate Housewives' AND p.libelle = 'Won 7 Primetime Emmys. 67 wins & 190 nominations total';


-- Insertion de la personne : Teri Hatcher
INSERT INTO personne (nom, prenom) 
SELECT 'Hatcher', 'Teri'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hatcher' AND prenom = 'Teri'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Hatcher' 
  AND p.prenom = 'Teri'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Desperate Housewives' 
  AND p.nom = 'Hatcher' 
  AND p.prenom = 'Teri'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Felicity Huffman
INSERT INTO personne (nom, prenom) 
SELECT 'Huffman', 'Felicity'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Huffman' AND prenom = 'Felicity'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Huffman' 
  AND p.prenom = 'Felicity'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Desperate Housewives' 
  AND p.nom = 'Huffman' 
  AND p.prenom = 'Felicity'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Marcia Cross
INSERT INTO personne (nom, prenom) 
SELECT 'Cross', 'Marcia'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Cross' AND prenom = 'Marcia'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Cross' 
  AND p.prenom = 'Marcia'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Desperate Housewives' 
  AND p.nom = 'Cross' 
  AND p.prenom = 'Marcia'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Marc Cherry
INSERT INTO personne (nom, prenom) 
SELECT 'Cherry', 'Marc'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Cherry' AND prenom = 'Marc'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Cherry' 
  AND p.prenom = 'Marc'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Desperate Housewives' 
  AND p.nom = 'Cherry' 
  AND p.prenom = 'Marc'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Dexter
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Dexter',
    '01 Oct 2006',
    'He''s smart. He''s lovable. He''s Dexter Morgan, America''s favorite serial killer, who spends his days solving crimes and his nights committing them.'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Dexter' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Dexter' AND g.libelle = 'Drama';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Dexter' AND g.libelle = 'Mystery';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 4 Primetime Emmys. 56 wins & 202 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 4 Primetime Emmys. 56 wins & 202 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Dexter' AND p.libelle = 'Won 4 Primetime Emmys. 56 wins & 202 nominations total';


-- Insertion de la personne : Michael C. Hall
INSERT INTO personne (nom, prenom) 
SELECT 'C. Hall', 'Michael'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'C. Hall' AND prenom = 'Michael'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'C. Hall' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Dexter' 
  AND p.nom = 'C. Hall' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jennifer Carpenter
INSERT INTO personne (nom, prenom) 
SELECT 'Carpenter', 'Jennifer'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Carpenter' AND prenom = 'Jennifer'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Carpenter' 
  AND p.prenom = 'Jennifer'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Dexter' 
  AND p.nom = 'Carpenter' 
  AND p.prenom = 'Jennifer'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : David Zayas
INSERT INTO personne (nom, prenom) 
SELECT 'Zayas', 'David'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Zayas' AND prenom = 'David'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Zayas' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Dexter' 
  AND p.nom = 'Zayas' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : James Manos Jr.
INSERT INTO personne (nom, prenom) 
SELECT 'Manos Jr.', 'James'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Manos Jr.' AND prenom = 'James'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Manos Jr.' 
  AND p.prenom = 'James'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Dexter' 
  AND p.nom = 'Manos Jr.' 
  AND p.prenom = 'James'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Dirty Sexy Money
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Dirty Sexy Money',
    '26 Sep 2007',
    'A lawyer is forced to take care of one of New York City''s wealthiest families.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Dirty Sexy Money' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 1 Primetime Emmy. 7 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 1 Primetime Emmy. 7 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Dirty Sexy Money' AND p.libelle = 'Nominated for 1 Primetime Emmy. 7 nominations total';


-- Insertion de la personne : Peter Krause
INSERT INTO personne (nom, prenom) 
SELECT 'Krause', 'Peter'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Krause' AND prenom = 'Peter'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Krause' 
  AND p.prenom = 'Peter'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Dirty Sexy Money' 
  AND p.nom = 'Krause' 
  AND p.prenom = 'Peter'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Donald Sutherland
INSERT INTO personne (nom, prenom) 
SELECT 'Sutherland', 'Donald'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Sutherland' AND prenom = 'Donald'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Sutherland' 
  AND p.prenom = 'Donald'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Dirty Sexy Money' 
  AND p.nom = 'Sutherland' 
  AND p.prenom = 'Donald'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : William Baldwin
INSERT INTO personne (nom, prenom) 
SELECT 'Baldwin', 'William'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Baldwin' AND prenom = 'William'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Baldwin' 
  AND p.prenom = 'William'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Dirty Sexy Money' 
  AND p.nom = 'Baldwin' 
  AND p.prenom = 'William'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Craig Wright
INSERT INTO personne (nom, prenom) 
SELECT 'Wright', 'Craig'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Wright' AND prenom = 'Craig'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Wright' 
  AND p.prenom = 'Craig'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Dirty Sexy Money' 
  AND p.nom = 'Wright' 
  AND p.prenom = 'Craig'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Dirt
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Dirt',
    '02 Jan 2007',
    'A tabloid editor and her photographer try to make their way in the world of celebrity journalism.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Dirt' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '1 nomination'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '1 nomination');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Dirt' AND p.libelle = '1 nomination';


-- Insertion de la personne : Courteney Cox
INSERT INTO personne (nom, prenom) 
SELECT 'Cox', 'Courteney'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Cox' AND prenom = 'Courteney'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Cox' 
  AND p.prenom = 'Courteney'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Dirt' 
  AND p.nom = 'Cox' 
  AND p.prenom = 'Courteney'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Ian Hart
INSERT INTO personne (nom, prenom) 
SELECT 'Hart', 'Ian'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hart' AND prenom = 'Ian'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Hart' 
  AND p.prenom = 'Ian'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Dirt' 
  AND p.nom = 'Hart' 
  AND p.prenom = 'Ian'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Josh Stewart
INSERT INTO personne (nom, prenom) 
SELECT 'Stewart', 'Josh'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Stewart' AND prenom = 'Josh'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Stewart' 
  AND p.prenom = 'Josh'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Dirt' 
  AND p.nom = 'Stewart' 
  AND p.prenom = 'Josh'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Matthew Carnahan
INSERT INTO personne (nom, prenom) 
SELECT 'Carnahan', 'Matthew'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Carnahan' AND prenom = 'Matthew'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Carnahan' 
  AND p.prenom = 'Matthew'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Dirt' 
  AND p.nom = 'Carnahan' 
  AND p.prenom = 'Matthew'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Doctor Who
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Doctor Who',
    '17 Mar 2006',
    'Continuing on from Doctor Who (1963), this revival follows the further adventures of the Doctor and their companions as they encounter various alien threats and save civilizations on different planets and time periods.'
);


-- Insertion du genre : Adventure
INSERT INTO genre (libelle) 
SELECT 'Adventure'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Adventure');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Doctor Who' AND g.libelle = 'Adventure';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Doctor Who' AND g.libelle = 'Drama';


-- Insertion du genre : Sci-Fi
INSERT INTO genre (libelle) 
SELECT 'Sci-Fi'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Sci-Fi');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Doctor Who' AND g.libelle = 'Sci-Fi';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 4 BAFTA 121 wins & 220 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 4 BAFTA 121 wins & 220 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Doctor Who' AND p.libelle = 'Won 4 BAFTA 121 wins & 220 nominations total';


-- Insertion de la personne : Jodie Whittaker
INSERT INTO personne (nom, prenom) 
SELECT 'Whittaker', 'Jodie'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Whittaker' AND prenom = 'Jodie'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Whittaker' 
  AND p.prenom = 'Jodie'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Doctor Who' 
  AND p.nom = 'Whittaker' 
  AND p.prenom = 'Jodie'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Peter Capaldi
INSERT INTO personne (nom, prenom) 
SELECT 'Capaldi', 'Peter'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Capaldi' AND prenom = 'Peter'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Capaldi' 
  AND p.prenom = 'Peter'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Doctor Who' 
  AND p.nom = 'Capaldi' 
  AND p.prenom = 'Peter'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Pearl Mackie
INSERT INTO personne (nom, prenom) 
SELECT 'Mackie', 'Pearl'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Mackie' AND prenom = 'Pearl'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Mackie' 
  AND p.prenom = 'Pearl'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Doctor Who' 
  AND p.nom = 'Mackie' 
  AND p.prenom = 'Pearl'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Sydney Newman
INSERT INTO personne (nom, prenom) 
SELECT 'Newman', 'Sydney'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Newman' AND prenom = 'Sydney'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Newman' 
  AND p.prenom = 'Sydney'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Doctor Who' 
  AND p.nom = 'Newman' 
  AND p.prenom = 'Sydney'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Dollhouse
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Dollhouse',
    '13 Feb 2009',
    'A top secret organization erases the identities of attractive young people, turning them into blank "dolls" ready for imprints of temporary identities they need to fulfill assignments for clients.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Dollhouse' AND g.libelle = 'Drama';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Dollhouse' AND g.libelle = 'Mystery';


-- Insertion du genre : Sci-Fi
INSERT INTO genre (libelle) 
SELECT 'Sci-Fi'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Sci-Fi');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Dollhouse' AND g.libelle = 'Sci-Fi';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '5 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '5 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Dollhouse' AND p.libelle = '5 nominations total';


-- Insertion de la personne : Eliza Dushku
INSERT INTO personne (nom, prenom) 
SELECT 'Dushku', 'Eliza'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Dushku' AND prenom = 'Eliza'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Dushku' 
  AND p.prenom = 'Eliza'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Dollhouse' 
  AND p.nom = 'Dushku' 
  AND p.prenom = 'Eliza'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Harry Lennix
INSERT INTO personne (nom, prenom) 
SELECT 'Lennix', 'Harry'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Lennix' AND prenom = 'Harry'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Lennix' 
  AND p.prenom = 'Harry'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Dollhouse' 
  AND p.nom = 'Lennix' 
  AND p.prenom = 'Harry'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Fran Kranz
INSERT INTO personne (nom, prenom) 
SELECT 'Kranz', 'Fran'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Kranz' AND prenom = 'Fran'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Kranz' 
  AND p.prenom = 'Fran'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Dollhouse' 
  AND p.nom = 'Kranz' 
  AND p.prenom = 'Fran'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Joss Whedon
INSERT INTO personne (nom, prenom) 
SELECT 'Whedon', 'Joss'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Whedon' AND prenom = 'Joss'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Whedon' 
  AND p.prenom = 'Joss'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Dollhouse' 
  AND p.nom = 'Whedon' 
  AND p.prenom = 'Joss'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Eleventh Hour
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Eleventh Hour',
    '09 Oct 2008',
    'A government scientist and his tough, attractive FBI handler try to save people from deadly scientific experiments, poisoners, rare diseases, and environmental hazards.'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Eleventh Hour' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Eleventh Hour' AND g.libelle = 'Drama';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Eleventh Hour' AND g.libelle = 'Mystery';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '2 wins'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '2 wins');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Eleventh Hour' AND p.libelle = '2 wins';


-- Insertion de la personne : Rufus Sewell
INSERT INTO personne (nom, prenom) 
SELECT 'Sewell', 'Rufus'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Sewell' AND prenom = 'Rufus'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Sewell' 
  AND p.prenom = 'Rufus'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Eleventh Hour' 
  AND p.nom = 'Sewell' 
  AND p.prenom = 'Rufus'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Marley Shelton
INSERT INTO personne (nom, prenom) 
SELECT 'Shelton', 'Marley'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Shelton' AND prenom = 'Marley'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Shelton' 
  AND p.prenom = 'Marley'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Eleventh Hour' 
  AND p.nom = 'Shelton' 
  AND p.prenom = 'Marley'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Omar Benson Miller
INSERT INTO personne (nom, prenom) 
SELECT 'Benson Miller', 'Omar'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Benson Miller' AND prenom = 'Omar'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Benson Miller' 
  AND p.prenom = 'Omar'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Eleventh Hour' 
  AND p.nom = 'Benson Miller' 
  AND p.prenom = 'Omar'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Stephen Gallagher
INSERT INTO personne (nom, prenom) 
SELECT 'Gallagher', 'Stephen'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Gallagher' AND prenom = 'Stephen'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Gallagher' 
  AND p.prenom = 'Stephen'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Eleventh Hour' 
  AND p.nom = 'Gallagher' 
  AND p.prenom = 'Stephen'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Entourage
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Entourage',
    '18 Jul 2004',
    'Film star, Vince Chase, navigates the vapid terrain of Los Angeles with a close circle of friends and his trusty agent.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Entourage' AND g.libelle = 'Comedy';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Entourage' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 6 Primetime Emmys. 14 wins & 106 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 6 Primetime Emmys. 14 wins & 106 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Entourage' AND p.libelle = 'Won 6 Primetime Emmys. 14 wins & 106 nominations total';


-- Insertion de la personne : Kevin Connolly
INSERT INTO personne (nom, prenom) 
SELECT 'Connolly', 'Kevin'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Connolly' AND prenom = 'Kevin'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Connolly' 
  AND p.prenom = 'Kevin'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Entourage' 
  AND p.nom = 'Connolly' 
  AND p.prenom = 'Kevin'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Adrian Grenier
INSERT INTO personne (nom, prenom) 
SELECT 'Grenier', 'Adrian'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Grenier' AND prenom = 'Adrian'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Grenier' 
  AND p.prenom = 'Adrian'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Entourage' 
  AND p.nom = 'Grenier' 
  AND p.prenom = 'Adrian'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Kevin Dillon
INSERT INTO personne (nom, prenom) 
SELECT 'Dillon', 'Kevin'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Dillon' AND prenom = 'Kevin'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Dillon' 
  AND p.prenom = 'Kevin'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Entourage' 
  AND p.nom = 'Dillon' 
  AND p.prenom = 'Kevin'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Doug Ellin
INSERT INTO personne (nom, prenom) 
SELECT 'Ellin', 'Doug'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Ellin' AND prenom = 'Doug'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Ellin' 
  AND p.prenom = 'Doug'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Entourage' 
  AND p.nom = 'Ellin' 
  AND p.prenom = 'Doug'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Eureka
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Eureka',
    '18 Jul 2006',
    'A U.S. Marshal becomes the sheriff of Eureka, a remote, cozy little Northwestern town where the best minds in the US have secretly been tucked away to build futuristic inventions for the government which often go disastrously wrong.'
);


-- Insertion du genre : Adventure
INSERT INTO genre (libelle) 
SELECT 'Adventure'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Adventure');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Eureka' AND g.libelle = 'Adventure';


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Eureka' AND g.libelle = 'Comedy';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Eureka' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 1 Primetime Emmy. 2 wins & 14 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 1 Primetime Emmy. 2 wins & 14 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Eureka' AND p.libelle = 'Nominated for 1 Primetime Emmy. 2 wins & 14 nominations total';


-- Insertion de la personne : Colin Ferguson
INSERT INTO personne (nom, prenom) 
SELECT 'Ferguson', 'Colin'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Ferguson' AND prenom = 'Colin'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Ferguson' 
  AND p.prenom = 'Colin'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Eureka' 
  AND p.nom = 'Ferguson' 
  AND p.prenom = 'Colin'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Salli Richardson-Whitfield
INSERT INTO personne (nom, prenom) 
SELECT 'Richardson-Whitfield', 'Salli'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Richardson-Whitfield' AND prenom = 'Salli'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Richardson-Whitfield' 
  AND p.prenom = 'Salli'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Eureka' 
  AND p.nom = 'Richardson-Whitfield' 
  AND p.prenom = 'Salli'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Erica Cerra
INSERT INTO personne (nom, prenom) 
SELECT 'Cerra', 'Erica'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Cerra' AND prenom = 'Erica'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Cerra' 
  AND p.prenom = 'Erica'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Eureka' 
  AND p.nom = 'Cerra' 
  AND p.prenom = 'Erica'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Andrew Cosby
INSERT INTO personne (nom, prenom) 
SELECT 'Cosby', 'Andrew'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Cosby' AND prenom = 'Andrew'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Cosby' 
  AND p.prenom = 'Andrew'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Eureka' 
  AND p.nom = 'Cosby' 
  AND p.prenom = 'Andrew'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jaime Paglia
INSERT INTO personne (nom, prenom) 
SELECT 'Paglia', 'Jaime'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Paglia' AND prenom = 'Jaime'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Paglia' 
  AND p.prenom = 'Jaime'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Eureka' 
  AND p.nom = 'Paglia' 
  AND p.prenom = 'Jaime'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Extras
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Extras',
    '25 Sep 2005',
    'Andy Millman is an actor with ambition and a script. Reduced to working as an extra with a useless agent, Andy''s attempts to boost his career invariably end in failure and embarrassment.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Extras' AND g.libelle = 'Comedy';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Extras' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 1 Primetime Emmy. 16 wins & 47 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 1 Primetime Emmy. 16 wins & 47 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Extras' AND p.libelle = 'Won 1 Primetime Emmy. 16 wins & 47 nominations total';


-- Insertion de la personne : Ricky Gervais
INSERT INTO personne (nom, prenom) 
SELECT 'Gervais', 'Ricky'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Gervais' AND prenom = 'Ricky'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Gervais' 
  AND p.prenom = 'Ricky'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Extras' 
  AND p.nom = 'Gervais' 
  AND p.prenom = 'Ricky'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Ashley Jensen
INSERT INTO personne (nom, prenom) 
SELECT 'Jensen', 'Ashley'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Jensen' AND prenom = 'Ashley'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Jensen' 
  AND p.prenom = 'Ashley'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Extras' 
  AND p.nom = 'Jensen' 
  AND p.prenom = 'Ashley'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Stephen Merchant
INSERT INTO personne (nom, prenom) 
SELECT 'Merchant', 'Stephen'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Merchant' AND prenom = 'Stephen'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Merchant' 
  AND p.prenom = 'Stephen'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Extras' 
  AND p.nom = 'Merchant' 
  AND p.prenom = 'Stephen'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Ricky Gervais
INSERT INTO personne (nom, prenom) 
SELECT 'Gervais', 'Ricky'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Gervais' AND prenom = 'Ricky'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Gervais' 
  AND p.prenom = 'Ricky'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Extras' 
  AND p.nom = 'Gervais' 
  AND p.prenom = 'Ricky'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Stephen Merchant
INSERT INTO personne (nom, prenom) 
SELECT 'Merchant', 'Stephen'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Merchant' AND prenom = 'Stephen'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Merchant' 
  AND p.prenom = 'Stephen'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Extras' 
  AND p.nom = 'Merchant' 
  AND p.prenom = 'Stephen'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Fear Itself
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Fear Itself',
    '05 Jun 2008',
    'A television series broken down into 13 separate 60-minute films from premiere horror writers and directors.'
);


-- Insertion du genre : Horror
INSERT INTO genre (libelle) 
SELECT 'Horror'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Horror');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Fear Itself' AND g.libelle = 'Horror';


-- Insertion de la personne : Margherita Donato
INSERT INTO personne (nom, prenom) 
SELECT 'Donato', 'Margherita'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Donato' AND prenom = 'Margherita'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Donato' 
  AND p.prenom = 'Margherita'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Fear Itself' 
  AND p.nom = 'Donato' 
  AND p.prenom = 'Margherita'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Valerie White
INSERT INTO personne (nom, prenom) 
SELECT 'White', 'Valerie'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'White' AND prenom = 'Valerie'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'White' 
  AND p.prenom = 'Valerie'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Fear Itself' 
  AND p.nom = 'White' 
  AND p.prenom = 'Valerie'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Maggie Lawson
INSERT INTO personne (nom, prenom) 
SELECT 'Lawson', 'Maggie'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Lawson' AND prenom = 'Maggie'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Lawson' 
  AND p.prenom = 'Maggie'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Fear Itself' 
  AND p.nom = 'Lawson' 
  AND p.prenom = 'Maggie'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Mick Garris
INSERT INTO personne (nom, prenom) 
SELECT 'Garris', 'Mick'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Garris' AND prenom = 'Mick'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Garris' 
  AND p.prenom = 'Mick'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Fear Itself' 
  AND p.nom = 'Garris' 
  AND p.prenom = 'Mick'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Flashforward
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Flashforward',
    '24 Sep 2009',
    'A special FBI task force investigates after every person on Earth simultaneously blacks out and awakens with nothing but a short vision of their future.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Flashforward' AND g.libelle = 'Drama';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Flashforward' AND g.libelle = 'Mystery';


-- Insertion du genre : Sci-Fi
INSERT INTO genre (libelle) 
SELECT 'Sci-Fi'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Sci-Fi');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Flashforward' AND g.libelle = 'Sci-Fi';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 1 Primetime Emmy. 1 win & 13 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 1 Primetime Emmy. 1 win & 13 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Flashforward' AND p.libelle = 'Won 1 Primetime Emmy. 1 win & 13 nominations total';


-- Insertion de la personne : Courtney B. Vance
INSERT INTO personne (nom, prenom) 
SELECT 'B. Vance', 'Courtney'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'B. Vance' AND prenom = 'Courtney'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'B. Vance' 
  AND p.prenom = 'Courtney'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Flashforward' 
  AND p.nom = 'B. Vance' 
  AND p.prenom = 'Courtney'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Joseph Fiennes
INSERT INTO personne (nom, prenom) 
SELECT 'Fiennes', 'Joseph'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Fiennes' AND prenom = 'Joseph'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Fiennes' 
  AND p.prenom = 'Joseph'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Flashforward' 
  AND p.nom = 'Fiennes' 
  AND p.prenom = 'Joseph'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jack Davenport
INSERT INTO personne (nom, prenom) 
SELECT 'Davenport', 'Jack'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Davenport' AND prenom = 'Jack'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Davenport' 
  AND p.prenom = 'Jack'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Flashforward' 
  AND p.nom = 'Davenport' 
  AND p.prenom = 'Jack'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Brannon Braga
INSERT INTO personne (nom, prenom) 
SELECT 'Braga', 'Brannon'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Braga' AND prenom = 'Brannon'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Braga' 
  AND p.prenom = 'Brannon'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Flashforward' 
  AND p.nom = 'Braga' 
  AND p.prenom = 'Brannon'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : David S. Goyer
INSERT INTO personne (nom, prenom) 
SELECT 'S. Goyer', 'David'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'S. Goyer' AND prenom = 'David'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'S. Goyer' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Flashforward' 
  AND p.nom = 'S. Goyer' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Flash Point
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Flash Point',
    '03 Aug 2007',
    'A hot-headed inspector takes on a small but powerful Vietnamese-Chinese gang, after a series of crimes and murder attempts committed and putting an undercover cop and his girlfriend in great danger.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Flash Point' AND g.libelle = 'Action';


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Flash Point' AND g.libelle = 'Crime';


-- Insertion du genre : Thriller
INSERT INTO genre (libelle) 
SELECT 'Thriller'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Thriller');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Flash Point' AND g.libelle = 'Thriller';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '3 wins & 2 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '3 wins & 2 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Flash Point' AND p.libelle = '3 wins & 2 nominations total';


-- Insertion de la personne : Donnie Yen
INSERT INTO personne (nom, prenom) 
SELECT 'Yen', 'Donnie'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Yen' AND prenom = 'Donnie'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Yen' 
  AND p.prenom = 'Donnie'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Flash Point' 
  AND p.nom = 'Yen' 
  AND p.prenom = 'Donnie'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Louis Koo
INSERT INTO personne (nom, prenom) 
SELECT 'Koo', 'Louis'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Koo' AND prenom = 'Louis'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Koo' 
  AND p.prenom = 'Louis'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Flash Point' 
  AND p.nom = 'Koo' 
  AND p.prenom = 'Louis'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Ray Lui
INSERT INTO personne (nom, prenom) 
SELECT 'Lui', 'Ray'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Lui' AND prenom = 'Ray'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Lui' 
  AND p.prenom = 'Ray'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Flash Point' 
  AND p.nom = 'Lui' 
  AND p.prenom = 'Ray'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Wilson Yip
INSERT INTO personne (nom, prenom) 
SELECT 'Yip', 'Wilson'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Yip' AND prenom = 'Wilson'
);


-- Insertion du rôle : Realisateur
INSERT INTO role (libelle) 
SELECT 'Realisateur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Realisateur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Realisateur' 
  AND p.nom = 'Yip' 
  AND p.prenom = 'Wilson'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Flash Point' 
  AND p.nom = 'Yip' 
  AND p.prenom = 'Wilson'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Kam-Yuen Szeto
INSERT INTO personne (nom, prenom) 
SELECT 'Szeto', 'Kam-Yuen'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Szeto' AND prenom = 'Kam-Yuen'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Szeto' 
  AND p.prenom = 'Kam-Yuen'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Flash Point' 
  AND p.nom = 'Szeto' 
  AND p.prenom = 'Kam-Yuen'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Lik-Kei Tang
INSERT INTO personne (nom, prenom) 
SELECT 'Tang', 'Lik-Kei'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Tang' AND prenom = 'Lik-Kei'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Tang' 
  AND p.prenom = 'Lik-Kei'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Flash Point' 
  AND p.nom = 'Tang' 
  AND p.prenom = 'Lik-Kei'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Flight of the Conchords
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Flight of the Conchords',
    '17 Jun 2007',
    'Bret and Jemaine are Flight of the Conchords, a folk-rock band from New Zealand living in New York City in search of stardom.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Flight of the Conchords' AND g.libelle = 'Comedy';


-- Insertion du genre : Music
INSERT INTO genre (libelle) 
SELECT 'Music'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Music');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Flight of the Conchords' AND g.libelle = 'Music';


-- Insertion du genre : Musical
INSERT INTO genre (libelle) 
SELECT 'Musical'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Musical');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Flight of the Conchords' AND g.libelle = 'Musical';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 10 Primetime Emmys. 3 wins & 28 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 10 Primetime Emmys. 3 wins & 28 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Flight of the Conchords' AND p.libelle = 'Nominated for 10 Primetime Emmys. 3 wins & 28 nominations total';


-- Insertion de la personne : Jemaine Clement
INSERT INTO personne (nom, prenom) 
SELECT 'Clement', 'Jemaine'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Clement' AND prenom = 'Jemaine'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Clement' 
  AND p.prenom = 'Jemaine'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Flight of the Conchords' 
  AND p.nom = 'Clement' 
  AND p.prenom = 'Jemaine'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Bret McKenzie
INSERT INTO personne (nom, prenom) 
SELECT 'McKenzie', 'Bret'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'McKenzie' AND prenom = 'Bret'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'McKenzie' 
  AND p.prenom = 'Bret'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Flight of the Conchords' 
  AND p.nom = 'McKenzie' 
  AND p.prenom = 'Bret'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Rhys Darby
INSERT INTO personne (nom, prenom) 
SELECT 'Darby', 'Rhys'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Darby' AND prenom = 'Rhys'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Darby' 
  AND p.prenom = 'Rhys'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Flight of the Conchords' 
  AND p.nom = 'Darby' 
  AND p.prenom = 'Rhys'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : James Bobin
INSERT INTO personne (nom, prenom) 
SELECT 'Bobin', 'James'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Bobin' AND prenom = 'James'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Bobin' 
  AND p.prenom = 'James'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Flight of the Conchords' 
  AND p.nom = 'Bobin' 
  AND p.prenom = 'James'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jemaine Clement
INSERT INTO personne (nom, prenom) 
SELECT 'Clement', 'Jemaine'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Clement' AND prenom = 'Jemaine'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Clement' 
  AND p.prenom = 'Jemaine'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Flight of the Conchords' 
  AND p.nom = 'Clement' 
  AND p.prenom = 'Jemaine'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Bret McKenzie
INSERT INTO personne (nom, prenom) 
SELECT 'McKenzie', 'Bret'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'McKenzie' AND prenom = 'Bret'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'McKenzie' 
  AND p.prenom = 'Bret'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Flight of the Conchords' 
  AND p.nom = 'McKenzie' 
  AND p.prenom = 'Bret'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Friday Night Lights
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Friday Night Lights',
    '03 Oct 2006',
    'A drama that follows the lives of the Dillon Panthers, one of the nation''s best high school football teams, and their head coach Eric Taylor.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Friday Night Lights' AND g.libelle = 'Drama';


-- Insertion du genre : Sport
INSERT INTO genre (libelle) 
SELECT 'Sport'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Sport');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Friday Night Lights' AND g.libelle = 'Sport';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 3 Primetime Emmys. 22 wins & 122 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 3 Primetime Emmys. 22 wins & 122 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Friday Night Lights' AND p.libelle = 'Won 3 Primetime Emmys. 22 wins & 122 nominations total';


-- Insertion de la personne : Kyle Chandler
INSERT INTO personne (nom, prenom) 
SELECT 'Chandler', 'Kyle'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Chandler' AND prenom = 'Kyle'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Chandler' 
  AND p.prenom = 'Kyle'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Friday Night Lights' 
  AND p.nom = 'Chandler' 
  AND p.prenom = 'Kyle'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Connie Britton
INSERT INTO personne (nom, prenom) 
SELECT 'Britton', 'Connie'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Britton' AND prenom = 'Connie'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Britton' 
  AND p.prenom = 'Connie'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Friday Night Lights' 
  AND p.nom = 'Britton' 
  AND p.prenom = 'Connie'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Zach Gilford
INSERT INTO personne (nom, prenom) 
SELECT 'Gilford', 'Zach'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Gilford' AND prenom = 'Zach'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Gilford' 
  AND p.prenom = 'Zach'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Friday Night Lights' 
  AND p.nom = 'Gilford' 
  AND p.prenom = 'Zach'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Peter Berg
INSERT INTO personne (nom, prenom) 
SELECT 'Berg', 'Peter'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Berg' AND prenom = 'Peter'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Berg' 
  AND p.prenom = 'Peter'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Friday Night Lights' 
  AND p.nom = 'Berg' 
  AND p.prenom = 'Peter'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Friends
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Friends',
    '22 Sep 1994',
    'The personal and professional lives of six friends living in the Manhattan borough of New York City.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Friends' AND g.libelle = 'Comedy';


-- Insertion du genre : Romance
INSERT INTO genre (libelle) 
SELECT 'Romance'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Romance');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Friends' AND g.libelle = 'Romance';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 6 Primetime Emmys. 79 wins & 231 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 6 Primetime Emmys. 79 wins & 231 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Friends' AND p.libelle = 'Won 6 Primetime Emmys. 79 wins & 231 nominations total';


-- Insertion de la personne : Jennifer Aniston
INSERT INTO personne (nom, prenom) 
SELECT 'Aniston', 'Jennifer'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Aniston' AND prenom = 'Jennifer'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Aniston' 
  AND p.prenom = 'Jennifer'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Friends' 
  AND p.nom = 'Aniston' 
  AND p.prenom = 'Jennifer'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Courteney Cox
INSERT INTO personne (nom, prenom) 
SELECT 'Cox', 'Courteney'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Cox' AND prenom = 'Courteney'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Cox' 
  AND p.prenom = 'Courteney'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Friends' 
  AND p.nom = 'Cox' 
  AND p.prenom = 'Courteney'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Lisa Kudrow
INSERT INTO personne (nom, prenom) 
SELECT 'Kudrow', 'Lisa'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Kudrow' AND prenom = 'Lisa'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Kudrow' 
  AND p.prenom = 'Lisa'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Friends' 
  AND p.nom = 'Kudrow' 
  AND p.prenom = 'Lisa'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : David Crane
INSERT INTO personne (nom, prenom) 
SELECT 'Crane', 'David'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Crane' AND prenom = 'David'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Crane' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Friends' 
  AND p.nom = 'Crane' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Marta Kauffman
INSERT INTO personne (nom, prenom) 
SELECT 'Kauffman', 'Marta'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Kauffman' AND prenom = 'Marta'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Kauffman' 
  AND p.prenom = 'Marta'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Friends' 
  AND p.nom = 'Kauffman' 
  AND p.prenom = 'Marta'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Fringe
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Fringe',
    '09 Sep 2008',
    'An F.B.I. agent is forced to work with an institutionalized scientist and his son in order to rationalize a brewing storm of unexplained phenomena.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Fringe' AND g.libelle = 'Drama';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Fringe' AND g.libelle = 'Mystery';


-- Insertion du genre : Sci-Fi
INSERT INTO genre (libelle) 
SELECT 'Sci-Fi'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Sci-Fi');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Fringe' AND g.libelle = 'Sci-Fi';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 3 Primetime Emmys. 18 wins & 90 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 3 Primetime Emmys. 18 wins & 90 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Fringe' AND p.libelle = 'Nominated for 3 Primetime Emmys. 18 wins & 90 nominations total';


-- Insertion de la personne : Anna Torv
INSERT INTO personne (nom, prenom) 
SELECT 'Torv', 'Anna'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Torv' AND prenom = 'Anna'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Torv' 
  AND p.prenom = 'Anna'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Fringe' 
  AND p.nom = 'Torv' 
  AND p.prenom = 'Anna'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Joshua Jackson
INSERT INTO personne (nom, prenom) 
SELECT 'Jackson', 'Joshua'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Jackson' AND prenom = 'Joshua'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Jackson' 
  AND p.prenom = 'Joshua'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Fringe' 
  AND p.nom = 'Jackson' 
  AND p.prenom = 'Joshua'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : John Noble
INSERT INTO personne (nom, prenom) 
SELECT 'Noble', 'John'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Noble' AND prenom = 'John'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Noble' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Fringe' 
  AND p.nom = 'Noble' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : J.J. Abrams
INSERT INTO personne (nom, prenom) 
SELECT 'Abrams', 'J.J.'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Abrams' AND prenom = 'J.J.'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Abrams' 
  AND p.prenom = 'J.J.'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Fringe' 
  AND p.nom = 'Abrams' 
  AND p.prenom = 'J.J.'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Alex Kurtzman
INSERT INTO personne (nom, prenom) 
SELECT 'Kurtzman', 'Alex'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Kurtzman' AND prenom = 'Alex'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Kurtzman' 
  AND p.prenom = 'Alex'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Fringe' 
  AND p.nom = 'Kurtzman' 
  AND p.prenom = 'Alex'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Roberto Orci
INSERT INTO personne (nom, prenom) 
SELECT 'Orci', 'Roberto'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Orci' AND prenom = 'Roberto'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Orci' 
  AND p.prenom = 'Roberto'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Fringe' 
  AND p.nom = 'Orci' 
  AND p.prenom = 'Roberto'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Futurama
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Futurama',
    '28 Mar 1999',
    'Philip J. Fry, a pizza delivery boy, is accidentally frozen in 1999 and thawed out on New Year''s Eve 2999.'
);


-- Insertion du genre : Animation
INSERT INTO genre (libelle) 
SELECT 'Animation'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Animation');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Futurama' AND g.libelle = 'Animation';


-- Insertion du genre : Adventure
INSERT INTO genre (libelle) 
SELECT 'Adventure'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Adventure');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Futurama' AND g.libelle = 'Adventure';


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Futurama' AND g.libelle = 'Comedy';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 6 Primetime Emmys. 30 wins & 58 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 6 Primetime Emmys. 30 wins & 58 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Futurama' AND p.libelle = 'Won 6 Primetime Emmys. 30 wins & 58 nominations total';


-- Insertion de la personne : Billy West
INSERT INTO personne (nom, prenom) 
SELECT 'West', 'Billy'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'West' AND prenom = 'Billy'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'West' 
  AND p.prenom = 'Billy'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Futurama' 
  AND p.nom = 'West' 
  AND p.prenom = 'Billy'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : John DiMaggio
INSERT INTO personne (nom, prenom) 
SELECT 'DiMaggio', 'John'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'DiMaggio' AND prenom = 'John'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'DiMaggio' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Futurama' 
  AND p.nom = 'DiMaggio' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Katey Sagal
INSERT INTO personne (nom, prenom) 
SELECT 'Sagal', 'Katey'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Sagal' AND prenom = 'Katey'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Sagal' 
  AND p.prenom = 'Katey'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Futurama' 
  AND p.nom = 'Sagal' 
  AND p.prenom = 'Katey'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : David X. Cohen
INSERT INTO personne (nom, prenom) 
SELECT 'X. Cohen', 'David'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'X. Cohen' AND prenom = 'David'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'X. Cohen' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Futurama' 
  AND p.nom = 'X. Cohen' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Matt Groening
INSERT INTO personne (nom, prenom) 
SELECT 'Groening', 'Matt'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Groening' AND prenom = 'Matt'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Groening' 
  AND p.prenom = 'Matt'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Futurama' 
  AND p.nom = 'Groening' 
  AND p.prenom = 'Matt'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Gary Unmarried
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Gary Unmarried',
    '24 Sep 2008',
    'Newly divorced after fifteen years of marriage, Gary Brooks, a painting contractor, strives to balance work, shared custody of his two children, a controlling ex-wife, and his foxy new girlfriend.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Gary Unmarried' AND g.libelle = 'Comedy';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 1 Primetime Emmy. 3 wins & 4 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 1 Primetime Emmy. 3 wins & 4 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Gary Unmarried' AND p.libelle = 'Nominated for 1 Primetime Emmy. 3 wins & 4 nominations total';


-- Insertion de la personne : Jay Mohr
INSERT INTO personne (nom, prenom) 
SELECT 'Mohr', 'Jay'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Mohr' AND prenom = 'Jay'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Mohr' 
  AND p.prenom = 'Jay'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Gary Unmarried' 
  AND p.nom = 'Mohr' 
  AND p.prenom = 'Jay'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Paula Marshall
INSERT INTO personne (nom, prenom) 
SELECT 'Marshall', 'Paula'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Marshall' AND prenom = 'Paula'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Marshall' 
  AND p.prenom = 'Paula'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Gary Unmarried' 
  AND p.nom = 'Marshall' 
  AND p.prenom = 'Paula'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Ryan Malgarini
INSERT INTO personne (nom, prenom) 
SELECT 'Malgarini', 'Ryan'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Malgarini' AND prenom = 'Ryan'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Malgarini' 
  AND p.prenom = 'Ryan'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Gary Unmarried' 
  AND p.nom = 'Malgarini' 
  AND p.prenom = 'Ryan'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Ed Yeager
INSERT INTO personne (nom, prenom) 
SELECT 'Yeager', 'Ed'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Yeager' AND prenom = 'Ed'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Yeager' 
  AND p.prenom = 'Ed'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Gary Unmarried' 
  AND p.nom = 'Yeager' 
  AND p.prenom = 'Ed'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Ghost Whisperer
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Ghost Whisperer',
    '23 Sep 2005',
    'A young woman communicates with earthbound spirits.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Ghost Whisperer' AND g.libelle = 'Drama';


-- Insertion du genre : Fantasy
INSERT INTO genre (libelle) 
SELECT 'Fantasy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Fantasy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Ghost Whisperer' AND g.libelle = 'Fantasy';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 4 Primetime Emmys. 6 wins & 25 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 4 Primetime Emmys. 6 wins & 25 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Ghost Whisperer' AND p.libelle = 'Nominated for 4 Primetime Emmys. 6 wins & 25 nominations total';


-- Insertion de la personne : Jennifer Love Hewitt
INSERT INTO personne (nom, prenom) 
SELECT 'Love Hewitt', 'Jennifer'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Love Hewitt' AND prenom = 'Jennifer'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Love Hewitt' 
  AND p.prenom = 'Jennifer'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Ghost Whisperer' 
  AND p.nom = 'Love Hewitt' 
  AND p.prenom = 'Jennifer'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : David Conrad
INSERT INTO personne (nom, prenom) 
SELECT 'Conrad', 'David'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Conrad' AND prenom = 'David'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Conrad' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Ghost Whisperer' 
  AND p.nom = 'Conrad' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Camryn Manheim
INSERT INTO personne (nom, prenom) 
SELECT 'Manheim', 'Camryn'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Manheim' AND prenom = 'Camryn'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Manheim' 
  AND p.prenom = 'Camryn'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Ghost Whisperer' 
  AND p.nom = 'Manheim' 
  AND p.prenom = 'Camryn'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : John Gray
INSERT INTO personne (nom, prenom) 
SELECT 'Gray', 'John'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Gray' AND prenom = 'John'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Gray' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Ghost Whisperer' 
  AND p.nom = 'Gray' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Gossip Girl
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Gossip Girl',
    '19 Sep 2007',
    'Narrated by a mysterious vicious blogger, this show follows a set of wealthy teenagers through their day-to-day scandalous lives as Manhattans Elite, and how they betray each other for each other''s gain.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Gossip Girl' AND g.libelle = 'Drama';


-- Insertion du genre : Romance
INSERT INTO genre (libelle) 
SELECT 'Romance'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Romance');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Gossip Girl' AND g.libelle = 'Romance';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '22 wins & 39 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '22 wins & 39 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Gossip Girl' AND p.libelle = '22 wins & 39 nominations total';


-- Insertion de la personne : Blake Lively
INSERT INTO personne (nom, prenom) 
SELECT 'Lively', 'Blake'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Lively' AND prenom = 'Blake'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Lively' 
  AND p.prenom = 'Blake'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Gossip Girl' 
  AND p.nom = 'Lively' 
  AND p.prenom = 'Blake'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Leighton Meester
INSERT INTO personne (nom, prenom) 
SELECT 'Meester', 'Leighton'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Meester' AND prenom = 'Leighton'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Meester' 
  AND p.prenom = 'Leighton'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Gossip Girl' 
  AND p.nom = 'Meester' 
  AND p.prenom = 'Leighton'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Penn Badgley
INSERT INTO personne (nom, prenom) 
SELECT 'Badgley', 'Penn'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Badgley' AND prenom = 'Penn'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Badgley' 
  AND p.prenom = 'Penn'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Gossip Girl' 
  AND p.nom = 'Badgley' 
  AND p.prenom = 'Penn'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Stephanie Savage
INSERT INTO personne (nom, prenom) 
SELECT 'Savage', 'Stephanie'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Savage' AND prenom = 'Stephanie'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Savage' 
  AND p.prenom = 'Stephanie'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Gossip Girl' 
  AND p.nom = 'Savage' 
  AND p.prenom = 'Stephanie'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Josh Schwartz
INSERT INTO personne (nom, prenom) 
SELECT 'Schwartz', 'Josh'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Schwartz' AND prenom = 'Josh'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Schwartz' 
  AND p.prenom = 'Josh'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Gossip Girl' 
  AND p.nom = 'Schwartz' 
  AND p.prenom = 'Josh'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Greek
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Greek',
    '09 Jul 2007',
    'Freshman Rusty Cartwright arrives at college and decides he no longer wants to be the boring geek from high school. He decides to pledge a fraternity. He is offered 2 bids; one from his sister''s boyfriend Evan''s fraternity and one...'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Greek' AND g.libelle = 'Comedy';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Greek' AND g.libelle = 'Drama';


-- Insertion du genre : Family
INSERT INTO genre (libelle) 
SELECT 'Family'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Family');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Greek' AND g.libelle = 'Family';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '7 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '7 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Greek' AND p.libelle = '7 nominations total';


-- Insertion de la personne : Clark Duke
INSERT INTO personne (nom, prenom) 
SELECT 'Duke', 'Clark'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Duke' AND prenom = 'Clark'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Duke' 
  AND p.prenom = 'Clark'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Greek' 
  AND p.nom = 'Duke' 
  AND p.prenom = 'Clark'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Scott Michael Foster
INSERT INTO personne (nom, prenom) 
SELECT 'Michael Foster', 'Scott'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Michael Foster' AND prenom = 'Scott'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Michael Foster' 
  AND p.prenom = 'Scott'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Greek' 
  AND p.nom = 'Michael Foster' 
  AND p.prenom = 'Scott'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Spencer Grammer
INSERT INTO personne (nom, prenom) 
SELECT 'Grammer', 'Spencer'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Grammer' AND prenom = 'Spencer'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Grammer' 
  AND p.prenom = 'Spencer'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Greek' 
  AND p.nom = 'Grammer' 
  AND p.prenom = 'Spencer'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Patrick Sean Smith
INSERT INTO personne (nom, prenom) 
SELECT 'Sean Smith', 'Patrick'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Sean Smith' AND prenom = 'Patrick'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Sean Smith' 
  AND p.prenom = 'Patrick'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Greek' 
  AND p.nom = 'Sean Smith' 
  AND p.prenom = 'Patrick'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Heroes
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Heroes',
    '25 Sep 2006',
    'Common people discover that they have super powers. Their lives intertwine as a devastating event must be prevented.'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Heroes' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Heroes' AND g.libelle = 'Drama';


-- Insertion du genre : Fantasy
INSERT INTO genre (libelle) 
SELECT 'Fantasy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Fantasy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Heroes' AND g.libelle = 'Fantasy';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 1 Primetime Emmy. 31 wins & 108 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 1 Primetime Emmy. 31 wins & 108 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Heroes' AND p.libelle = 'Won 1 Primetime Emmy. 31 wins & 108 nominations total';


-- Insertion de la personne : Jack Coleman
INSERT INTO personne (nom, prenom) 
SELECT 'Coleman', 'Jack'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Coleman' AND prenom = 'Jack'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Coleman' 
  AND p.prenom = 'Jack'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Heroes' 
  AND p.nom = 'Coleman' 
  AND p.prenom = 'Jack'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Hayden Panettiere
INSERT INTO personne (nom, prenom) 
SELECT 'Panettiere', 'Hayden'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Panettiere' AND prenom = 'Hayden'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Panettiere' 
  AND p.prenom = 'Hayden'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Heroes' 
  AND p.nom = 'Panettiere' 
  AND p.prenom = 'Hayden'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Milo Ventimiglia
INSERT INTO personne (nom, prenom) 
SELECT 'Ventimiglia', 'Milo'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Ventimiglia' AND prenom = 'Milo'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Ventimiglia' 
  AND p.prenom = 'Milo'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Heroes' 
  AND p.nom = 'Ventimiglia' 
  AND p.prenom = 'Milo'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Tim Kring
INSERT INTO personne (nom, prenom) 
SELECT 'Kring', 'Tim'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Kring' AND prenom = 'Tim'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Kring' 
  AND p.prenom = 'Tim'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Heroes' 
  AND p.nom = 'Kring' 
  AND p.prenom = 'Tim'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : House
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'House',
    '16 Nov 2004',
    'Using a crack team of doctors and his wits, an antisocial maverick doctor specializing in diagnostic medicine does whatever it takes to solve puzzling cases that come his way.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'House' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 5 Primetime Emmys. 58 wins & 140 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 5 Primetime Emmys. 58 wins & 140 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'House' AND p.libelle = 'Won 5 Primetime Emmys. 58 wins & 140 nominations total';


-- Insertion de la personne : Hugh Laurie
INSERT INTO personne (nom, prenom) 
SELECT 'Laurie', 'Hugh'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Laurie' AND prenom = 'Hugh'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Laurie' 
  AND p.prenom = 'Hugh'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'House' 
  AND p.nom = 'Laurie' 
  AND p.prenom = 'Hugh'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Omar Epps
INSERT INTO personne (nom, prenom) 
SELECT 'Epps', 'Omar'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Epps' AND prenom = 'Omar'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Epps' 
  AND p.prenom = 'Omar'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'House' 
  AND p.nom = 'Epps' 
  AND p.prenom = 'Omar'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Robert Sean Leonard
INSERT INTO personne (nom, prenom) 
SELECT 'Sean Leonard', 'Robert'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Sean Leonard' AND prenom = 'Robert'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Sean Leonard' 
  AND p.prenom = 'Robert'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'House' 
  AND p.nom = 'Sean Leonard' 
  AND p.prenom = 'Robert'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : David Shore
INSERT INTO personne (nom, prenom) 
SELECT 'Shore', 'David'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Shore' AND prenom = 'David'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Shore' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'House' 
  AND p.nom = 'Shore' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : How I Met Your Mother
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'How I Met Your Mother',
    '19 Sep 2005',
    'A father recounts to his children the journey he and his four best friends took leading up to him meeting their mother.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'How I Met Your Mother' AND g.libelle = 'Comedy';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'How I Met Your Mother' AND g.libelle = 'Drama';


-- Insertion du genre : Romance
INSERT INTO genre (libelle) 
SELECT 'Romance'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Romance');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'How I Met Your Mother' AND g.libelle = 'Romance';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 10 Primetime Emmys. 29 wins & 102 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 10 Primetime Emmys. 29 wins & 102 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'How I Met Your Mother' AND p.libelle = 'Won 10 Primetime Emmys. 29 wins & 102 nominations total';


-- Insertion de la personne : Josh Radnor
INSERT INTO personne (nom, prenom) 
SELECT 'Radnor', 'Josh'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Radnor' AND prenom = 'Josh'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Radnor' 
  AND p.prenom = 'Josh'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'How I Met Your Mother' 
  AND p.nom = 'Radnor' 
  AND p.prenom = 'Josh'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jason Segel
INSERT INTO personne (nom, prenom) 
SELECT 'Segel', 'Jason'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Segel' AND prenom = 'Jason'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Segel' 
  AND p.prenom = 'Jason'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'How I Met Your Mother' 
  AND p.nom = 'Segel' 
  AND p.prenom = 'Jason'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Cobie Smulders
INSERT INTO personne (nom, prenom) 
SELECT 'Smulders', 'Cobie'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Smulders' AND prenom = 'Cobie'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Smulders' 
  AND p.prenom = 'Cobie'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'How I Met Your Mother' 
  AND p.nom = 'Smulders' 
  AND p.prenom = 'Cobie'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Carter Bays
INSERT INTO personne (nom, prenom) 
SELECT 'Bays', 'Carter'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Bays' AND prenom = 'Carter'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Bays' 
  AND p.prenom = 'Carter'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'How I Met Your Mother' 
  AND p.nom = 'Bays' 
  AND p.prenom = 'Carter'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Craig Thomas
INSERT INTO personne (nom, prenom) 
SELECT 'Thomas', 'Craig'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Thomas' AND prenom = 'Craig'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Thomas' 
  AND p.prenom = 'Craig'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'How I Met Your Mother' 
  AND p.nom = 'Thomas' 
  AND p.prenom = 'Craig'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : In Treatment
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'In Treatment',
    '28 Jan 2008',
    'A psychotherapist questions his abilities and gets help by reuniting with his old therapist, whom he has not seen for ten years.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'In Treatment' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 2 Primetime Emmys. 9 wins & 54 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 2 Primetime Emmys. 9 wins & 54 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'In Treatment' AND p.libelle = 'Won 2 Primetime Emmys. 9 wins & 54 nominations total';


-- Insertion de la personne : Gabriel Byrne
INSERT INTO personne (nom, prenom) 
SELECT 'Byrne', 'Gabriel'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Byrne' AND prenom = 'Gabriel'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Byrne' 
  AND p.prenom = 'Gabriel'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'In Treatment' 
  AND p.nom = 'Byrne' 
  AND p.prenom = 'Gabriel'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Uzo Aduba
INSERT INTO personne (nom, prenom) 
SELECT 'Aduba', 'Uzo'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Aduba' AND prenom = 'Uzo'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Aduba' 
  AND p.prenom = 'Uzo'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'In Treatment' 
  AND p.nom = 'Aduba' 
  AND p.prenom = 'Uzo'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Dianne Wiest
INSERT INTO personne (nom, prenom) 
SELECT 'Wiest', 'Dianne'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Wiest' AND prenom = 'Dianne'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Wiest' 
  AND p.prenom = 'Dianne'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'In Treatment' 
  AND p.nom = 'Wiest' 
  AND p.prenom = 'Dianne'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Rodrigo García
INSERT INTO personne (nom, prenom) 
SELECT 'García', 'Rodrigo'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'García' AND prenom = 'Rodrigo'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'García' 
  AND p.prenom = 'Rodrigo'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'In Treatment' 
  AND p.nom = 'García' 
  AND p.prenom = 'Rodrigo'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Hagai Levi
INSERT INTO personne (nom, prenom) 
SELECT 'Levi', 'Hagai'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Levi' AND prenom = 'Hagai'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Levi' 
  AND p.prenom = 'Hagai'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'In Treatment' 
  AND p.nom = 'Levi' 
  AND p.prenom = 'Hagai'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Nir Bergman
INSERT INTO personne (nom, prenom) 
SELECT 'Bergman', 'Nir'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Bergman' AND prenom = 'Nir'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Bergman' 
  AND p.prenom = 'Nir'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'In Treatment' 
  AND p.nom = 'Bergman' 
  AND p.prenom = 'Nir'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Invasion
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Invasion',
    '22 Oct 2021',
    'Earth is visited by an alien species that threatens humanity''s existence. Events unfold in real time through the eyes of five ordinary people across the globe as they struggle to make sense of the chaos unraveling around them.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Invasion' AND g.libelle = 'Drama';


-- Insertion du genre : Fantasy
INSERT INTO genre (libelle) 
SELECT 'Fantasy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Fantasy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Invasion' AND g.libelle = 'Fantasy';


-- Insertion du genre : Sci-Fi
INSERT INTO genre (libelle) 
SELECT 'Sci-Fi'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Sci-Fi');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Invasion' AND g.libelle = 'Sci-Fi';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '3 wins & 2 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '3 wins & 2 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Invasion' AND p.libelle = '3 wins & 2 nominations total';


-- Insertion de la personne : Golshifteh Farahani
INSERT INTO personne (nom, prenom) 
SELECT 'Farahani', 'Golshifteh'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Farahani' AND prenom = 'Golshifteh'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Farahani' 
  AND p.prenom = 'Golshifteh'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Invasion' 
  AND p.nom = 'Farahani' 
  AND p.prenom = 'Golshifteh'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Shioli Kutsuna
INSERT INTO personne (nom, prenom) 
SELECT 'Kutsuna', 'Shioli'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Kutsuna' AND prenom = 'Shioli'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Kutsuna' 
  AND p.prenom = 'Shioli'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Invasion' 
  AND p.nom = 'Kutsuna' 
  AND p.prenom = 'Shioli'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Shamier Anderson
INSERT INTO personne (nom, prenom) 
SELECT 'Anderson', 'Shamier'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Anderson' AND prenom = 'Shamier'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Anderson' 
  AND p.prenom = 'Shamier'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Invasion' 
  AND p.nom = 'Anderson' 
  AND p.prenom = 'Shamier'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Simon Kinberg
INSERT INTO personne (nom, prenom) 
SELECT 'Kinberg', 'Simon'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Kinberg' AND prenom = 'Simon'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Kinberg' 
  AND p.prenom = 'Simon'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Invasion' 
  AND p.nom = 'Kinberg' 
  AND p.prenom = 'Simon'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : David Weil
INSERT INTO personne (nom, prenom) 
SELECT 'Weil', 'David'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Weil' AND prenom = 'David'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Weil' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Invasion' 
  AND p.nom = 'Weil' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Jake
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Jake',
    '22 Sep 2017',
    'Jake''s life of illegal raves collides with his own life after he experiences disturbing flashbacks and premonitions, as side effects of using his crews new powerful street drug.'
);


-- Insertion du genre : Horror
INSERT INTO genre (libelle) 
SELECT 'Horror'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Horror');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Jake' AND g.libelle = 'Horror';


-- Insertion de la personne : Paul T.T. Easter
INSERT INTO personne (nom, prenom) 
SELECT 'T.T. Easter', 'Paul'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'T.T. Easter' AND prenom = 'Paul'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'T.T. Easter' 
  AND p.prenom = 'Paul'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Jake' 
  AND p.nom = 'T.T. Easter' 
  AND p.prenom = 'Paul'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Zoe Harder
INSERT INTO personne (nom, prenom) 
SELECT 'Harder', 'Zoe'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Harder' AND prenom = 'Zoe'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Harder' 
  AND p.prenom = 'Zoe'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Jake' 
  AND p.nom = 'Harder' 
  AND p.prenom = 'Zoe'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Sonia Moydra
INSERT INTO personne (nom, prenom) 
SELECT 'Moydra', 'Sonia'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Moydra' AND prenom = 'Sonia'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Moydra' 
  AND p.prenom = 'Sonia'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Jake' 
  AND p.nom = 'Moydra' 
  AND p.prenom = 'Sonia'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Paul T.T. Easter
INSERT INTO personne (nom, prenom) 
SELECT 'T.T. Easter', 'Paul'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'T.T. Easter' AND prenom = 'Paul'
);


-- Insertion du rôle : Realisateur
INSERT INTO role (libelle) 
SELECT 'Realisateur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Realisateur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Realisateur' 
  AND p.nom = 'T.T. Easter' 
  AND p.prenom = 'Paul'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Jake' 
  AND p.nom = 'T.T. Easter' 
  AND p.prenom = 'Paul'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Paul T.T. Easter
INSERT INTO personne (nom, prenom) 
SELECT 'T.T. Easter', 'Paul'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'T.T. Easter' AND prenom = 'Paul'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'T.T. Easter' 
  AND p.prenom = 'Paul'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Jake' 
  AND p.nom = 'T.T. Easter' 
  AND p.prenom = 'Paul'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Jekyll
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Jekyll',
    '04 Aug 2007',
    'Brilliant scientist Tom Jackman shares his body with a wicked alter ego while an ancient organization monitors their conflict. Tom uses technology to watch over his sinister half and keep his family safe, as a centuries-old plan u...'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Jekyll' AND g.libelle = 'Crime';


-- Insertion du genre : Horror
INSERT INTO genre (libelle) 
SELECT 'Horror'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Horror');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Jekyll' AND g.libelle = 'Horror';


-- Insertion du genre : Sci-Fi
INSERT INTO genre (libelle) 
SELECT 'Sci-Fi'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Sci-Fi');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Jekyll' AND g.libelle = 'Sci-Fi';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '5 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '5 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Jekyll' AND p.libelle = '5 nominations total';


-- Insertion de la personne : James Nesbitt
INSERT INTO personne (nom, prenom) 
SELECT 'Nesbitt', 'James'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Nesbitt' AND prenom = 'James'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Nesbitt' 
  AND p.prenom = 'James'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Jekyll' 
  AND p.nom = 'Nesbitt' 
  AND p.prenom = 'James'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Gina Bellman
INSERT INTO personne (nom, prenom) 
SELECT 'Bellman', 'Gina'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Bellman' AND prenom = 'Gina'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Bellman' 
  AND p.prenom = 'Gina'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Jekyll' 
  AND p.nom = 'Bellman' 
  AND p.prenom = 'Gina'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Denis Lawson
INSERT INTO personne (nom, prenom) 
SELECT 'Lawson', 'Denis'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Lawson' AND prenom = 'Denis'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Lawson' 
  AND p.prenom = 'Denis'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Jekyll' 
  AND p.nom = 'Lawson' 
  AND p.prenom = 'Denis'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Steven Moffat
INSERT INTO personne (nom, prenom) 
SELECT 'Moffat', 'Steven'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Moffat' AND prenom = 'Steven'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Moffat' 
  AND p.prenom = 'Steven'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Jekyll' 
  AND p.nom = 'Moffat' 
  AND p.prenom = 'Steven'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Jericho
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Jericho',
    '20 Sep 2006',
    'A small town in Kansas is literally left in the dark after seeing a mushroom cloud over nearby Denver, Colorado. The townspeople struggle to find answers about the blast and solutions on how to survive.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Jericho' AND g.libelle = 'Action';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Jericho' AND g.libelle = 'Drama';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Jericho' AND g.libelle = 'Mystery';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 1 Primetime Emmy. 1 win & 7 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 1 Primetime Emmy. 1 win & 7 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Jericho' AND p.libelle = 'Nominated for 1 Primetime Emmy. 1 win & 7 nominations total';


-- Insertion de la personne : Skeet Ulrich
INSERT INTO personne (nom, prenom) 
SELECT 'Ulrich', 'Skeet'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Ulrich' AND prenom = 'Skeet'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Ulrich' 
  AND p.prenom = 'Skeet'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Jericho' 
  AND p.nom = 'Ulrich' 
  AND p.prenom = 'Skeet'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Lennie James
INSERT INTO personne (nom, prenom) 
SELECT 'James', 'Lennie'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'James' AND prenom = 'Lennie'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'James' 
  AND p.prenom = 'Lennie'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Jericho' 
  AND p.nom = 'James' 
  AND p.prenom = 'Lennie'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Ashley Scott
INSERT INTO personne (nom, prenom) 
SELECT 'Scott', 'Ashley'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Scott' AND prenom = 'Ashley'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Scott' 
  AND p.prenom = 'Ashley'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Jericho' 
  AND p.nom = 'Scott' 
  AND p.prenom = 'Ashley'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Stephen Chbosky
INSERT INTO personne (nom, prenom) 
SELECT 'Chbosky', 'Stephen'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Chbosky' AND prenom = 'Stephen'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Chbosky' 
  AND p.prenom = 'Stephen'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Jericho' 
  AND p.nom = 'Chbosky' 
  AND p.prenom = 'Stephen'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Josh Schaer
INSERT INTO personne (nom, prenom) 
SELECT 'Schaer', 'Josh'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Schaer' AND prenom = 'Josh'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Schaer' 
  AND p.prenom = 'Josh'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Jericho' 
  AND p.nom = 'Schaer' 
  AND p.prenom = 'Josh'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jonathan E. Steinberg
INSERT INTO personne (nom, prenom) 
SELECT 'E. Steinberg', 'Jonathan'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'E. Steinberg' AND prenom = 'Jonathan'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'E. Steinberg' 
  AND p.prenom = 'Jonathan'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Jericho' 
  AND p.nom = 'E. Steinberg' 
  AND p.prenom = 'Jonathan'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : John from Cincinnati
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'John from Cincinnati',
    '10 Jun 2007',
    'In Imperial Beach, California, the dysfunctional Yost family intersects with two new arrivals to the community: a dim-but-wealthy surfing enthusiast, and a man spurned by the Yosts years ago.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'John from Cincinnati' AND g.libelle = 'Drama';


-- Insertion du genre : Fantasy
INSERT INTO genre (libelle) 
SELECT 'Fantasy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Fantasy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'John from Cincinnati' AND g.libelle = 'Fantasy';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'John from Cincinnati' AND g.libelle = 'Mystery';


-- Insertion de la personne : Rebecca De Mornay
INSERT INTO personne (nom, prenom) 
SELECT 'De Mornay', 'Rebecca'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'De Mornay' AND prenom = 'Rebecca'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'De Mornay' 
  AND p.prenom = 'Rebecca'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'John from Cincinnati' 
  AND p.nom = 'De Mornay' 
  AND p.prenom = 'Rebecca'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Greyson Fletcher
INSERT INTO personne (nom, prenom) 
SELECT 'Fletcher', 'Greyson'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Fletcher' AND prenom = 'Greyson'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Fletcher' 
  AND p.prenom = 'Greyson'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'John from Cincinnati' 
  AND p.nom = 'Fletcher' 
  AND p.prenom = 'Greyson'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Willie Garson
INSERT INTO personne (nom, prenom) 
SELECT 'Garson', 'Willie'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Garson' AND prenom = 'Willie'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Garson' 
  AND p.prenom = 'Willie'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'John from Cincinnati' 
  AND p.nom = 'Garson' 
  AND p.prenom = 'Willie'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : David Milch
INSERT INTO personne (nom, prenom) 
SELECT 'Milch', 'David'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Milch' AND prenom = 'David'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Milch' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'John from Cincinnati' 
  AND p.nom = 'Milch' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Kem Nunn
INSERT INTO personne (nom, prenom) 
SELECT 'Nunn', 'Kem'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Nunn' AND prenom = 'Kem'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Nunn' 
  AND p.prenom = 'Kem'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'John from Cincinnati' 
  AND p.nom = 'Nunn' 
  AND p.prenom = 'Kem'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Knight Rider
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Knight Rider',
    '26 Sep 1982',
    'Follows the adventures of lone crime-fighter, Michael Knight, who battles the forces of evil with the help of his virtually indestructible and artificially intelligent supercar called KITT.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Knight Rider' AND g.libelle = 'Action';


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Knight Rider' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Knight Rider' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 1 Primetime Emmy. 5 wins & 8 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 1 Primetime Emmy. 5 wins & 8 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Knight Rider' AND p.libelle = 'Nominated for 1 Primetime Emmy. 5 wins & 8 nominations total';


-- Insertion de la personne : David Hasselhoff
INSERT INTO personne (nom, prenom) 
SELECT 'Hasselhoff', 'David'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hasselhoff' AND prenom = 'David'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Hasselhoff' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Knight Rider' 
  AND p.nom = 'Hasselhoff' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Edward Mulhare
INSERT INTO personne (nom, prenom) 
SELECT 'Mulhare', 'Edward'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Mulhare' AND prenom = 'Edward'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Mulhare' 
  AND p.prenom = 'Edward'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Knight Rider' 
  AND p.nom = 'Mulhare' 
  AND p.prenom = 'Edward'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Richard Basehart
INSERT INTO personne (nom, prenom) 
SELECT 'Basehart', 'Richard'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Basehart' AND prenom = 'Richard'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Basehart' 
  AND p.prenom = 'Richard'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Knight Rider' 
  AND p.nom = 'Basehart' 
  AND p.prenom = 'Richard'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Glen A. Larson
INSERT INTO personne (nom, prenom) 
SELECT 'A. Larson', 'Glen'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'A. Larson' AND prenom = 'Glen'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'A. Larson' 
  AND p.prenom = 'Glen'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Knight Rider' 
  AND p.nom = 'A. Larson' 
  AND p.prenom = 'Glen'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Kyle XY
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Kyle XY',
    '26 Jun 2006',
    'A family takes in a formerly institutionalized teen savant who is missing standard human behaviors such as anger, joy, and love.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Kyle XY' AND g.libelle = 'Drama';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Kyle XY' AND g.libelle = 'Mystery';


-- Insertion du genre : Romance
INSERT INTO genre (libelle) 
SELECT 'Romance'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Romance');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Kyle XY' AND g.libelle = 'Romance';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '2 wins & 11 nominations'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '2 wins & 11 nominations');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Kyle XY' AND p.libelle = '2 wins & 11 nominations';


-- Insertion de la personne : Matt Dallas
INSERT INTO personne (nom, prenom) 
SELECT 'Dallas', 'Matt'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Dallas' AND prenom = 'Matt'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Dallas' 
  AND p.prenom = 'Matt'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Kyle XY' 
  AND p.nom = 'Dallas' 
  AND p.prenom = 'Matt'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Marguerite MacIntyre
INSERT INTO personne (nom, prenom) 
SELECT 'MacIntyre', 'Marguerite'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'MacIntyre' AND prenom = 'Marguerite'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'MacIntyre' 
  AND p.prenom = 'Marguerite'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Kyle XY' 
  AND p.nom = 'MacIntyre' 
  AND p.prenom = 'Marguerite'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Bruce Thomas
INSERT INTO personne (nom, prenom) 
SELECT 'Thomas', 'Bruce'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Thomas' AND prenom = 'Bruce'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Thomas' 
  AND p.prenom = 'Bruce'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Kyle XY' 
  AND p.nom = 'Thomas' 
  AND p.prenom = 'Bruce'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Eric Bress
INSERT INTO personne (nom, prenom) 
SELECT 'Bress', 'Eric'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Bress' AND prenom = 'Eric'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Bress' 
  AND p.prenom = 'Eric'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Kyle XY' 
  AND p.nom = 'Bress' 
  AND p.prenom = 'Eric'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : J. Mackye Gruber
INSERT INTO personne (nom, prenom) 
SELECT 'Mackye Gruber', 'J.'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Mackye Gruber' AND prenom = 'J.'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Mackye Gruber' 
  AND p.prenom = 'J.'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Kyle XY' 
  AND p.nom = 'Mackye Gruber' 
  AND p.prenom = 'J.'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Legend of the Seeker
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Legend of the Seeker',
    '01 Nov 2008',
    'After the mysterious murder of his father, a son''s search for answers begins a momentous fight against tyranny.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Legend of the Seeker' AND g.libelle = 'Action';


-- Insertion du genre : Adventure
INSERT INTO genre (libelle) 
SELECT 'Adventure'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Adventure');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Legend of the Seeker' AND g.libelle = 'Adventure';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Legend of the Seeker' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 1 Primetime Emmy. 2 wins & 2 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 1 Primetime Emmy. 2 wins & 2 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Legend of the Seeker' AND p.libelle = 'Won 1 Primetime Emmy. 2 wins & 2 nominations total';


-- Insertion de la personne : Craig Horner
INSERT INTO personne (nom, prenom) 
SELECT 'Horner', 'Craig'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Horner' AND prenom = 'Craig'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Horner' 
  AND p.prenom = 'Craig'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Legend of the Seeker' 
  AND p.nom = 'Horner' 
  AND p.prenom = 'Craig'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Bridget Regan
INSERT INTO personne (nom, prenom) 
SELECT 'Regan', 'Bridget'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Regan' AND prenom = 'Bridget'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Regan' 
  AND p.prenom = 'Bridget'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Legend of the Seeker' 
  AND p.nom = 'Regan' 
  AND p.prenom = 'Bridget'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Bruce Spence
INSERT INTO personne (nom, prenom) 
SELECT 'Spence', 'Bruce'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Spence' AND prenom = 'Bruce'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Spence' 
  AND p.prenom = 'Bruce'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Legend of the Seeker' 
  AND p.nom = 'Spence' 
  AND p.prenom = 'Bruce'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Stephen Tolkin
INSERT INTO personne (nom, prenom) 
SELECT 'Tolkin', 'Stephen'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Tolkin' AND prenom = 'Stephen'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Tolkin' 
  AND p.prenom = 'Stephen'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Legend of the Seeker' 
  AND p.nom = 'Tolkin' 
  AND p.prenom = 'Stephen'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Kenneth Biller
INSERT INTO personne (nom, prenom) 
SELECT 'Biller', 'Kenneth'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Biller' AND prenom = 'Kenneth'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Biller' 
  AND p.prenom = 'Kenneth'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Legend of the Seeker' 
  AND p.nom = 'Biller' 
  AND p.prenom = 'Kenneth'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Leverage
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Leverage',
    '07 Dec 2008',
    'Nathan Ford and his five-member team of thieves and hackers come together like modern-day Robin Hoods in an attempt to steal from rich and powerful individuals who take advantage of others.'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Leverage' AND g.libelle = 'Crime';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Leverage' AND g.libelle = 'Mystery';


-- Insertion du genre : Thriller
INSERT INTO genre (libelle) 
SELECT 'Thriller'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Thriller');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Leverage' AND g.libelle = 'Thriller';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '3 wins & 20 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '3 wins & 20 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Leverage' AND p.libelle = '3 wins & 20 nominations total';


-- Insertion de la personne : Timothy Hutton
INSERT INTO personne (nom, prenom) 
SELECT 'Hutton', 'Timothy'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hutton' AND prenom = 'Timothy'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Hutton' 
  AND p.prenom = 'Timothy'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Leverage' 
  AND p.nom = 'Hutton' 
  AND p.prenom = 'Timothy'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Gina Bellman
INSERT INTO personne (nom, prenom) 
SELECT 'Bellman', 'Gina'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Bellman' AND prenom = 'Gina'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Bellman' 
  AND p.prenom = 'Gina'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Leverage' 
  AND p.nom = 'Bellman' 
  AND p.prenom = 'Gina'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Christian Kane
INSERT INTO personne (nom, prenom) 
SELECT 'Kane', 'Christian'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Kane' AND prenom = 'Christian'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Kane' 
  AND p.prenom = 'Christian'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Leverage' 
  AND p.nom = 'Kane' 
  AND p.prenom = 'Christian'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Chris Downey
INSERT INTO personne (nom, prenom) 
SELECT 'Downey', 'Chris'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Downey' AND prenom = 'Chris'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Downey' 
  AND p.prenom = 'Chris'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Leverage' 
  AND p.nom = 'Downey' 
  AND p.prenom = 'Chris'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : John Rogers
INSERT INTO personne (nom, prenom) 
SELECT 'Rogers', 'John'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Rogers' AND prenom = 'John'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Rogers' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Leverage' 
  AND p.nom = 'Rogers' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Lie to Me
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Lie to Me',
    '21 Jan 2009',
    'The world''s leading deception researcher, Dr. Cal Lightman, studies facial expression, body language and tone of voice to determine when a person is lying and why, which helps law enforcement and government agencies uncover the tr...'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Lie to Me' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Lie to Me' AND g.libelle = 'Drama';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Lie to Me' AND g.libelle = 'Mystery';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 1 Primetime Emmy. 4 wins & 8 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 1 Primetime Emmy. 4 wins & 8 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Lie to Me' AND p.libelle = 'Nominated for 1 Primetime Emmy. 4 wins & 8 nominations total';


-- Insertion de la personne : Tim Roth
INSERT INTO personne (nom, prenom) 
SELECT 'Roth', 'Tim'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Roth' AND prenom = 'Tim'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Roth' 
  AND p.prenom = 'Tim'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Lie to Me' 
  AND p.nom = 'Roth' 
  AND p.prenom = 'Tim'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Kelli Williams
INSERT INTO personne (nom, prenom) 
SELECT 'Williams', 'Kelli'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Williams' AND prenom = 'Kelli'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Williams' 
  AND p.prenom = 'Kelli'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Lie to Me' 
  AND p.nom = 'Williams' 
  AND p.prenom = 'Kelli'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Brendan Hines
INSERT INTO personne (nom, prenom) 
SELECT 'Hines', 'Brendan'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hines' AND prenom = 'Brendan'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Hines' 
  AND p.prenom = 'Brendan'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Lie to Me' 
  AND p.nom = 'Hines' 
  AND p.prenom = 'Brendan'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Samuel Baum
INSERT INTO personne (nom, prenom) 
SELECT 'Baum', 'Samuel'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Baum' AND prenom = 'Samuel'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Baum' 
  AND p.prenom = 'Samuel'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Lie to Me' 
  AND p.nom = 'Baum' 
  AND p.prenom = 'Samuel'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Life
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Life',
    '24 Mar 2017',
    'A team of scientists aboard the ISS discover a rapidly evolving Martian predator that needs to be kept away from Earth at all costs.'
);


-- Insertion du genre : Horror
INSERT INTO genre (libelle) 
SELECT 'Horror'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Horror');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Life' AND g.libelle = 'Horror';


-- Insertion du genre : Sci-Fi
INSERT INTO genre (libelle) 
SELECT 'Sci-Fi'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Sci-Fi');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Life' AND g.libelle = 'Sci-Fi';


-- Insertion du genre : Thriller
INSERT INTO genre (libelle) 
SELECT 'Thriller'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Thriller');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Life' AND g.libelle = 'Thriller';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '7 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '7 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Life' AND p.libelle = '7 nominations total';


-- Insertion de la personne : Jake Gyllenhaal
INSERT INTO personne (nom, prenom) 
SELECT 'Gyllenhaal', 'Jake'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Gyllenhaal' AND prenom = 'Jake'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Gyllenhaal' 
  AND p.prenom = 'Jake'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Life' 
  AND p.nom = 'Gyllenhaal' 
  AND p.prenom = 'Jake'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Rebecca Ferguson
INSERT INTO personne (nom, prenom) 
SELECT 'Ferguson', 'Rebecca'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Ferguson' AND prenom = 'Rebecca'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Ferguson' 
  AND p.prenom = 'Rebecca'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Life' 
  AND p.nom = 'Ferguson' 
  AND p.prenom = 'Rebecca'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Ryan Reynolds
INSERT INTO personne (nom, prenom) 
SELECT 'Reynolds', 'Ryan'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Reynolds' AND prenom = 'Ryan'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Reynolds' 
  AND p.prenom = 'Ryan'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Life' 
  AND p.nom = 'Reynolds' 
  AND p.prenom = 'Ryan'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Daniel Espinosa
INSERT INTO personne (nom, prenom) 
SELECT 'Espinosa', 'Daniel'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Espinosa' AND prenom = 'Daniel'
);


-- Insertion du rôle : Realisateur
INSERT INTO role (libelle) 
SELECT 'Realisateur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Realisateur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Realisateur' 
  AND p.nom = 'Espinosa' 
  AND p.prenom = 'Daniel'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Life' 
  AND p.nom = 'Espinosa' 
  AND p.prenom = 'Daniel'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Rhett Reese
INSERT INTO personne (nom, prenom) 
SELECT 'Reese', 'Rhett'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Reese' AND prenom = 'Rhett'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Reese' 
  AND p.prenom = 'Rhett'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Life' 
  AND p.nom = 'Reese' 
  AND p.prenom = 'Rhett'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Paul Wernick
INSERT INTO personne (nom, prenom) 
SELECT 'Wernick', 'Paul'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Wernick' AND prenom = 'Paul'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Wernick' 
  AND p.prenom = 'Paul'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Life' 
  AND p.nom = 'Wernick' 
  AND p.prenom = 'Paul'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Lost
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Lost',
    '22 Sep 2004',
    'The survivors of a plane crash are forced to work together in order to survive on a seemingly deserted tropical island.'
);


-- Insertion du genre : Adventure
INSERT INTO genre (libelle) 
SELECT 'Adventure'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Adventure');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Lost' AND g.libelle = 'Adventure';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Lost' AND g.libelle = 'Drama';


-- Insertion du genre : Fantasy
INSERT INTO genre (libelle) 
SELECT 'Fantasy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Fantasy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Lost' AND g.libelle = 'Fantasy';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 10 Primetime Emmys. 118 wins & 418 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 10 Primetime Emmys. 118 wins & 418 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Lost' AND p.libelle = 'Won 10 Primetime Emmys. 118 wins & 418 nominations total';


-- Insertion de la personne : Jorge Garcia
INSERT INTO personne (nom, prenom) 
SELECT 'Garcia', 'Jorge'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Garcia' AND prenom = 'Jorge'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Garcia' 
  AND p.prenom = 'Jorge'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Lost' 
  AND p.nom = 'Garcia' 
  AND p.prenom = 'Jorge'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Josh Holloway
INSERT INTO personne (nom, prenom) 
SELECT 'Holloway', 'Josh'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Holloway' AND prenom = 'Josh'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Holloway' 
  AND p.prenom = 'Josh'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Lost' 
  AND p.nom = 'Holloway' 
  AND p.prenom = 'Josh'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Yunjin Kim
INSERT INTO personne (nom, prenom) 
SELECT 'Kim', 'Yunjin'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Kim' AND prenom = 'Yunjin'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Kim' 
  AND p.prenom = 'Yunjin'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Lost' 
  AND p.nom = 'Kim' 
  AND p.prenom = 'Yunjin'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : J.J. Abrams
INSERT INTO personne (nom, prenom) 
SELECT 'Abrams', 'J.J.'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Abrams' AND prenom = 'J.J.'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Abrams' 
  AND p.prenom = 'J.J.'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Lost' 
  AND p.nom = 'Abrams' 
  AND p.prenom = 'J.J.'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jeffrey Lieber
INSERT INTO personne (nom, prenom) 
SELECT 'Lieber', 'Jeffrey'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Lieber' AND prenom = 'Jeffrey'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Lieber' 
  AND p.prenom = 'Jeffrey'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Lost' 
  AND p.nom = 'Lieber' 
  AND p.prenom = 'Jeffrey'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Damon Lindelof
INSERT INTO personne (nom, prenom) 
SELECT 'Lindelof', 'Damon'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Lindelof' AND prenom = 'Damon'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Lindelof' 
  AND p.prenom = 'Damon'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Lost' 
  AND p.nom = 'Lindelof' 
  AND p.prenom = 'Damon'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Mad Men
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Mad Men',
    '19 Jul 2007',
    'A drama about one of New York''s most prestigious ad agencies at the beginning of the 1960s, focusing on one of the firm''s most mysterious but extremely talented ad executives, Donald Draper.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Mad Men' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 16 Primetime Emmys. 166 wins & 450 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 16 Primetime Emmys. 166 wins & 450 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Mad Men' AND p.libelle = 'Won 16 Primetime Emmys. 166 wins & 450 nominations total';


-- Insertion de la personne : Jon Hamm
INSERT INTO personne (nom, prenom) 
SELECT 'Hamm', 'Jon'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hamm' AND prenom = 'Jon'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Hamm' 
  AND p.prenom = 'Jon'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Mad Men' 
  AND p.nom = 'Hamm' 
  AND p.prenom = 'Jon'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Elisabeth Moss
INSERT INTO personne (nom, prenom) 
SELECT 'Moss', 'Elisabeth'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Moss' AND prenom = 'Elisabeth'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Moss' 
  AND p.prenom = 'Elisabeth'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Mad Men' 
  AND p.nom = 'Moss' 
  AND p.prenom = 'Elisabeth'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Vincent Kartheiser
INSERT INTO personne (nom, prenom) 
SELECT 'Kartheiser', 'Vincent'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Kartheiser' AND prenom = 'Vincent'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Kartheiser' 
  AND p.prenom = 'Vincent'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Mad Men' 
  AND p.nom = 'Kartheiser' 
  AND p.prenom = 'Vincent'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Matthew Weiner
INSERT INTO personne (nom, prenom) 
SELECT 'Weiner', 'Matthew'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Weiner' AND prenom = 'Matthew'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Weiner' 
  AND p.prenom = 'Matthew'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Mad Men' 
  AND p.nom = 'Weiner' 
  AND p.prenom = 'Matthew'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Masters of Science Fiction
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Masters of Science Fiction',
    '04 Aug 2007',
    '"Masters of Science Fiction" was a 2007 hosted science fiction anthology series, hosted by Stephen Hawking.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Masters of Science Fiction' AND g.libelle = 'Drama';


-- Insertion du genre : Fantasy
INSERT INTO genre (libelle) 
SELECT 'Fantasy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Fantasy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Masters of Science Fiction' AND g.libelle = 'Fantasy';


-- Insertion du genre : Horror
INSERT INTO genre (libelle) 
SELECT 'Horror'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Horror');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Masters of Science Fiction' AND g.libelle = 'Horror';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 1 Primetime Emmy. 2 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 1 Primetime Emmy. 2 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Masters of Science Fiction' AND p.libelle = 'Nominated for 1 Primetime Emmy. 2 nominations total';


-- Insertion de la personne : Stephen Hawking
INSERT INTO personne (nom, prenom) 
SELECT 'Hawking', 'Stephen'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hawking' AND prenom = 'Stephen'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Hawking' 
  AND p.prenom = 'Stephen'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Masters of Science Fiction' 
  AND p.nom = 'Hawking' 
  AND p.prenom = 'Stephen'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jason Diablo
INSERT INTO personne (nom, prenom) 
SELECT 'Diablo', 'Jason'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Diablo' AND prenom = 'Jason'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Diablo' 
  AND p.prenom = 'Jason'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Masters of Science Fiction' 
  AND p.nom = 'Diablo' 
  AND p.prenom = 'Jason'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Paul Herbert
INSERT INTO personne (nom, prenom) 
SELECT 'Herbert', 'Paul'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Herbert' AND prenom = 'Paul'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Herbert' 
  AND p.prenom = 'Paul'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Masters of Science Fiction' 
  AND p.nom = 'Herbert' 
  AND p.prenom = 'Paul'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Medium
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Medium',
    '03 Jan 2005',
    'Suburban mom Allison DuBois attempts to balance family life with solving mysteries using her special gift. The dead send her visions of their deaths or other crimes while she sleeps.'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Medium' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Medium' AND g.libelle = 'Drama';


-- Insertion du genre : Fantasy
INSERT INTO genre (libelle) 
SELECT 'Fantasy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Fantasy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Medium' AND g.libelle = 'Fantasy';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 1 Primetime Emmy. 10 wins & 33 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 1 Primetime Emmy. 10 wins & 33 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Medium' AND p.libelle = 'Won 1 Primetime Emmy. 10 wins & 33 nominations total';


-- Insertion de la personne : Patricia Arquette
INSERT INTO personne (nom, prenom) 
SELECT 'Arquette', 'Patricia'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Arquette' AND prenom = 'Patricia'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Arquette' 
  AND p.prenom = 'Patricia'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Medium' 
  AND p.nom = 'Arquette' 
  AND p.prenom = 'Patricia'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Miguel Sandoval
INSERT INTO personne (nom, prenom) 
SELECT 'Sandoval', 'Miguel'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Sandoval' AND prenom = 'Miguel'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Sandoval' 
  AND p.prenom = 'Miguel'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Medium' 
  AND p.nom = 'Sandoval' 
  AND p.prenom = 'Miguel'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jake Weber
INSERT INTO personne (nom, prenom) 
SELECT 'Weber', 'Jake'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Weber' AND prenom = 'Jake'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Weber' 
  AND p.prenom = 'Jake'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Medium' 
  AND p.nom = 'Weber' 
  AND p.prenom = 'Jake'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Glenn Gordon Caron
INSERT INTO personne (nom, prenom) 
SELECT 'Gordon Caron', 'Glenn'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Gordon Caron' AND prenom = 'Glenn'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Gordon Caron' 
  AND p.prenom = 'Glenn'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Medium' 
  AND p.nom = 'Gordon Caron' 
  AND p.prenom = 'Glenn'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Melrose Place
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Melrose Place',
    '08 Jul 1992',
    'Classic serial drama around a group of friends living in Melrose Place, California.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Melrose Place' AND g.libelle = 'Drama';


-- Insertion du genre : Romance
INSERT INTO genre (libelle) 
SELECT 'Romance'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Romance');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Melrose Place' AND g.libelle = 'Romance';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '6 wins & 8 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '6 wins & 8 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Melrose Place' AND p.libelle = '6 wins & 8 nominations total';


-- Insertion de la personne : Heather Locklear
INSERT INTO personne (nom, prenom) 
SELECT 'Locklear', 'Heather'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Locklear' AND prenom = 'Heather'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Locklear' 
  AND p.prenom = 'Heather'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Melrose Place' 
  AND p.nom = 'Locklear' 
  AND p.prenom = 'Heather'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Andrew Shue
INSERT INTO personne (nom, prenom) 
SELECT 'Shue', 'Andrew'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Shue' AND prenom = 'Andrew'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Shue' 
  AND p.prenom = 'Andrew'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Melrose Place' 
  AND p.nom = 'Shue' 
  AND p.prenom = 'Andrew'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Courtney Thorne-Smith
INSERT INTO personne (nom, prenom) 
SELECT 'Thorne-Smith', 'Courtney'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Thorne-Smith' AND prenom = 'Courtney'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Thorne-Smith' 
  AND p.prenom = 'Courtney'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Melrose Place' 
  AND p.nom = 'Thorne-Smith' 
  AND p.prenom = 'Courtney'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Darren Star
INSERT INTO personne (nom, prenom) 
SELECT 'Star', 'Darren'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Star' AND prenom = 'Darren'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Star' 
  AND p.prenom = 'Darren'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Melrose Place' 
  AND p.nom = 'Star' 
  AND p.prenom = 'Darren'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Mental
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Mental',
    '29 Mar 2013',
    'A charismatic, crazy hothead transforms a family''s life when she becomes the nanny of five girls whose mother has cracked from her husband''s political ambitions and his infidelity.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Mental' AND g.libelle = 'Comedy';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Mental' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '1 win & 16 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '1 win & 16 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Mental' AND p.libelle = '1 win & 16 nominations total';


-- Insertion de la personne : Toni Collette
INSERT INTO personne (nom, prenom) 
SELECT 'Collette', 'Toni'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Collette' AND prenom = 'Toni'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Collette' 
  AND p.prenom = 'Toni'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Mental' 
  AND p.nom = 'Collette' 
  AND p.prenom = 'Toni'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Anthony LaPaglia
INSERT INTO personne (nom, prenom) 
SELECT 'LaPaglia', 'Anthony'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'LaPaglia' AND prenom = 'Anthony'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'LaPaglia' 
  AND p.prenom = 'Anthony'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Mental' 
  AND p.nom = 'LaPaglia' 
  AND p.prenom = 'Anthony'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Liev Schreiber
INSERT INTO personne (nom, prenom) 
SELECT 'Schreiber', 'Liev'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Schreiber' AND prenom = 'Liev'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Schreiber' 
  AND p.prenom = 'Liev'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Mental' 
  AND p.nom = 'Schreiber' 
  AND p.prenom = 'Liev'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : P.J. Hogan
INSERT INTO personne (nom, prenom) 
SELECT 'Hogan', 'P.J.'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hogan' AND prenom = 'P.J.'
);


-- Insertion du rôle : Realisateur
INSERT INTO role (libelle) 
SELECT 'Realisateur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Realisateur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Realisateur' 
  AND p.nom = 'Hogan' 
  AND p.prenom = 'P.J.'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Mental' 
  AND p.nom = 'Hogan' 
  AND p.prenom = 'P.J.'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : P.J. Hogan
INSERT INTO personne (nom, prenom) 
SELECT 'Hogan', 'P.J.'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hogan' AND prenom = 'P.J.'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Hogan' 
  AND p.prenom = 'P.J.'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Mental' 
  AND p.nom = 'Hogan' 
  AND p.prenom = 'P.J.'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Merlin
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Merlin',
    '21 Jun 2009',
    'These are the brand new adventures of Merlin, the legendary sorcerer as a young man, when he was just a servant to young Prince Arthur on the royal court of Camelot, who has soon become his best friend, and turned Arthur into a gr...'
);


-- Insertion du genre : Adventure
INSERT INTO genre (libelle) 
SELECT 'Adventure'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Adventure');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Merlin' AND g.libelle = 'Adventure';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Merlin' AND g.libelle = 'Drama';


-- Insertion du genre : Fantasy
INSERT INTO genre (libelle) 
SELECT 'Fantasy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Fantasy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Merlin' AND g.libelle = 'Fantasy';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 1 BAFTA Award4 wins & 25 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 1 BAFTA Award4 wins & 25 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Merlin' AND p.libelle = 'Won 1 BAFTA Award4 wins & 25 nominations total';


-- Insertion de la personne : John Hurt
INSERT INTO personne (nom, prenom) 
SELECT 'Hurt', 'John'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hurt' AND prenom = 'John'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Hurt' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Merlin' 
  AND p.nom = 'Hurt' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Colin Morgan
INSERT INTO personne (nom, prenom) 
SELECT 'Morgan', 'Colin'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Morgan' AND prenom = 'Colin'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Morgan' 
  AND p.prenom = 'Colin'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Merlin' 
  AND p.nom = 'Morgan' 
  AND p.prenom = 'Colin'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Bradley James
INSERT INTO personne (nom, prenom) 
SELECT 'James', 'Bradley'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'James' AND prenom = 'Bradley'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'James' 
  AND p.prenom = 'Bradley'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Merlin' 
  AND p.nom = 'James' 
  AND p.prenom = 'Bradley'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Johnny Capps
INSERT INTO personne (nom, prenom) 
SELECT 'Capps', 'Johnny'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Capps' AND prenom = 'Johnny'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Capps' 
  AND p.prenom = 'Johnny'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Merlin' 
  AND p.nom = 'Capps' 
  AND p.prenom = 'Johnny'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Julian Jones
INSERT INTO personne (nom, prenom) 
SELECT 'Jones', 'Julian'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Jones' AND prenom = 'Julian'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Jones' 
  AND p.prenom = 'Julian'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Merlin' 
  AND p.nom = 'Jones' 
  AND p.prenom = 'Julian'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jake Michie
INSERT INTO personne (nom, prenom) 
SELECT 'Michie', 'Jake'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Michie' AND prenom = 'Jake'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Michie' 
  AND p.prenom = 'Jake'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Merlin' 
  AND p.nom = 'Michie' 
  AND p.prenom = 'Jake'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Moonlight
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Moonlight',
    '18 Nov 2016',
    'A young African-American man grapples with his identity and sexuality while experiencing the everyday struggles of childhood, adolescence, and burgeoning adulthood.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Moonlight' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 3 Oscars. 235 wins & 310 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 3 Oscars. 235 wins & 310 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Moonlight' AND p.libelle = 'Won 3 Oscars. 235 wins & 310 nominations total';


-- Insertion de la personne : Mahershala Ali
INSERT INTO personne (nom, prenom) 
SELECT 'Ali', 'Mahershala'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Ali' AND prenom = 'Mahershala'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Ali' 
  AND p.prenom = 'Mahershala'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Moonlight' 
  AND p.nom = 'Ali' 
  AND p.prenom = 'Mahershala'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Naomie Harris
INSERT INTO personne (nom, prenom) 
SELECT 'Harris', 'Naomie'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Harris' AND prenom = 'Naomie'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Harris' 
  AND p.prenom = 'Naomie'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Moonlight' 
  AND p.nom = 'Harris' 
  AND p.prenom = 'Naomie'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Trevante Rhodes
INSERT INTO personne (nom, prenom) 
SELECT 'Rhodes', 'Trevante'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Rhodes' AND prenom = 'Trevante'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Rhodes' 
  AND p.prenom = 'Trevante'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Moonlight' 
  AND p.nom = 'Rhodes' 
  AND p.prenom = 'Trevante'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Barry Jenkins
INSERT INTO personne (nom, prenom) 
SELECT 'Jenkins', 'Barry'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Jenkins' AND prenom = 'Barry'
);


-- Insertion du rôle : Realisateur
INSERT INTO role (libelle) 
SELECT 'Realisateur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Realisateur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Realisateur' 
  AND p.nom = 'Jenkins' 
  AND p.prenom = 'Barry'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Moonlight' 
  AND p.nom = 'Jenkins' 
  AND p.prenom = 'Barry'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Barry Jenkins
INSERT INTO personne (nom, prenom) 
SELECT 'Jenkins', 'Barry'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Jenkins' AND prenom = 'Barry'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Jenkins' 
  AND p.prenom = 'Barry'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Moonlight' 
  AND p.nom = 'Jenkins' 
  AND p.prenom = 'Barry'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Tarell Alvin McCraney
INSERT INTO personne (nom, prenom) 
SELECT 'Alvin McCraney', 'Tarell'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Alvin McCraney' AND prenom = 'Tarell'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Alvin McCraney' 
  AND p.prenom = 'Tarell'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Moonlight' 
  AND p.nom = 'Alvin McCraney' 
  AND p.prenom = 'Tarell'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : My Name Is Khan
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'My Name Is Khan',
    '12 Feb 2010',
    'Rizwan Khan is a Muslim immigrant to the US with Asperger''s syndrome. After his family falls apart in the aftermath of 9/11, he begins an epic quest across the country to speak to the President of the United States and clear his n...'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'My Name Is Khan' AND g.libelle = 'Drama';


-- Insertion du genre : Romance
INSERT INTO genre (libelle) 
SELECT 'Romance'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Romance');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'My Name Is Khan' AND g.libelle = 'Romance';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '25 wins & 36 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '25 wins & 36 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'My Name Is Khan' AND p.libelle = '25 wins & 36 nominations total';


-- Insertion de la personne : Shah Rukh Khan
INSERT INTO personne (nom, prenom) 
SELECT 'Rukh Khan', 'Shah'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Rukh Khan' AND prenom = 'Shah'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Rukh Khan' 
  AND p.prenom = 'Shah'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'My Name Is Khan' 
  AND p.nom = 'Rukh Khan' 
  AND p.prenom = 'Shah'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Kajol
INSERT INTO personne (nom, prenom) 
SELECT 'Kajol', 'Inconnu'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Kajol' AND prenom = 'Inconnu'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Kajol' 
  AND p.prenom = 'Inconnu'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'My Name Is Khan' 
  AND p.nom = 'Kajol' 
  AND p.prenom = 'Inconnu'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Sheetal Menon
INSERT INTO personne (nom, prenom) 
SELECT 'Menon', 'Sheetal'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Menon' AND prenom = 'Sheetal'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Menon' 
  AND p.prenom = 'Sheetal'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'My Name Is Khan' 
  AND p.nom = 'Menon' 
  AND p.prenom = 'Sheetal'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Karan Johar
INSERT INTO personne (nom, prenom) 
SELECT 'Johar', 'Karan'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Johar' AND prenom = 'Karan'
);


-- Insertion du rôle : Realisateur
INSERT INTO role (libelle) 
SELECT 'Realisateur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Realisateur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Realisateur' 
  AND p.nom = 'Johar' 
  AND p.prenom = 'Karan'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'My Name Is Khan' 
  AND p.nom = 'Johar' 
  AND p.prenom = 'Karan'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Shibani Bathija
INSERT INTO personne (nom, prenom) 
SELECT 'Bathija', 'Shibani'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Bathija' AND prenom = 'Shibani'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Bathija' 
  AND p.prenom = 'Shibani'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'My Name Is Khan' 
  AND p.nom = 'Bathija' 
  AND p.prenom = 'Shibani'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Niranjan Iyengar
INSERT INTO personne (nom, prenom) 
SELECT 'Iyengar', 'Niranjan'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Iyengar' AND prenom = 'Niranjan'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Iyengar' 
  AND p.prenom = 'Niranjan'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'My Name Is Khan' 
  AND p.nom = 'Iyengar' 
  AND p.prenom = 'Niranjan'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : NCIS: Los Angeles
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'NCIS: Los Angeles',
    '22 Sep 2009',
    'Follows the undercover agents assigned to the Office of Special Projects (OSP), a special branch of the Naval Criminal Investigative Service (NCIS) that investigate terrorism and National Security threats.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'NCIS: Los Angeles' AND g.libelle = 'Action';


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'NCIS: Los Angeles' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'NCIS: Los Angeles' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 1 Primetime Emmy. 21 wins & 24 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 1 Primetime Emmy. 21 wins & 24 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'NCIS: Los Angeles' AND p.libelle = 'Nominated for 1 Primetime Emmy. 21 wins & 24 nominations total';


-- Insertion de la personne : Chris O'Donnell
INSERT INTO personne (nom, prenom) 
SELECT 'O''Donnell', 'Chris'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'O''Donnell' AND prenom = 'Chris'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'O''Donnell' 
  AND p.prenom = 'Chris'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'NCIS: Los Angeles' 
  AND p.nom = 'O''Donnell' 
  AND p.prenom = 'Chris'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Daniela Ruah
INSERT INTO personne (nom, prenom) 
SELECT 'Ruah', 'Daniela'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Ruah' AND prenom = 'Daniela'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Ruah' 
  AND p.prenom = 'Daniela'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'NCIS: Los Angeles' 
  AND p.nom = 'Ruah' 
  AND p.prenom = 'Daniela'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : LL Cool J
INSERT INTO personne (nom, prenom) 
SELECT 'Cool J', 'LL'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Cool J' AND prenom = 'LL'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Cool J' 
  AND p.prenom = 'LL'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'NCIS: Los Angeles' 
  AND p.nom = 'Cool J' 
  AND p.prenom = 'LL'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Shane Brennan
INSERT INTO personne (nom, prenom) 
SELECT 'Brennan', 'Shane'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Brennan' AND prenom = 'Shane'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Brennan' 
  AND p.prenom = 'Shane'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'NCIS: Los Angeles' 
  AND p.nom = 'Brennan' 
  AND p.prenom = 'Shane'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : NCIS
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'NCIS',
    '23 Sep 2003',
    'Follows the Major Case Response Team (MCRT) from the Naval Criminal Investigative Service (NCIS), as they get to the bottom of criminal cases connected to Navy and Marine Corps personnel.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'NCIS' AND g.libelle = 'Action';


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'NCIS' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'NCIS' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 3 Primetime Emmys. 27 wins & 45 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 3 Primetime Emmys. 27 wins & 45 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'NCIS' AND p.libelle = 'Nominated for 3 Primetime Emmys. 27 wins & 45 nominations total';


-- Insertion de la personne : Sean Murray
INSERT INTO personne (nom, prenom) 
SELECT 'Murray', 'Sean'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Murray' AND prenom = 'Sean'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Murray' 
  AND p.prenom = 'Sean'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'NCIS' 
  AND p.nom = 'Murray' 
  AND p.prenom = 'Sean'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : David McCallum
INSERT INTO personne (nom, prenom) 
SELECT 'McCallum', 'David'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'McCallum' AND prenom = 'David'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'McCallum' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'NCIS' 
  AND p.nom = 'McCallum' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Mark Harmon
INSERT INTO personne (nom, prenom) 
SELECT 'Harmon', 'Mark'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Harmon' AND prenom = 'Mark'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Harmon' 
  AND p.prenom = 'Mark'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'NCIS' 
  AND p.nom = 'Harmon' 
  AND p.prenom = 'Mark'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Donald P. Bellisario
INSERT INTO personne (nom, prenom) 
SELECT 'P. Bellisario', 'Donald'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'P. Bellisario' AND prenom = 'Donald'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'P. Bellisario' 
  AND p.prenom = 'Donald'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'NCIS' 
  AND p.nom = 'P. Bellisario' 
  AND p.prenom = 'Donald'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Don McGill
INSERT INTO personne (nom, prenom) 
SELECT 'McGill', 'Don'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'McGill' AND prenom = 'Don'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'McGill' 
  AND p.prenom = 'Don'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'NCIS' 
  AND p.nom = 'McGill' 
  AND p.prenom = 'Don'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : The Nip Tuck Trip
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'The Nip Tuck Trip',
    '27 Jul 2011',
    'N/A'
);


-- Insertion du genre : Documentary
INSERT INTO genre (libelle) 
SELECT 'Documentary'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Documentary');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Nip Tuck Trip' AND g.libelle = 'Documentary';


-- Insertion de la personne : Slavko Martinov
INSERT INTO personne (nom, prenom) 
SELECT 'Martinov', 'Slavko'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Martinov' AND prenom = 'Slavko'
);


-- Insertion du rôle : Realisateur
INSERT INTO role (libelle) 
SELECT 'Realisateur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Realisateur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Realisateur' 
  AND p.nom = 'Martinov' 
  AND p.prenom = 'Slavko'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Nip Tuck Trip' 
  AND p.nom = 'Martinov' 
  AND p.prenom = 'Slavko'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : One Tree Hill
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'One Tree Hill',
    '23 Sep 2003',
    'Half-brothers Lucas and Nathan Scott trade between kinship and rivalry both on the basketball court and in the hearts of their friends in the small, but not so quiet town of Tree Hill, North Carolina.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'One Tree Hill' AND g.libelle = 'Drama';


-- Insertion du genre : Romance
INSERT INTO genre (libelle) 
SELECT 'Romance'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Romance');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'One Tree Hill' AND g.libelle = 'Romance';


-- Insertion du genre : Sport
INSERT INTO genre (libelle) 
SELECT 'Sport'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Sport');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'One Tree Hill' AND g.libelle = 'Sport';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '4 wins & 27 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '4 wins & 27 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'One Tree Hill' AND p.libelle = '4 wins & 27 nominations total';


-- Insertion de la personne : Chad Michael Murray
INSERT INTO personne (nom, prenom) 
SELECT 'Michael Murray', 'Chad'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Michael Murray' AND prenom = 'Chad'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Michael Murray' 
  AND p.prenom = 'Chad'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'One Tree Hill' 
  AND p.nom = 'Michael Murray' 
  AND p.prenom = 'Chad'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : James Lafferty
INSERT INTO personne (nom, prenom) 
SELECT 'Lafferty', 'James'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Lafferty' AND prenom = 'James'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Lafferty' 
  AND p.prenom = 'James'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'One Tree Hill' 
  AND p.nom = 'Lafferty' 
  AND p.prenom = 'James'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Hilarie Burton Morgan
INSERT INTO personne (nom, prenom) 
SELECT 'Burton Morgan', 'Hilarie'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Burton Morgan' AND prenom = 'Hilarie'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Burton Morgan' 
  AND p.prenom = 'Hilarie'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'One Tree Hill' 
  AND p.nom = 'Burton Morgan' 
  AND p.prenom = 'Hilarie'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Mark Schwahn
INSERT INTO personne (nom, prenom) 
SELECT 'Schwahn', 'Mark'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Schwahn' AND prenom = 'Mark'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Schwahn' 
  AND p.prenom = 'Mark'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'One Tree Hill' 
  AND p.nom = 'Schwahn' 
  AND p.prenom = 'Mark'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Oz
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Oz',
    '12 Jul 1997',
    'A series chronicling the daily activities of an unusual prison facility and its criminal inhabitants.'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Oz' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Oz' AND g.libelle = 'Drama';


-- Insertion du genre : Thriller
INSERT INTO genre (libelle) 
SELECT 'Thriller'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Thriller');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Oz' AND g.libelle = 'Thriller';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 2 Primetime Emmys. 16 wins & 56 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 2 Primetime Emmys. 16 wins & 56 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Oz' AND p.libelle = 'Nominated for 2 Primetime Emmys. 16 wins & 56 nominations total';


-- Insertion de la personne : Ernie Hudson
INSERT INTO personne (nom, prenom) 
SELECT 'Hudson', 'Ernie'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hudson' AND prenom = 'Ernie'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Hudson' 
  AND p.prenom = 'Ernie'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Oz' 
  AND p.nom = 'Hudson' 
  AND p.prenom = 'Ernie'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Terry Kinney
INSERT INTO personne (nom, prenom) 
SELECT 'Kinney', 'Terry'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Kinney' AND prenom = 'Terry'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Kinney' 
  AND p.prenom = 'Terry'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Oz' 
  AND p.nom = 'Kinney' 
  AND p.prenom = 'Terry'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : J.K. Simmons
INSERT INTO personne (nom, prenom) 
SELECT 'Simmons', 'J.K.'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Simmons' AND prenom = 'J.K.'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Simmons' 
  AND p.prenom = 'J.K.'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Oz' 
  AND p.nom = 'Simmons' 
  AND p.prenom = 'J.K.'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Tom Fontana
INSERT INTO personne (nom, prenom) 
SELECT 'Fontana', 'Tom'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Fontana' AND prenom = 'Tom'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Fontana' 
  AND p.prenom = 'Tom'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Oz' 
  AND p.nom = 'Fontana' 
  AND p.prenom = 'Tom'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Painkiller Jane
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Painkiller Jane',
    '13 Apr 2007',
    'Jane Vasco is a DEA agent recruited by a covert government agency that hunts genetically enhanced individuals. She discovers that she can heal rapidly from any injury and begins to investigate the source of her powers.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Painkiller Jane' AND g.libelle = 'Action';


-- Insertion du genre : Sci-Fi
INSERT INTO genre (libelle) 
SELECT 'Sci-Fi'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Sci-Fi');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Painkiller Jane' AND g.libelle = 'Sci-Fi';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '1 win & 2 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '1 win & 2 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Painkiller Jane' AND p.libelle = '1 win & 2 nominations total';


-- Insertion de la personne : Kristanna Loken
INSERT INTO personne (nom, prenom) 
SELECT 'Loken', 'Kristanna'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Loken' AND prenom = 'Kristanna'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Loken' 
  AND p.prenom = 'Kristanna'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Painkiller Jane' 
  AND p.nom = 'Loken' 
  AND p.prenom = 'Kristanna'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Noah Dalton Danby
INSERT INTO personne (nom, prenom) 
SELECT 'Dalton Danby', 'Noah'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Dalton Danby' AND prenom = 'Noah'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Dalton Danby' 
  AND p.prenom = 'Noah'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Painkiller Jane' 
  AND p.nom = 'Dalton Danby' 
  AND p.prenom = 'Noah'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Stephen Lobo
INSERT INTO personne (nom, prenom) 
SELECT 'Lobo', 'Stephen'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Lobo' AND prenom = 'Stephen'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Lobo' 
  AND p.prenom = 'Stephen'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Painkiller Jane' 
  AND p.nom = 'Lobo' 
  AND p.prenom = 'Stephen'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Primeval
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Primeval',
    '09 Aug 2008',
    'When strange anomalies start to appear all over England, Professor Cutter and his team must track down and capture all sorts of dangerous prehistoric creatures from Earth''s distant past and near future.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Primeval' AND g.libelle = 'Action';


-- Insertion du genre : Adventure
INSERT INTO genre (libelle) 
SELECT 'Adventure'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Adventure');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Primeval' AND g.libelle = 'Adventure';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Primeval' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 1 BAFTA Award5 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 1 BAFTA Award5 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Primeval' AND p.libelle = 'Nominated for 1 BAFTA Award5 nominations total';


-- Insertion de la personne : Andrew Lee Potts
INSERT INTO personne (nom, prenom) 
SELECT 'Lee Potts', 'Andrew'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Lee Potts' AND prenom = 'Andrew'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Lee Potts' 
  AND p.prenom = 'Andrew'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Primeval' 
  AND p.nom = 'Lee Potts' 
  AND p.prenom = 'Andrew'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Hannah Spearritt
INSERT INTO personne (nom, prenom) 
SELECT 'Spearritt', 'Hannah'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Spearritt' AND prenom = 'Hannah'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Spearritt' 
  AND p.prenom = 'Hannah'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Primeval' 
  AND p.nom = 'Spearritt' 
  AND p.prenom = 'Hannah'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Ben Miller
INSERT INTO personne (nom, prenom) 
SELECT 'Miller', 'Ben'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Miller' AND prenom = 'Ben'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Miller' 
  AND p.prenom = 'Ben'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Primeval' 
  AND p.nom = 'Miller' 
  AND p.prenom = 'Ben'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Tim Haines
INSERT INTO personne (nom, prenom) 
SELECT 'Haines', 'Tim'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Haines' AND prenom = 'Tim'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Haines' 
  AND p.prenom = 'Tim'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Primeval' 
  AND p.nom = 'Haines' 
  AND p.prenom = 'Tim'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Adrian Hodges
INSERT INTO personne (nom, prenom) 
SELECT 'Hodges', 'Adrian'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hodges' AND prenom = 'Adrian'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Hodges' 
  AND p.prenom = 'Adrian'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Primeval' 
  AND p.nom = 'Hodges' 
  AND p.prenom = 'Adrian'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Prison Break
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Prison Break',
    '29 Aug 2005',
    'A structural engineer installs himself in a prison he helped design, in order to save his falsely accused brother from a death sentence by breaking themselves out from the inside.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Prison Break' AND g.libelle = 'Action';


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Prison Break' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Prison Break' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 1 Primetime Emmy. 8 wins & 32 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 1 Primetime Emmy. 8 wins & 32 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Prison Break' AND p.libelle = 'Nominated for 1 Primetime Emmy. 8 wins & 32 nominations total';


-- Insertion de la personne : Dominic Purcell
INSERT INTO personne (nom, prenom) 
SELECT 'Purcell', 'Dominic'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Purcell' AND prenom = 'Dominic'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Purcell' 
  AND p.prenom = 'Dominic'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Prison Break' 
  AND p.nom = 'Purcell' 
  AND p.prenom = 'Dominic'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Wentworth Miller
INSERT INTO personne (nom, prenom) 
SELECT 'Miller', 'Wentworth'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Miller' AND prenom = 'Wentworth'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Miller' 
  AND p.prenom = 'Wentworth'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Prison Break' 
  AND p.nom = 'Miller' 
  AND p.prenom = 'Wentworth'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Amaury Nolasco
INSERT INTO personne (nom, prenom) 
SELECT 'Nolasco', 'Amaury'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Nolasco' AND prenom = 'Amaury'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Nolasco' 
  AND p.prenom = 'Amaury'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Prison Break' 
  AND p.nom = 'Nolasco' 
  AND p.prenom = 'Amaury'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Paul T. Scheuring
INSERT INTO personne (nom, prenom) 
SELECT 'T. Scheuring', 'Paul'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'T. Scheuring' AND prenom = 'Paul'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'T. Scheuring' 
  AND p.prenom = 'Paul'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Prison Break' 
  AND p.nom = 'T. Scheuring' 
  AND p.prenom = 'Paul'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Private Practice
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Private Practice',
    '19 Sep 2007',
    'A spin-off of the medical drama "Grey''s Anatomy" centering on the life of neonatal surgeon Addison Montgomery.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Private Practice' AND g.libelle = 'Comedy';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Private Practice' AND g.libelle = 'Drama';


-- Insertion du genre : Romance
INSERT INTO genre (libelle) 
SELECT 'Romance'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Romance');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Private Practice' AND g.libelle = 'Romance';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '11 wins & 22 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '11 wins & 22 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Private Practice' AND p.libelle = '11 wins & 22 nominations total';


-- Insertion de la personne : Kate Walsh
INSERT INTO personne (nom, prenom) 
SELECT 'Walsh', 'Kate'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Walsh' AND prenom = 'Kate'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Walsh' 
  AND p.prenom = 'Kate'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Private Practice' 
  AND p.nom = 'Walsh' 
  AND p.prenom = 'Kate'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Paul Adelstein
INSERT INTO personne (nom, prenom) 
SELECT 'Adelstein', 'Paul'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Adelstein' AND prenom = 'Paul'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Adelstein' 
  AND p.prenom = 'Paul'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Private Practice' 
  AND p.nom = 'Adelstein' 
  AND p.prenom = 'Paul'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : KaDee Strickland
INSERT INTO personne (nom, prenom) 
SELECT 'Strickland', 'KaDee'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Strickland' AND prenom = 'KaDee'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Strickland' 
  AND p.prenom = 'KaDee'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Private Practice' 
  AND p.nom = 'Strickland' 
  AND p.prenom = 'KaDee'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Shonda Rhimes
INSERT INTO personne (nom, prenom) 
SELECT 'Rhimes', 'Shonda'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Rhimes' AND prenom = 'Shonda'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Rhimes' 
  AND p.prenom = 'Shonda'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Private Practice' 
  AND p.nom = 'Rhimes' 
  AND p.prenom = 'Shonda'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Psych
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Psych',
    '07 Jul 2006',
    'When a novice sleuth convinces the police he has psychic powers, he and his reluctant best friend are hired on as consultants to help solve complicated cases.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Psych' AND g.libelle = 'Comedy';


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Psych' AND g.libelle = 'Crime';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Psych' AND g.libelle = 'Mystery';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 1 Primetime Emmy. 5 wins & 32 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 1 Primetime Emmy. 5 wins & 32 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Psych' AND p.libelle = 'Nominated for 1 Primetime Emmy. 5 wins & 32 nominations total';


-- Insertion de la personne : James Roday Rodriguez
INSERT INTO personne (nom, prenom) 
SELECT 'Roday Rodriguez', 'James'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Roday Rodriguez' AND prenom = 'James'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Roday Rodriguez' 
  AND p.prenom = 'James'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Psych' 
  AND p.nom = 'Roday Rodriguez' 
  AND p.prenom = 'James'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Dulé Hill
INSERT INTO personne (nom, prenom) 
SELECT 'Hill', 'Dulé'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hill' AND prenom = 'Dulé'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Hill' 
  AND p.prenom = 'Dulé'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Psych' 
  AND p.nom = 'Hill' 
  AND p.prenom = 'Dulé'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Timothy Omundson
INSERT INTO personne (nom, prenom) 
SELECT 'Omundson', 'Timothy'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Omundson' AND prenom = 'Timothy'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Omundson' 
  AND p.prenom = 'Timothy'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Psych' 
  AND p.nom = 'Omundson' 
  AND p.prenom = 'Timothy'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Steve Franks
INSERT INTO personne (nom, prenom) 
SELECT 'Franks', 'Steve'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Franks' AND prenom = 'Steve'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Franks' 
  AND p.prenom = 'Steve'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Psych' 
  AND p.nom = 'Franks' 
  AND p.prenom = 'Steve'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Pushing Daisies
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Pushing Daisies',
    '03 Oct 2007',
    'A pastry chef with the power to bring dead people back to life solves murder mysteries with his resurrected childhood sweetheart, a cynical private investigator, and a lovesick waitress.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Pushing Daisies' AND g.libelle = 'Comedy';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Pushing Daisies' AND g.libelle = 'Drama';


-- Insertion du genre : Fantasy
INSERT INTO genre (libelle) 
SELECT 'Fantasy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Fantasy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Pushing Daisies' AND g.libelle = 'Fantasy';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 7 Primetime Emmys. 35 wins & 81 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 7 Primetime Emmys. 35 wins & 81 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Pushing Daisies' AND p.libelle = 'Won 7 Primetime Emmys. 35 wins & 81 nominations total';


-- Insertion de la personne : Lee Pace
INSERT INTO personne (nom, prenom) 
SELECT 'Pace', 'Lee'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Pace' AND prenom = 'Lee'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Pace' 
  AND p.prenom = 'Lee'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Pushing Daisies' 
  AND p.nom = 'Pace' 
  AND p.prenom = 'Lee'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Anna Friel
INSERT INTO personne (nom, prenom) 
SELECT 'Friel', 'Anna'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Friel' AND prenom = 'Anna'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Friel' 
  AND p.prenom = 'Anna'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Pushing Daisies' 
  AND p.nom = 'Friel' 
  AND p.prenom = 'Anna'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Chi McBride
INSERT INTO personne (nom, prenom) 
SELECT 'McBride', 'Chi'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'McBride' AND prenom = 'Chi'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'McBride' 
  AND p.prenom = 'Chi'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Pushing Daisies' 
  AND p.nom = 'McBride' 
  AND p.prenom = 'Chi'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Bryan Fuller
INSERT INTO personne (nom, prenom) 
SELECT 'Fuller', 'Bryan'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Fuller' AND prenom = 'Bryan'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Fuller' 
  AND p.prenom = 'Bryan'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Pushing Daisies' 
  AND p.nom = 'Fuller' 
  AND p.prenom = 'Bryan'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Raines
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Raines',
    '09 Mar 2007',
    'Eccentric LAPD detective Michael Raines has a unique ability - he''s able to have conversations with deceased crime victims. With their help, Raines is able to retrace their lives leading up to the murder, in hopes of finding the c...'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Raines' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Raines' AND g.libelle = 'Drama';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Raines' AND g.libelle = 'Mystery';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '1 nomination'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '1 nomination');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Raines' AND p.libelle = '1 nomination';


-- Insertion de la personne : Jeff Goldblum
INSERT INTO personne (nom, prenom) 
SELECT 'Goldblum', 'Jeff'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Goldblum' AND prenom = 'Jeff'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Goldblum' 
  AND p.prenom = 'Jeff'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Raines' 
  AND p.nom = 'Goldblum' 
  AND p.prenom = 'Jeff'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Matt Craven
INSERT INTO personne (nom, prenom) 
SELECT 'Craven', 'Matt'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Craven' AND prenom = 'Matt'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Craven' 
  AND p.prenom = 'Matt'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Raines' 
  AND p.nom = 'Craven' 
  AND p.prenom = 'Matt'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Nicole Sullivan
INSERT INTO personne (nom, prenom) 
SELECT 'Sullivan', 'Nicole'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Sullivan' AND prenom = 'Nicole'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Sullivan' 
  AND p.prenom = 'Nicole'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Raines' 
  AND p.nom = 'Sullivan' 
  AND p.prenom = 'Nicole'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Graham Yost
INSERT INTO personne (nom, prenom) 
SELECT 'Yost', 'Graham'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Yost' AND prenom = 'Graham'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Yost' 
  AND p.prenom = 'Graham'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Raines' 
  AND p.nom = 'Yost' 
  AND p.prenom = 'Graham'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Reaper
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Reaper',
    '25 Sep 2007',
    'A slacker must find and return escaped souls to hell.'
);


-- Insertion du genre : Adventure
INSERT INTO genre (libelle) 
SELECT 'Adventure'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Adventure');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Reaper' AND g.libelle = 'Adventure';


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Reaper' AND g.libelle = 'Comedy';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Reaper' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '2 wins & 20 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '2 wins & 20 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Reaper' AND p.libelle = '2 wins & 20 nominations total';


-- Insertion de la personne : Bret Harrison
INSERT INTO personne (nom, prenom) 
SELECT 'Harrison', 'Bret'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Harrison' AND prenom = 'Bret'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Harrison' 
  AND p.prenom = 'Bret'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Reaper' 
  AND p.nom = 'Harrison' 
  AND p.prenom = 'Bret'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Tyler Labine
INSERT INTO personne (nom, prenom) 
SELECT 'Labine', 'Tyler'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Labine' AND prenom = 'Tyler'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Labine' 
  AND p.prenom = 'Tyler'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Reaper' 
  AND p.nom = 'Labine' 
  AND p.prenom = 'Tyler'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Rick Gonzalez
INSERT INTO personne (nom, prenom) 
SELECT 'Gonzalez', 'Rick'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Gonzalez' AND prenom = 'Rick'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Gonzalez' 
  AND p.prenom = 'Rick'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Reaper' 
  AND p.nom = 'Gonzalez' 
  AND p.prenom = 'Rick'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Tara Butters
INSERT INTO personne (nom, prenom) 
SELECT 'Butters', 'Tara'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Butters' AND prenom = 'Tara'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Butters' 
  AND p.prenom = 'Tara'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Reaper' 
  AND p.nom = 'Butters' 
  AND p.prenom = 'Tara'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Michele Fazekas
INSERT INTO personne (nom, prenom) 
SELECT 'Fazekas', 'Michele'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Fazekas' AND prenom = 'Michele'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Fazekas' 
  AND p.prenom = 'Michele'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Reaper' 
  AND p.nom = 'Fazekas' 
  AND p.prenom = 'Michele'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Robinhood
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Robinhood',
    '28 Mar 2025',
    'A modern Robin Hood switches from stealing to protecting when circumstances make him the reluctant bodyguard of a high-profile client.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Robinhood' AND g.libelle = 'Action';


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Robinhood' AND g.libelle = 'Comedy';


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Robinhood' AND g.libelle = 'Crime';


-- Insertion de la personne : Sreeleela
INSERT INTO personne (nom, prenom) 
SELECT 'Sreeleela', 'Inconnu'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Sreeleela' AND prenom = 'Inconnu'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Sreeleela' 
  AND p.prenom = 'Inconnu'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Robinhood' 
  AND p.nom = 'Sreeleela' 
  AND p.prenom = 'Inconnu'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Nithiin
INSERT INTO personne (nom, prenom) 
SELECT 'Nithiin', 'Inconnu'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Nithiin' AND prenom = 'Inconnu'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Nithiin' 
  AND p.prenom = 'Inconnu'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Robinhood' 
  AND p.nom = 'Nithiin' 
  AND p.prenom = 'Inconnu'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Shine Tom Chacko
INSERT INTO personne (nom, prenom) 
SELECT 'Tom Chacko', 'Shine'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Tom Chacko' AND prenom = 'Shine'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Tom Chacko' 
  AND p.prenom = 'Shine'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Robinhood' 
  AND p.nom = 'Tom Chacko' 
  AND p.prenom = 'Shine'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Venky Kudumula
INSERT INTO personne (nom, prenom) 
SELECT 'Kudumula', 'Venky'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Kudumula' AND prenom = 'Venky'
);


-- Insertion du rôle : Realisateur
INSERT INTO role (libelle) 
SELECT 'Realisateur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Realisateur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Realisateur' 
  AND p.nom = 'Kudumula' 
  AND p.prenom = 'Venky'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Robinhood' 
  AND p.nom = 'Kudumula' 
  AND p.prenom = 'Venky'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Venky Kudumula
INSERT INTO personne (nom, prenom) 
SELECT 'Kudumula', 'Venky'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Kudumula' AND prenom = 'Venky'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Kudumula' 
  AND p.prenom = 'Venky'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Robinhood' 
  AND p.nom = 'Kudumula' 
  AND p.prenom = 'Venky'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Rome
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Rome',
    '28 Aug 2005',
    'The lives of both illustrious and ordinary Romans in the last days of the Roman Republic.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Rome' AND g.libelle = 'Action';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Rome' AND g.libelle = 'Drama';


-- Insertion du genre : Romance
INSERT INTO genre (libelle) 
SELECT 'Romance'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Romance');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Rome' AND g.libelle = 'Romance';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 7 Primetime Emmys. 19 wins & 36 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 7 Primetime Emmys. 19 wins & 36 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Rome' AND p.libelle = 'Won 7 Primetime Emmys. 19 wins & 36 nominations total';


-- Insertion de la personne : Kevin McKidd
INSERT INTO personne (nom, prenom) 
SELECT 'McKidd', 'Kevin'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'McKidd' AND prenom = 'Kevin'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'McKidd' 
  AND p.prenom = 'Kevin'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Rome' 
  AND p.nom = 'McKidd' 
  AND p.prenom = 'Kevin'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Ray Stevenson
INSERT INTO personne (nom, prenom) 
SELECT 'Stevenson', 'Ray'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Stevenson' AND prenom = 'Ray'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Stevenson' 
  AND p.prenom = 'Ray'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Rome' 
  AND p.nom = 'Stevenson' 
  AND p.prenom = 'Ray'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Polly Walker
INSERT INTO personne (nom, prenom) 
SELECT 'Walker', 'Polly'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Walker' AND prenom = 'Polly'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Walker' 
  AND p.prenom = 'Polly'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Rome' 
  AND p.nom = 'Walker' 
  AND p.prenom = 'Polly'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Bruno Heller
INSERT INTO personne (nom, prenom) 
SELECT 'Heller', 'Bruno'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Heller' AND prenom = 'Bruno'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Heller' 
  AND p.prenom = 'Bruno'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Rome' 
  AND p.nom = 'Heller' 
  AND p.prenom = 'Bruno'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : William J. MacDonald
INSERT INTO personne (nom, prenom) 
SELECT 'J. MacDonald', 'William'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'J. MacDonald' AND prenom = 'William'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'J. MacDonald' 
  AND p.prenom = 'William'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Rome' 
  AND p.nom = 'J. MacDonald' 
  AND p.prenom = 'William'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : John Milius
INSERT INTO personne (nom, prenom) 
SELECT 'Milius', 'John'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Milius' AND prenom = 'John'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Milius' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Rome' 
  AND p.nom = 'Milius' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Samantha Who?
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Samantha Who?',
    '15 Oct 2007',
    'A woman suffers from amnesia and is forced to find out who she really is.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Samantha Who?' AND g.libelle = 'Comedy';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Samantha Who?' AND g.libelle = 'Mystery';


-- Insertion du genre : Romance
INSERT INTO genre (libelle) 
SELECT 'Romance'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Romance');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Samantha Who?' AND g.libelle = 'Romance';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 1 Primetime Emmy. 5 wins & 19 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 1 Primetime Emmy. 5 wins & 19 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Samantha Who?' AND p.libelle = 'Won 1 Primetime Emmy. 5 wins & 19 nominations total';


-- Insertion de la personne : Christina Applegate
INSERT INTO personne (nom, prenom) 
SELECT 'Applegate', 'Christina'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Applegate' AND prenom = 'Christina'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Applegate' 
  AND p.prenom = 'Christina'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Samantha Who?' 
  AND p.nom = 'Applegate' 
  AND p.prenom = 'Christina'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jennifer Esposito
INSERT INTO personne (nom, prenom) 
SELECT 'Esposito', 'Jennifer'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Esposito' AND prenom = 'Jennifer'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Esposito' 
  AND p.prenom = 'Jennifer'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Samantha Who?' 
  AND p.nom = 'Esposito' 
  AND p.prenom = 'Jennifer'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Kevin Dunn
INSERT INTO personne (nom, prenom) 
SELECT 'Dunn', 'Kevin'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Dunn' AND prenom = 'Kevin'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Dunn' 
  AND p.prenom = 'Kevin'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Samantha Who?' 
  AND p.nom = 'Dunn' 
  AND p.prenom = 'Kevin'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Cecelia Ahern
INSERT INTO personne (nom, prenom) 
SELECT 'Ahern', 'Cecelia'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Ahern' AND prenom = 'Cecelia'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Ahern' 
  AND p.prenom = 'Cecelia'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Samantha Who?' 
  AND p.nom = 'Ahern' 
  AND p.prenom = 'Cecelia'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Donald Todd
INSERT INTO personne (nom, prenom) 
SELECT 'Todd', 'Donald'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Todd' AND prenom = 'Donald'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Todd' 
  AND p.prenom = 'Donald'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Samantha Who?' 
  AND p.nom = 'Todd' 
  AND p.prenom = 'Donald'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Sanctuary
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Sanctuary',
    '03 Oct 2008',
    'Modern society''s evolution involves stem cells, gene therapy, transplants, and cloning, but also exposes the existence of monsters that hold the key to our race''s future.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Sanctuary' AND g.libelle = 'Action';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Sanctuary' AND g.libelle = 'Drama';


-- Insertion du genre : Fantasy
INSERT INTO genre (libelle) 
SELECT 'Fantasy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Fantasy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Sanctuary' AND g.libelle = 'Fantasy';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 1 Primetime Emmy. 20 wins & 55 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 1 Primetime Emmy. 20 wins & 55 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Sanctuary' AND p.libelle = 'Nominated for 1 Primetime Emmy. 20 wins & 55 nominations total';


-- Insertion de la personne : Amanda Tapping
INSERT INTO personne (nom, prenom) 
SELECT 'Tapping', 'Amanda'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Tapping' AND prenom = 'Amanda'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Tapping' 
  AND p.prenom = 'Amanda'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Sanctuary' 
  AND p.nom = 'Tapping' 
  AND p.prenom = 'Amanda'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Robin Dunne
INSERT INTO personne (nom, prenom) 
SELECT 'Dunne', 'Robin'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Dunne' AND prenom = 'Robin'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Dunne' 
  AND p.prenom = 'Robin'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Sanctuary' 
  AND p.nom = 'Dunne' 
  AND p.prenom = 'Robin'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Christopher Heyerdahl
INSERT INTO personne (nom, prenom) 
SELECT 'Heyerdahl', 'Christopher'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Heyerdahl' AND prenom = 'Christopher'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Heyerdahl' 
  AND p.prenom = 'Christopher'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Sanctuary' 
  AND p.nom = 'Heyerdahl' 
  AND p.prenom = 'Christopher'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Damian Kindler
INSERT INTO personne (nom, prenom) 
SELECT 'Kindler', 'Damian'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Kindler' AND prenom = 'Damian'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Kindler' 
  AND p.prenom = 'Damian'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Sanctuary' 
  AND p.nom = 'Kindler' 
  AND p.prenom = 'Damian'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Scrubs
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Scrubs',
    '02 Oct 2001',
    'In the unreal world of Sacred Heart Hospital, intern John "J.D." Dorian learns the ways of medicine, friendship and life.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Scrubs' AND g.libelle = 'Comedy';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Scrubs' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 2 Primetime Emmys. 33 wins & 136 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 2 Primetime Emmys. 33 wins & 136 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Scrubs' AND p.libelle = 'Won 2 Primetime Emmys. 33 wins & 136 nominations total';


-- Insertion de la personne : Zach Braff
INSERT INTO personne (nom, prenom) 
SELECT 'Braff', 'Zach'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Braff' AND prenom = 'Zach'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Braff' 
  AND p.prenom = 'Zach'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Scrubs' 
  AND p.nom = 'Braff' 
  AND p.prenom = 'Zach'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Donald Faison
INSERT INTO personne (nom, prenom) 
SELECT 'Faison', 'Donald'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Faison' AND prenom = 'Donald'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Faison' 
  AND p.prenom = 'Donald'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Scrubs' 
  AND p.nom = 'Faison' 
  AND p.prenom = 'Donald'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Sarah Chalke
INSERT INTO personne (nom, prenom) 
SELECT 'Chalke', 'Sarah'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Chalke' AND prenom = 'Sarah'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Chalke' 
  AND p.prenom = 'Sarah'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Scrubs' 
  AND p.nom = 'Chalke' 
  AND p.prenom = 'Sarah'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Bill Lawrence
INSERT INTO personne (nom, prenom) 
SELECT 'Lawrence', 'Bill'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Lawrence' AND prenom = 'Bill'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Lawrence' 
  AND p.prenom = 'Bill'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Scrubs' 
  AND p.nom = 'Lawrence' 
  AND p.prenom = 'Bill'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Sex and the City
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Sex and the City',
    '06 Jun 1998',
    'Four female New Yorkers gossip about their sex lives (or lack thereof) and find new ways to deal with being a woman in the late 1990s.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Sex and the City' AND g.libelle = 'Comedy';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Sex and the City' AND g.libelle = 'Drama';


-- Insertion du genre : Romance
INSERT INTO genre (libelle) 
SELECT 'Romance'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Romance');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Sex and the City' AND g.libelle = 'Romance';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 7 Primetime Emmys. 48 wins & 166 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 7 Primetime Emmys. 48 wins & 166 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Sex and the City' AND p.libelle = 'Won 7 Primetime Emmys. 48 wins & 166 nominations total';


-- Insertion de la personne : Sarah Jessica Parker
INSERT INTO personne (nom, prenom) 
SELECT 'Jessica Parker', 'Sarah'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Jessica Parker' AND prenom = 'Sarah'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Jessica Parker' 
  AND p.prenom = 'Sarah'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Sex and the City' 
  AND p.nom = 'Jessica Parker' 
  AND p.prenom = 'Sarah'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Kim Cattrall
INSERT INTO personne (nom, prenom) 
SELECT 'Cattrall', 'Kim'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Cattrall' AND prenom = 'Kim'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Cattrall' 
  AND p.prenom = 'Kim'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Sex and the City' 
  AND p.nom = 'Cattrall' 
  AND p.prenom = 'Kim'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Kristin Davis
INSERT INTO personne (nom, prenom) 
SELECT 'Davis', 'Kristin'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Davis' AND prenom = 'Kristin'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Davis' 
  AND p.prenom = 'Kristin'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Sex and the City' 
  AND p.nom = 'Davis' 
  AND p.prenom = 'Kristin'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Darren Star
INSERT INTO personne (nom, prenom) 
SELECT 'Star', 'Darren'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Star' AND prenom = 'Darren'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Star' 
  AND p.prenom = 'Darren'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Sex and the City' 
  AND p.nom = 'Star' 
  AND p.prenom = 'Darren'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Skins
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Skins',
    '17 Jan 2011',
    'The messy lives, loves, delirious highs and inevitable lows of raucous teenage friends in Bristol.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Skins' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 2 BAFTA 7 wins & 34 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 2 BAFTA 7 wins & 34 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Skins' AND p.libelle = 'Won 2 BAFTA 7 wins & 34 nominations total';


-- Insertion de la personne : Kaya Scodelario
INSERT INTO personne (nom, prenom) 
SELECT 'Scodelario', 'Kaya'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Scodelario' AND prenom = 'Kaya'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Scodelario' 
  AND p.prenom = 'Kaya'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Skins' 
  AND p.nom = 'Scodelario' 
  AND p.prenom = 'Kaya'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Nicholas Hoult
INSERT INTO personne (nom, prenom) 
SELECT 'Hoult', 'Nicholas'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hoult' AND prenom = 'Nicholas'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Hoult' 
  AND p.prenom = 'Nicholas'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Skins' 
  AND p.nom = 'Hoult' 
  AND p.prenom = 'Nicholas'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Joe Dempsie
INSERT INTO personne (nom, prenom) 
SELECT 'Dempsie', 'Joe'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Dempsie' AND prenom = 'Joe'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Dempsie' 
  AND p.prenom = 'Joe'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Skins' 
  AND p.nom = 'Dempsie' 
  AND p.prenom = 'Joe'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jamie Brittain
INSERT INTO personne (nom, prenom) 
SELECT 'Brittain', 'Jamie'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Brittain' AND prenom = 'Jamie'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Brittain' 
  AND p.prenom = 'Jamie'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Skins' 
  AND p.nom = 'Brittain' 
  AND p.prenom = 'Jamie'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Bryan Elsley
INSERT INTO personne (nom, prenom) 
SELECT 'Elsley', 'Bryan'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Elsley' AND prenom = 'Bryan'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Elsley' 
  AND p.prenom = 'Bryan'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Skins' 
  AND p.nom = 'Elsley' 
  AND p.prenom = 'Bryan'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Smallville
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Smallville',
    '16 Oct 2001',
    'A young Clark Kent struggles to find his place in the world as he learns to harness his alien powers for good and deals with the typical troubles of teenage life in Smallville, Kansas.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Smallville' AND g.libelle = 'Action';


-- Insertion du genre : Adventure
INSERT INTO genre (libelle) 
SELECT 'Adventure'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Adventure');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Smallville' AND g.libelle = 'Adventure';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Smallville' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 3 Primetime Emmys. 35 wins & 155 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 3 Primetime Emmys. 35 wins & 155 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Smallville' AND p.libelle = 'Won 3 Primetime Emmys. 35 wins & 155 nominations total';


-- Insertion de la personne : Tom Welling
INSERT INTO personne (nom, prenom) 
SELECT 'Welling', 'Tom'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Welling' AND prenom = 'Tom'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Welling' 
  AND p.prenom = 'Tom'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Smallville' 
  AND p.nom = 'Welling' 
  AND p.prenom = 'Tom'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Michael Rosenbaum
INSERT INTO personne (nom, prenom) 
SELECT 'Rosenbaum', 'Michael'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Rosenbaum' AND prenom = 'Michael'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Rosenbaum' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Smallville' 
  AND p.nom = 'Rosenbaum' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Allison Mack
INSERT INTO personne (nom, prenom) 
SELECT 'Mack', 'Allison'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Mack' AND prenom = 'Allison'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Mack' 
  AND p.prenom = 'Allison'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Smallville' 
  AND p.nom = 'Mack' 
  AND p.prenom = 'Allison'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Alfred Gough
INSERT INTO personne (nom, prenom) 
SELECT 'Gough', 'Alfred'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Gough' AND prenom = 'Alfred'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Gough' 
  AND p.prenom = 'Alfred'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Smallville' 
  AND p.nom = 'Gough' 
  AND p.prenom = 'Alfred'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Miles Millar
INSERT INTO personne (nom, prenom) 
SELECT 'Millar', 'Miles'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Millar' AND prenom = 'Miles'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Millar' 
  AND p.prenom = 'Miles'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Smallville' 
  AND p.nom = 'Millar' 
  AND p.prenom = 'Miles'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Sons of Anarchy
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Sons of Anarchy',
    '03 Sep 2008',
    'A biker struggles to balance being a father and being involved in an outlaw motorcycle club.'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Sons of Anarchy' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Sons of Anarchy' AND g.libelle = 'Drama';


-- Insertion du genre : Thriller
INSERT INTO genre (libelle) 
SELECT 'Thriller'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Thriller');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Sons of Anarchy' AND g.libelle = 'Thriller';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 5 Primetime Emmys. 12 wins & 58 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 5 Primetime Emmys. 12 wins & 58 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Sons of Anarchy' AND p.libelle = 'Nominated for 5 Primetime Emmys. 12 wins & 58 nominations total';


-- Insertion de la personne : Charlie Hunnam
INSERT INTO personne (nom, prenom) 
SELECT 'Hunnam', 'Charlie'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hunnam' AND prenom = 'Charlie'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Hunnam' 
  AND p.prenom = 'Charlie'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Sons of Anarchy' 
  AND p.nom = 'Hunnam' 
  AND p.prenom = 'Charlie'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Katey Sagal
INSERT INTO personne (nom, prenom) 
SELECT 'Sagal', 'Katey'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Sagal' AND prenom = 'Katey'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Sagal' 
  AND p.prenom = 'Katey'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Sons of Anarchy' 
  AND p.nom = 'Sagal' 
  AND p.prenom = 'Katey'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Mark Boone Junior
INSERT INTO personne (nom, prenom) 
SELECT 'Boone Junior', 'Mark'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Boone Junior' AND prenom = 'Mark'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Boone Junior' 
  AND p.prenom = 'Mark'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Sons of Anarchy' 
  AND p.nom = 'Boone Junior' 
  AND p.prenom = 'Mark'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Kurt Sutter
INSERT INTO personne (nom, prenom) 
SELECT 'Sutter', 'Kurt'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Sutter' AND prenom = 'Kurt'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Sutter' 
  AND p.prenom = 'Kurt'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Sons of Anarchy' 
  AND p.nom = 'Sutter' 
  AND p.prenom = 'Kurt'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : South Park
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'South Park',
    '13 Aug 1997',
    'The misadventures of four foul-mouthed, dirty-minded, irreverent grade-schoolers who live in the quiet, dysfunctional mountain town of South Park, Colorado.'
);


-- Insertion du genre : Animation
INSERT INTO genre (libelle) 
SELECT 'Animation'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Animation');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'South Park' AND g.libelle = 'Animation';


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'South Park' AND g.libelle = 'Comedy';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 5 Primetime Emmys. 20 wins & 93 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 5 Primetime Emmys. 20 wins & 93 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'South Park' AND p.libelle = 'Won 5 Primetime Emmys. 20 wins & 93 nominations total';


-- Insertion de la personne : Trey Parker
INSERT INTO personne (nom, prenom) 
SELECT 'Parker', 'Trey'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Parker' AND prenom = 'Trey'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Parker' 
  AND p.prenom = 'Trey'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'South Park' 
  AND p.nom = 'Parker' 
  AND p.prenom = 'Trey'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Matt Stone
INSERT INTO personne (nom, prenom) 
SELECT 'Stone', 'Matt'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Stone' AND prenom = 'Matt'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Stone' 
  AND p.prenom = 'Matt'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'South Park' 
  AND p.nom = 'Stone' 
  AND p.prenom = 'Matt'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Isaac Hayes
INSERT INTO personne (nom, prenom) 
SELECT 'Hayes', 'Isaac'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hayes' AND prenom = 'Isaac'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Hayes' 
  AND p.prenom = 'Isaac'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'South Park' 
  AND p.nom = 'Hayes' 
  AND p.prenom = 'Isaac'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Trey Parker
INSERT INTO personne (nom, prenom) 
SELECT 'Parker', 'Trey'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Parker' AND prenom = 'Trey'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Parker' 
  AND p.prenom = 'Trey'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'South Park' 
  AND p.nom = 'Parker' 
  AND p.prenom = 'Trey'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Matt Stone
INSERT INTO personne (nom, prenom) 
SELECT 'Stone', 'Matt'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Stone' AND prenom = 'Matt'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Stone' 
  AND p.prenom = 'Matt'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'South Park' 
  AND p.nom = 'Stone' 
  AND p.prenom = 'Matt'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Brian Graden
INSERT INTO personne (nom, prenom) 
SELECT 'Graden', 'Brian'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Graden' AND prenom = 'Brian'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Graden' 
  AND p.prenom = 'Brian'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'South Park' 
  AND p.nom = 'Graden' 
  AND p.prenom = 'Brian'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Stargate: Atlantis
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Stargate: Atlantis',
    '16 Jul 2004',
    'An international team of scientists and military personnel discover a Stargate network in the Pegasus Galaxy and come face-to-face with a new, powerful enemy: The Wraith.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Stargate: Atlantis' AND g.libelle = 'Action';


-- Insertion du genre : Adventure
INSERT INTO genre (libelle) 
SELECT 'Adventure'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Adventure');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Stargate: Atlantis' AND g.libelle = 'Adventure';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Stargate: Atlantis' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 4 Primetime Emmys. 19 wins & 42 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 4 Primetime Emmys. 19 wins & 42 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Stargate: Atlantis' AND p.libelle = 'Nominated for 4 Primetime Emmys. 19 wins & 42 nominations total';


-- Insertion de la personne : Joe Flanigan
INSERT INTO personne (nom, prenom) 
SELECT 'Flanigan', 'Joe'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Flanigan' AND prenom = 'Joe'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Flanigan' 
  AND p.prenom = 'Joe'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Stargate: Atlantis' 
  AND p.nom = 'Flanigan' 
  AND p.prenom = 'Joe'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Rachel Luttrell
INSERT INTO personne (nom, prenom) 
SELECT 'Luttrell', 'Rachel'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Luttrell' AND prenom = 'Rachel'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Luttrell' 
  AND p.prenom = 'Rachel'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Stargate: Atlantis' 
  AND p.nom = 'Luttrell' 
  AND p.prenom = 'Rachel'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : David Hewlett
INSERT INTO personne (nom, prenom) 
SELECT 'Hewlett', 'David'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hewlett' AND prenom = 'David'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Hewlett' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Stargate: Atlantis' 
  AND p.nom = 'Hewlett' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Robert C. Cooper
INSERT INTO personne (nom, prenom) 
SELECT 'C. Cooper', 'Robert'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'C. Cooper' AND prenom = 'Robert'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'C. Cooper' 
  AND p.prenom = 'Robert'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Stargate: Atlantis' 
  AND p.nom = 'C. Cooper' 
  AND p.prenom = 'Robert'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Brad Wright
INSERT INTO personne (nom, prenom) 
SELECT 'Wright', 'Brad'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Wright' AND prenom = 'Brad'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Wright' 
  AND p.prenom = 'Brad'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Stargate: Atlantis' 
  AND p.nom = 'Wright' 
  AND p.prenom = 'Brad'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Stargate SG-1
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Stargate SG-1',
    '27 Jul 1997',
    'Set after the events of the Stargate (1994) movie, the series follows SG-1, one of many secret military teams of soldiers and scientists who travel through a gateway to other planets and fight against dangerous aliens to protect e...'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Stargate SG-1' AND g.libelle = 'Action';


-- Insertion du genre : Adventure
INSERT INTO genre (libelle) 
SELECT 'Adventure'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Adventure');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Stargate SG-1' AND g.libelle = 'Adventure';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Stargate SG-1' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 9 Primetime Emmys. 18 wins & 98 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 9 Primetime Emmys. 18 wins & 98 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Stargate SG-1' AND p.libelle = 'Nominated for 9 Primetime Emmys. 18 wins & 98 nominations total';


-- Insertion de la personne : Richard Dean Anderson
INSERT INTO personne (nom, prenom) 
SELECT 'Dean Anderson', 'Richard'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Dean Anderson' AND prenom = 'Richard'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Dean Anderson' 
  AND p.prenom = 'Richard'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Stargate SG-1' 
  AND p.nom = 'Dean Anderson' 
  AND p.prenom = 'Richard'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Michael Shanks
INSERT INTO personne (nom, prenom) 
SELECT 'Shanks', 'Michael'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Shanks' AND prenom = 'Michael'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Shanks' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Stargate SG-1' 
  AND p.nom = 'Shanks' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Amanda Tapping
INSERT INTO personne (nom, prenom) 
SELECT 'Tapping', 'Amanda'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Tapping' AND prenom = 'Amanda'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Tapping' 
  AND p.prenom = 'Amanda'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Stargate SG-1' 
  AND p.nom = 'Tapping' 
  AND p.prenom = 'Amanda'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jonathan Glassner
INSERT INTO personne (nom, prenom) 
SELECT 'Glassner', 'Jonathan'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Glassner' AND prenom = 'Jonathan'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Glassner' 
  AND p.prenom = 'Jonathan'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Stargate SG-1' 
  AND p.nom = 'Glassner' 
  AND p.prenom = 'Jonathan'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Brad Wright
INSERT INTO personne (nom, prenom) 
SELECT 'Wright', 'Brad'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Wright' AND prenom = 'Brad'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Wright' 
  AND p.prenom = 'Brad'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Stargate SG-1' 
  AND p.nom = 'Wright' 
  AND p.prenom = 'Brad'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Stargate Universe
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Stargate Universe',
    '02 Oct 2009',
    'Trapped on an Ancient spaceship billions of light-years from home, a group of soldiers and civilians struggle to survive and find their way back to Earth.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Stargate Universe' AND g.libelle = 'Drama';


-- Insertion du genre : Sci-Fi
INSERT INTO genre (libelle) 
SELECT 'Sci-Fi'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Sci-Fi');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Stargate Universe' AND g.libelle = 'Sci-Fi';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 3 Primetime Emmys. 9 wins & 29 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 3 Primetime Emmys. 9 wins & 29 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Stargate Universe' AND p.libelle = 'Nominated for 3 Primetime Emmys. 9 wins & 29 nominations total';


-- Insertion de la personne : Robert Carlyle
INSERT INTO personne (nom, prenom) 
SELECT 'Carlyle', 'Robert'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Carlyle' AND prenom = 'Robert'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Carlyle' 
  AND p.prenom = 'Robert'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Stargate Universe' 
  AND p.nom = 'Carlyle' 
  AND p.prenom = 'Robert'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Louis Ferreira
INSERT INTO personne (nom, prenom) 
SELECT 'Ferreira', 'Louis'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Ferreira' AND prenom = 'Louis'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Ferreira' 
  AND p.prenom = 'Louis'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Stargate Universe' 
  AND p.nom = 'Ferreira' 
  AND p.prenom = 'Louis'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Brian J. Smith
INSERT INTO personne (nom, prenom) 
SELECT 'J. Smith', 'Brian'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'J. Smith' AND prenom = 'Brian'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'J. Smith' 
  AND p.prenom = 'Brian'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Stargate Universe' 
  AND p.nom = 'J. Smith' 
  AND p.prenom = 'Brian'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Robert C. Cooper
INSERT INTO personne (nom, prenom) 
SELECT 'C. Cooper', 'Robert'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'C. Cooper' AND prenom = 'Robert'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'C. Cooper' 
  AND p.prenom = 'Robert'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Stargate Universe' 
  AND p.nom = 'C. Cooper' 
  AND p.prenom = 'Robert'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Brad Wright
INSERT INTO personne (nom, prenom) 
SELECT 'Wright', 'Brad'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Wright' AND prenom = 'Brad'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Wright' 
  AND p.prenom = 'Brad'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Stargate Universe' 
  AND p.nom = 'Wright' 
  AND p.prenom = 'Brad'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Supernatural
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Supernatural',
    '13 Sep 2005',
    'Two brothers follow their father''s footsteps as hunters, fighting evil supernatural beings of many kinds, including monsters, demons, and gods that roam the earth.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Supernatural' AND g.libelle = 'Drama';


-- Insertion du genre : Fantasy
INSERT INTO genre (libelle) 
SELECT 'Fantasy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Fantasy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Supernatural' AND g.libelle = 'Fantasy';


-- Insertion du genre : Horror
INSERT INTO genre (libelle) 
SELECT 'Horror'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Horror');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Supernatural' AND g.libelle = 'Horror';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 3 Primetime Emmys. 37 wins & 126 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 3 Primetime Emmys. 37 wins & 126 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Supernatural' AND p.libelle = 'Nominated for 3 Primetime Emmys. 37 wins & 126 nominations total';


-- Insertion de la personne : Jared Padalecki
INSERT INTO personne (nom, prenom) 
SELECT 'Padalecki', 'Jared'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Padalecki' AND prenom = 'Jared'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Padalecki' 
  AND p.prenom = 'Jared'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Supernatural' 
  AND p.nom = 'Padalecki' 
  AND p.prenom = 'Jared'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jensen Ackles
INSERT INTO personne (nom, prenom) 
SELECT 'Ackles', 'Jensen'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Ackles' AND prenom = 'Jensen'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Ackles' 
  AND p.prenom = 'Jensen'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Supernatural' 
  AND p.nom = 'Ackles' 
  AND p.prenom = 'Jensen'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jim Beaver
INSERT INTO personne (nom, prenom) 
SELECT 'Beaver', 'Jim'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Beaver' AND prenom = 'Jim'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Beaver' 
  AND p.prenom = 'Jim'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Supernatural' 
  AND p.nom = 'Beaver' 
  AND p.prenom = 'Jim'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Eric Kripke
INSERT INTO personne (nom, prenom) 
SELECT 'Kripke', 'Eric'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Kripke' AND prenom = 'Eric'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Kripke' 
  AND p.prenom = 'Eric'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Supernatural' 
  AND p.nom = 'Kripke' 
  AND p.prenom = 'Eric'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Swingtown
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Swingtown',
    '05 Jun 2008',
    'As America celebrates its 200th birthday, two generations of friends and neighbors in a Chicago suburb explore new freedoms and seek connections with each other in the midst of the socio/sexual revolution.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Swingtown' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '1 win & 1 nomination total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '1 win & 1 nomination total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Swingtown' AND p.libelle = '1 win & 1 nomination total';


-- Insertion de la personne : Molly Parker
INSERT INTO personne (nom, prenom) 
SELECT 'Parker', 'Molly'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Parker' AND prenom = 'Molly'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Parker' 
  AND p.prenom = 'Molly'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Swingtown' 
  AND p.nom = 'Parker' 
  AND p.prenom = 'Molly'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jack Davenport
INSERT INTO personne (nom, prenom) 
SELECT 'Davenport', 'Jack'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Davenport' AND prenom = 'Jack'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Davenport' 
  AND p.prenom = 'Jack'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Swingtown' 
  AND p.nom = 'Davenport' 
  AND p.prenom = 'Jack'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Grant Show
INSERT INTO personne (nom, prenom) 
SELECT 'Show', 'Grant'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Show' AND prenom = 'Grant'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Show' 
  AND p.prenom = 'Grant'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Swingtown' 
  AND p.nom = 'Show' 
  AND p.prenom = 'Grant'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Mike Kelley
INSERT INTO personne (nom, prenom) 
SELECT 'Kelley', 'Mike'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Kelley' AND prenom = 'Mike'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Kelley' 
  AND p.prenom = 'Mike'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Swingtown' 
  AND p.nom = 'Kelley' 
  AND p.prenom = 'Mike'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : The 4400
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'The 4400',
    '11 Jul 2004',
    'As the reappearance of 4,400 missing persons on a single day confounds the global community, federal agents on the case slowly discover the ways in which the victims have been changed.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The 4400' AND g.libelle = 'Drama';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The 4400' AND g.libelle = 'Mystery';


-- Insertion du genre : Sci-Fi
INSERT INTO genre (libelle) 
SELECT 'Sci-Fi'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Sci-Fi');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The 4400' AND g.libelle = 'Sci-Fi';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 3 Primetime Emmys. 1 win & 13 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 3 Primetime Emmys. 1 win & 13 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'The 4400' AND p.libelle = 'Nominated for 3 Primetime Emmys. 1 win & 13 nominations total';


-- Insertion de la personne : Jacqueline McKenzie
INSERT INTO personne (nom, prenom) 
SELECT 'McKenzie', 'Jacqueline'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'McKenzie' AND prenom = 'Jacqueline'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'McKenzie' 
  AND p.prenom = 'Jacqueline'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The 4400' 
  AND p.nom = 'McKenzie' 
  AND p.prenom = 'Jacqueline'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Joel Gretsch
INSERT INTO personne (nom, prenom) 
SELECT 'Gretsch', 'Joel'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Gretsch' AND prenom = 'Joel'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Gretsch' 
  AND p.prenom = 'Joel'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The 4400' 
  AND p.nom = 'Gretsch' 
  AND p.prenom = 'Joel'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Patrick John Flueger
INSERT INTO personne (nom, prenom) 
SELECT 'John Flueger', 'Patrick'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'John Flueger' AND prenom = 'Patrick'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'John Flueger' 
  AND p.prenom = 'Patrick'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The 4400' 
  AND p.nom = 'John Flueger' 
  AND p.prenom = 'Patrick'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : René Echevarria
INSERT INTO personne (nom, prenom) 
SELECT 'Echevarria', 'René'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Echevarria' AND prenom = 'René'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Echevarria' 
  AND p.prenom = 'René'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The 4400' 
  AND p.nom = 'Echevarria' 
  AND p.prenom = 'René'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Scott Peters
INSERT INTO personne (nom, prenom) 
SELECT 'Peters', 'Scott'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Peters' AND prenom = 'Scott'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Peters' 
  AND p.prenom = 'Scott'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The 4400' 
  AND p.nom = 'Peters' 
  AND p.prenom = 'Scott'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : The Big Bang Theory
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'The Big Bang Theory',
    '24 Sep 2007',
    'Aspiring film actress Penny moves into a Pasadena apartment across the hall from brilliant, but socially awkward, physicists Sheldon Cooper and Leonard Hofstadter and shows them how little they know about life outside of the lab.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Big Bang Theory' AND g.libelle = 'Comedy';


-- Insertion du genre : Romance
INSERT INTO genre (libelle) 
SELECT 'Romance'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Romance');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Big Bang Theory' AND g.libelle = 'Romance';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 10 Primetime Emmys. 79 wins & 257 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 10 Primetime Emmys. 79 wins & 257 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'The Big Bang Theory' AND p.libelle = 'Won 10 Primetime Emmys. 79 wins & 257 nominations total';


-- Insertion de la personne : Johnny Galecki
INSERT INTO personne (nom, prenom) 
SELECT 'Galecki', 'Johnny'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Galecki' AND prenom = 'Johnny'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Galecki' 
  AND p.prenom = 'Johnny'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Big Bang Theory' 
  AND p.nom = 'Galecki' 
  AND p.prenom = 'Johnny'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jim Parsons
INSERT INTO personne (nom, prenom) 
SELECT 'Parsons', 'Jim'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Parsons' AND prenom = 'Jim'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Parsons' 
  AND p.prenom = 'Jim'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Big Bang Theory' 
  AND p.nom = 'Parsons' 
  AND p.prenom = 'Jim'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Kaley Cuoco
INSERT INTO personne (nom, prenom) 
SELECT 'Cuoco', 'Kaley'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Cuoco' AND prenom = 'Kaley'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Cuoco' 
  AND p.prenom = 'Kaley'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Big Bang Theory' 
  AND p.nom = 'Cuoco' 
  AND p.prenom = 'Kaley'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Chuck Lorre
INSERT INTO personne (nom, prenom) 
SELECT 'Lorre', 'Chuck'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Lorre' AND prenom = 'Chuck'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Lorre' 
  AND p.prenom = 'Chuck'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Big Bang Theory' 
  AND p.nom = 'Lorre' 
  AND p.prenom = 'Chuck'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Bill Prady
INSERT INTO personne (nom, prenom) 
SELECT 'Prady', 'Bill'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Prady' AND prenom = 'Bill'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Prady' 
  AND p.prenom = 'Bill'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Big Bang Theory' 
  AND p.nom = 'Prady' 
  AND p.prenom = 'Bill'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : The Black Donnellys
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'The Black Donnellys',
    '26 Feb 2007',
    'Four young Irish brothers are caught up in New York''s underworld of organized crime.'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Black Donnellys' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Black Donnellys' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '2 nominations'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '2 nominations');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'The Black Donnellys' AND p.libelle = '2 nominations';


-- Insertion de la personne : Jonathan Tucker
INSERT INTO personne (nom, prenom) 
SELECT 'Tucker', 'Jonathan'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Tucker' AND prenom = 'Jonathan'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Tucker' 
  AND p.prenom = 'Jonathan'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Black Donnellys' 
  AND p.nom = 'Tucker' 
  AND p.prenom = 'Jonathan'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Tom Guiry
INSERT INTO personne (nom, prenom) 
SELECT 'Guiry', 'Tom'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Guiry' AND prenom = 'Tom'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Guiry' 
  AND p.prenom = 'Tom'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Black Donnellys' 
  AND p.nom = 'Guiry' 
  AND p.prenom = 'Tom'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Olivia Wilde
INSERT INTO personne (nom, prenom) 
SELECT 'Wilde', 'Olivia'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Wilde' AND prenom = 'Olivia'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Wilde' 
  AND p.prenom = 'Olivia'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Black Donnellys' 
  AND p.nom = 'Wilde' 
  AND p.prenom = 'Olivia'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Paul Haggis
INSERT INTO personne (nom, prenom) 
SELECT 'Haggis', 'Paul'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Haggis' AND prenom = 'Paul'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Haggis' 
  AND p.prenom = 'Paul'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Black Donnellys' 
  AND p.nom = 'Haggis' 
  AND p.prenom = 'Paul'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Bobby Moresco
INSERT INTO personne (nom, prenom) 
SELECT 'Moresco', 'Bobby'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Moresco' AND prenom = 'Bobby'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Moresco' 
  AND p.prenom = 'Bobby'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Black Donnellys' 
  AND p.nom = 'Moresco' 
  AND p.prenom = 'Bobby'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : The Kill Point
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'The Kill Point',
    '22 Jul 2007',
    'A group of military veterans, who recently returned home from serving in Iraq, band together to pull off a major bank heist.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Kill Point' AND g.libelle = 'Action';


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Kill Point' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Kill Point' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '1 win & 3 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '1 win & 3 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'The Kill Point' AND p.libelle = '1 win & 3 nominations total';


-- Insertion de la personne : Steve Cirbus
INSERT INTO personne (nom, prenom) 
SELECT 'Cirbus', 'Steve'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Cirbus' AND prenom = 'Steve'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Cirbus' 
  AND p.prenom = 'Steve'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Kill Point' 
  AND p.nom = 'Cirbus' 
  AND p.prenom = 'Steve'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Donnie Wahlberg
INSERT INTO personne (nom, prenom) 
SELECT 'Wahlberg', 'Donnie'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Wahlberg' AND prenom = 'Donnie'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Wahlberg' 
  AND p.prenom = 'Donnie'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Kill Point' 
  AND p.nom = 'Wahlberg' 
  AND p.prenom = 'Donnie'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Michael Hyatt
INSERT INTO personne (nom, prenom) 
SELECT 'Hyatt', 'Michael'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hyatt' AND prenom = 'Michael'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Hyatt' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Kill Point' 
  AND p.nom = 'Hyatt' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : James DeMonaco
INSERT INTO personne (nom, prenom) 
SELECT 'DeMonaco', 'James'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'DeMonaco' AND prenom = 'James'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'DeMonaco' 
  AND p.prenom = 'James'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Kill Point' 
  AND p.nom = 'DeMonaco' 
  AND p.prenom = 'James'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : The Lost Room
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'The Lost Room',
    '11 Dec 2006',
    'A detective investigates a mysterious motel room which acts as a portal to anywhere in the world.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Lost Room' AND g.libelle = 'Action';


-- Insertion du genre : Fantasy
INSERT INTO genre (libelle) 
SELECT 'Fantasy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Fantasy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Lost Room' AND g.libelle = 'Fantasy';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Lost Room' AND g.libelle = 'Mystery';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 2 Primetime Emmys. 13 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 2 Primetime Emmys. 13 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'The Lost Room' AND p.libelle = 'Nominated for 2 Primetime Emmys. 13 nominations total';


-- Insertion de la personne : Peter Krause
INSERT INTO personne (nom, prenom) 
SELECT 'Krause', 'Peter'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Krause' AND prenom = 'Peter'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Krause' 
  AND p.prenom = 'Peter'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Lost Room' 
  AND p.nom = 'Krause' 
  AND p.prenom = 'Peter'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Julianna Margulies
INSERT INTO personne (nom, prenom) 
SELECT 'Margulies', 'Julianna'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Margulies' AND prenom = 'Julianna'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Margulies' 
  AND p.prenom = 'Julianna'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Lost Room' 
  AND p.nom = 'Margulies' 
  AND p.prenom = 'Julianna'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Peter Jacobson
INSERT INTO personne (nom, prenom) 
SELECT 'Jacobson', 'Peter'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Jacobson' AND prenom = 'Peter'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Jacobson' 
  AND p.prenom = 'Peter'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Lost Room' 
  AND p.nom = 'Jacobson' 
  AND p.prenom = 'Peter'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : The Mentalist
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'The Mentalist',
    '23 Sep 2008',
    'Famous "psychic", Patrick Jane, outs himself as a fake, and using his heightened observational skills and impeccable knowledge of the human psyche, he works with the police so he can find "Red John", the madman who killed his family.'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Mentalist' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Mentalist' AND g.libelle = 'Drama';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Mentalist' AND g.libelle = 'Mystery';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 1 Primetime Emmy. 4 wins & 16 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 1 Primetime Emmy. 4 wins & 16 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'The Mentalist' AND p.libelle = 'Nominated for 1 Primetime Emmy. 4 wins & 16 nominations total';


-- Insertion de la personne : Simon Baker
INSERT INTO personne (nom, prenom) 
SELECT 'Baker', 'Simon'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Baker' AND prenom = 'Simon'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Baker' 
  AND p.prenom = 'Simon'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Mentalist' 
  AND p.nom = 'Baker' 
  AND p.prenom = 'Simon'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Robin Tunney
INSERT INTO personne (nom, prenom) 
SELECT 'Tunney', 'Robin'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Tunney' AND prenom = 'Robin'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Tunney' 
  AND p.prenom = 'Robin'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Mentalist' 
  AND p.nom = 'Tunney' 
  AND p.prenom = 'Robin'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Tim Kang
INSERT INTO personne (nom, prenom) 
SELECT 'Kang', 'Tim'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Kang' AND prenom = 'Tim'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Kang' 
  AND p.prenom = 'Tim'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Mentalist' 
  AND p.nom = 'Kang' 
  AND p.prenom = 'Tim'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Bruno Heller
INSERT INTO personne (nom, prenom) 
SELECT 'Heller', 'Bruno'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Heller' AND prenom = 'Bruno'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Heller' 
  AND p.prenom = 'Bruno'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Mentalist' 
  AND p.nom = 'Heller' 
  AND p.prenom = 'Bruno'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : The Nine
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'The Nine',
    '04 Oct 2006',
    'Nine surviving hostages from a spectacular bank hold-up meet regularly. The memories keep haunting them, in flashbacks that slowly reveal the story. Two surviving perpetrators in jail, who are brothers, and the police, including s...'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Nine' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Nine' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '1 nomination'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '1 nomination');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'The Nine' AND p.libelle = '1 nomination';


-- Insertion de la personne : Lourdes Benedicto
INSERT INTO personne (nom, prenom) 
SELECT 'Benedicto', 'Lourdes'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Benedicto' AND prenom = 'Lourdes'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Benedicto' 
  AND p.prenom = 'Lourdes'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Nine' 
  AND p.nom = 'Benedicto' 
  AND p.prenom = 'Lourdes'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : John Billingsley
INSERT INTO personne (nom, prenom) 
SELECT 'Billingsley', 'John'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Billingsley' AND prenom = 'John'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Billingsley' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Nine' 
  AND p.nom = 'Billingsley' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jessica Ann Collins
INSERT INTO personne (nom, prenom) 
SELECT 'Ann Collins', 'Jessica'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Ann Collins' AND prenom = 'Jessica'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Ann Collins' 
  AND p.prenom = 'Jessica'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Nine' 
  AND p.nom = 'Ann Collins' 
  AND p.prenom = 'Jessica'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Hank Steinberg
INSERT INTO personne (nom, prenom) 
SELECT 'Steinberg', 'Hank'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Steinberg' AND prenom = 'Hank'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Steinberg' 
  AND p.prenom = 'Hank'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Nine' 
  AND p.nom = 'Steinberg' 
  AND p.prenom = 'Hank'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : K.J. Steinberg
INSERT INTO personne (nom, prenom) 
SELECT 'Steinberg', 'K.J.'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Steinberg' AND prenom = 'K.J.'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Steinberg' 
  AND p.prenom = 'K.J.'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Nine' 
  AND p.nom = 'Steinberg' 
  AND p.prenom = 'K.J.'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Selling the OC
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Selling the OC',
    '24 Aug 2022',
    'Jason Oppenheim, owner of the Oppenheim Group, expands the company opening a second office in Newport Beach.'
);


-- Insertion du genre : Reality-TV
INSERT INTO genre (libelle) 
SELECT 'Reality-TV'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Reality-TV');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Selling the OC' AND g.libelle = 'Reality-TV';


-- Insertion de la personne : Alexandra Hall
INSERT INTO personne (nom, prenom) 
SELECT 'Hall', 'Alexandra'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hall' AND prenom = 'Alexandra'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Hall' 
  AND p.prenom = 'Alexandra'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Selling the OC' 
  AND p.nom = 'Hall' 
  AND p.prenom = 'Alexandra'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Gio Helou
INSERT INTO personne (nom, prenom) 
SELECT 'Helou', 'Gio'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Helou' AND prenom = 'Gio'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Helou' 
  AND p.prenom = 'Gio'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Selling the OC' 
  AND p.nom = 'Helou' 
  AND p.prenom = 'Gio'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Kayla Cardona
INSERT INTO personne (nom, prenom) 
SELECT 'Cardona', 'Kayla'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Cardona' AND prenom = 'Kayla'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Cardona' 
  AND p.prenom = 'Kayla'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Selling the OC' 
  AND p.nom = 'Cardona' 
  AND p.prenom = 'Kayla'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : The Pretender
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'The Pretender',
    '19 Sep 1996',
    'A specially gifted man, with the ability to instantly master any skill, escapes from a secret testing facility and travels the country taking on different jobs and helping strangers while hiding from his kidnappers.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Pretender' AND g.libelle = 'Action';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Pretender' AND g.libelle = 'Drama';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Pretender' AND g.libelle = 'Mystery';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 2 Primetime Emmys. 5 wins & 18 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 2 Primetime Emmys. 5 wins & 18 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'The Pretender' AND p.libelle = 'Nominated for 2 Primetime Emmys. 5 wins & 18 nominations total';


-- Insertion de la personne : Michael T. Weiss
INSERT INTO personne (nom, prenom) 
SELECT 'T. Weiss', 'Michael'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'T. Weiss' AND prenom = 'Michael'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'T. Weiss' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Pretender' 
  AND p.nom = 'T. Weiss' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Andrea Parker
INSERT INTO personne (nom, prenom) 
SELECT 'Parker', 'Andrea'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Parker' AND prenom = 'Andrea'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Parker' 
  AND p.prenom = 'Andrea'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Pretender' 
  AND p.nom = 'Parker' 
  AND p.prenom = 'Andrea'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Patrick Bauchau
INSERT INTO personne (nom, prenom) 
SELECT 'Bauchau', 'Patrick'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Bauchau' AND prenom = 'Patrick'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Bauchau' 
  AND p.prenom = 'Patrick'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Pretender' 
  AND p.nom = 'Bauchau' 
  AND p.prenom = 'Patrick'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Steven Long Mitchell
INSERT INTO personne (nom, prenom) 
SELECT 'Long Mitchell', 'Steven'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Long Mitchell' AND prenom = 'Steven'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Long Mitchell' 
  AND p.prenom = 'Steven'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Pretender' 
  AND p.nom = 'Long Mitchell' 
  AND p.prenom = 'Steven'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Craig W. Van Sickle
INSERT INTO personne (nom, prenom) 
SELECT 'W. Van Sickle', 'Craig'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'W. Van Sickle' AND prenom = 'Craig'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'W. Van Sickle' 
  AND p.prenom = 'Craig'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Pretender' 
  AND p.nom = 'W. Van Sickle' 
  AND p.prenom = 'Craig'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : The Riches
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'The Riches',
    '12 Mar 2007',
    'A family of crooks assume the identity of an upper-middle-class suburban clan in the Deep South.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Riches' AND g.libelle = 'Comedy';


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Riches' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Riches' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 1 Primetime Emmy. 1 win & 11 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 1 Primetime Emmy. 1 win & 11 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'The Riches' AND p.libelle = 'Nominated for 1 Primetime Emmy. 1 win & 11 nominations total';


-- Insertion de la personne : Eddie Izzard
INSERT INTO personne (nom, prenom) 
SELECT 'Izzard', 'Eddie'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Izzard' AND prenom = 'Eddie'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Izzard' 
  AND p.prenom = 'Eddie'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Riches' 
  AND p.nom = 'Izzard' 
  AND p.prenom = 'Eddie'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Minnie Driver
INSERT INTO personne (nom, prenom) 
SELECT 'Driver', 'Minnie'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Driver' AND prenom = 'Minnie'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Driver' 
  AND p.prenom = 'Minnie'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Riches' 
  AND p.nom = 'Driver' 
  AND p.prenom = 'Minnie'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Shannon Woodward
INSERT INTO personne (nom, prenom) 
SELECT 'Woodward', 'Shannon'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Woodward' AND prenom = 'Shannon'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Woodward' 
  AND p.prenom = 'Shannon'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Riches' 
  AND p.nom = 'Woodward' 
  AND p.prenom = 'Shannon'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Dmitry Lipkin
INSERT INTO personne (nom, prenom) 
SELECT 'Lipkin', 'Dmitry'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Lipkin' AND prenom = 'Dmitry'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Lipkin' 
  AND p.prenom = 'Dmitry'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Riches' 
  AND p.nom = 'Lipkin' 
  AND p.prenom = 'Dmitry'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Terminator: The Sarah Connor Chronicles
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Terminator: The Sarah Connor Chronicles',
    '13 Jan 2008',
    'Set after the events in Terminator 2: Judgment Day (1991), Sarah Connor and her son, John, try to stay under-the-radar from the government, as they plot to destroy the computer network Skynet in hopes of preventing Armageddon.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Terminator: The Sarah Connor Chronicles' AND g.libelle = 'Action';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Terminator: The Sarah Connor Chronicles' AND g.libelle = 'Drama';


-- Insertion du genre : Fantasy
INSERT INTO genre (libelle) 
SELECT 'Fantasy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Fantasy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Terminator: The Sarah Connor Chronicles' AND g.libelle = 'Fantasy';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 4 Primetime Emmys. 3 wins & 26 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 4 Primetime Emmys. 3 wins & 26 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Terminator: The Sarah Connor Chronicles' AND p.libelle = 'Nominated for 4 Primetime Emmys. 3 wins & 26 nominations total';


-- Insertion de la personne : Lena Headey
INSERT INTO personne (nom, prenom) 
SELECT 'Headey', 'Lena'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Headey' AND prenom = 'Lena'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Headey' 
  AND p.prenom = 'Lena'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Terminator: The Sarah Connor Chronicles' 
  AND p.nom = 'Headey' 
  AND p.prenom = 'Lena'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Thomas Dekker
INSERT INTO personne (nom, prenom) 
SELECT 'Dekker', 'Thomas'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Dekker' AND prenom = 'Thomas'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Dekker' 
  AND p.prenom = 'Thomas'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Terminator: The Sarah Connor Chronicles' 
  AND p.nom = 'Dekker' 
  AND p.prenom = 'Thomas'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Summer Glau
INSERT INTO personne (nom, prenom) 
SELECT 'Glau', 'Summer'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Glau' AND prenom = 'Summer'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Glau' 
  AND p.prenom = 'Summer'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Terminator: The Sarah Connor Chronicles' 
  AND p.nom = 'Glau' 
  AND p.prenom = 'Summer'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Josh Friedman
INSERT INTO personne (nom, prenom) 
SELECT 'Friedman', 'Josh'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Friedman' AND prenom = 'Josh'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Friedman' 
  AND p.prenom = 'Josh'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Terminator: The Sarah Connor Chronicles' 
  AND p.nom = 'Friedman' 
  AND p.prenom = 'Josh'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : The Shield
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'The Shield',
    '12 Mar 2002',
    'A gang of corrupt Los Angeles Police Department cops uses illegal methods to maintain law and order, whilst engaging in a series of undercover dealings secretly in order to get rich.'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Shield' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Shield' AND g.libelle = 'Drama';


-- Insertion du genre : Thriller
INSERT INTO genre (libelle) 
SELECT 'Thriller'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Thriller');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Shield' AND g.libelle = 'Thriller';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 1 Primetime Emmy. 15 wins & 62 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 1 Primetime Emmy. 15 wins & 62 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'The Shield' AND p.libelle = 'Won 1 Primetime Emmy. 15 wins & 62 nominations total';


-- Insertion de la personne : Michael Chiklis
INSERT INTO personne (nom, prenom) 
SELECT 'Chiklis', 'Michael'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Chiklis' AND prenom = 'Michael'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Chiklis' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Shield' 
  AND p.nom = 'Chiklis' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Michael Jace
INSERT INTO personne (nom, prenom) 
SELECT 'Jace', 'Michael'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Jace' AND prenom = 'Michael'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Jace' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Shield' 
  AND p.nom = 'Jace' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jay Karnes
INSERT INTO personne (nom, prenom) 
SELECT 'Karnes', 'Jay'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Karnes' AND prenom = 'Jay'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Karnes' 
  AND p.prenom = 'Jay'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Shield' 
  AND p.nom = 'Karnes' 
  AND p.prenom = 'Jay'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Shawn Ryan
INSERT INTO personne (nom, prenom) 
SELECT 'Ryan', 'Shawn'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Ryan' AND prenom = 'Shawn'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Ryan' 
  AND p.prenom = 'Shawn'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Shield' 
  AND p.nom = 'Ryan' 
  AND p.prenom = 'Shawn'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : The Sopranos
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'The Sopranos',
    '10 Jan 1999',
    'New Jersey mob boss Tony Soprano deals with personal and professional issues in his home and business life that affect his mental state, leading him to seek professional psychiatric counseling.'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Sopranos' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Sopranos' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 21 Primetime Emmys. 127 wins & 312 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 21 Primetime Emmys. 127 wins & 312 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'The Sopranos' AND p.libelle = 'Won 21 Primetime Emmys. 127 wins & 312 nominations total';


-- Insertion de la personne : James Gandolfini
INSERT INTO personne (nom, prenom) 
SELECT 'Gandolfini', 'James'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Gandolfini' AND prenom = 'James'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Gandolfini' 
  AND p.prenom = 'James'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Sopranos' 
  AND p.nom = 'Gandolfini' 
  AND p.prenom = 'James'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Lorraine Bracco
INSERT INTO personne (nom, prenom) 
SELECT 'Bracco', 'Lorraine'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Bracco' AND prenom = 'Lorraine'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Bracco' 
  AND p.prenom = 'Lorraine'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Sopranos' 
  AND p.nom = 'Bracco' 
  AND p.prenom = 'Lorraine'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Edie Falco
INSERT INTO personne (nom, prenom) 
SELECT 'Falco', 'Edie'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Falco' AND prenom = 'Edie'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Falco' 
  AND p.prenom = 'Edie'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Sopranos' 
  AND p.nom = 'Falco' 
  AND p.prenom = 'Edie'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : David Chase
INSERT INTO personne (nom, prenom) 
SELECT 'Chase', 'David'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Chase' AND prenom = 'David'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Chase' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Sopranos' 
  AND p.nom = 'Chase' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : The Tudors
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'The Tudors',
    '01 Apr 2007',
    'Epic series reveals the scandalous life of a young king whose affairs and obsession with producing a male heir changed marriage, the church, and the world.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Tudors' AND g.libelle = 'Drama';


-- Insertion du genre : History
INSERT INTO genre (libelle) 
SELECT 'History'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'History');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Tudors' AND g.libelle = 'History';


-- Insertion du genre : Romance
INSERT INTO genre (libelle) 
SELECT 'Romance'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Romance');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Tudors' AND g.libelle = 'Romance';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 6 Primetime Emmys. 49 wins & 82 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 6 Primetime Emmys. 49 wins & 82 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'The Tudors' AND p.libelle = 'Won 6 Primetime Emmys. 49 wins & 82 nominations total';


-- Insertion de la personne : Jonathan Rhys Meyers
INSERT INTO personne (nom, prenom) 
SELECT 'Rhys Meyers', 'Jonathan'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Rhys Meyers' AND prenom = 'Jonathan'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Rhys Meyers' 
  AND p.prenom = 'Jonathan'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Tudors' 
  AND p.nom = 'Rhys Meyers' 
  AND p.prenom = 'Jonathan'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Henry Cavill
INSERT INTO personne (nom, prenom) 
SELECT 'Cavill', 'Henry'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Cavill' AND prenom = 'Henry'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Cavill' 
  AND p.prenom = 'Henry'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Tudors' 
  AND p.nom = 'Cavill' 
  AND p.prenom = 'Henry'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Anthony Brophy
INSERT INTO personne (nom, prenom) 
SELECT 'Brophy', 'Anthony'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Brophy' AND prenom = 'Anthony'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Brophy' 
  AND p.prenom = 'Anthony'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Tudors' 
  AND p.nom = 'Brophy' 
  AND p.prenom = 'Anthony'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Michael Hirst
INSERT INTO personne (nom, prenom) 
SELECT 'Hirst', 'Michael'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Hirst' AND prenom = 'Michael'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Hirst' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Tudors' 
  AND p.nom = 'Hirst' 
  AND p.prenom = 'Michael'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : The Vampire Diaries
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'The Vampire Diaries',
    '10 Sep 2009',
    'The lives, loves, dangers and disasters in the town, Mystic Falls, Virginia. Creatures of unspeakable horror lurk beneath this town as a teenage girl is suddenly torn between two vampire brothers.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Vampire Diaries' AND g.libelle = 'Drama';


-- Insertion du genre : Fantasy
INSERT INTO genre (libelle) 
SELECT 'Fantasy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Fantasy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Vampire Diaries' AND g.libelle = 'Fantasy';


-- Insertion du genre : Horror
INSERT INTO genre (libelle) 
SELECT 'Horror'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Horror');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Vampire Diaries' AND g.libelle = 'Horror';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '39 wins & 67 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '39 wins & 67 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'The Vampire Diaries' AND p.libelle = '39 wins & 67 nominations total';


-- Insertion de la personne : Nina Dobrev
INSERT INTO personne (nom, prenom) 
SELECT 'Dobrev', 'Nina'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Dobrev' AND prenom = 'Nina'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Dobrev' 
  AND p.prenom = 'Nina'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Vampire Diaries' 
  AND p.nom = 'Dobrev' 
  AND p.prenom = 'Nina'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Paul Wesley
INSERT INTO personne (nom, prenom) 
SELECT 'Wesley', 'Paul'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Wesley' AND prenom = 'Paul'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Wesley' 
  AND p.prenom = 'Paul'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Vampire Diaries' 
  AND p.nom = 'Wesley' 
  AND p.prenom = 'Paul'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Ian Somerhalder
INSERT INTO personne (nom, prenom) 
SELECT 'Somerhalder', 'Ian'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Somerhalder' AND prenom = 'Ian'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Somerhalder' 
  AND p.prenom = 'Ian'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Vampire Diaries' 
  AND p.nom = 'Somerhalder' 
  AND p.prenom = 'Ian'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Julie Plec
INSERT INTO personne (nom, prenom) 
SELECT 'Plec', 'Julie'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Plec' AND prenom = 'Julie'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Plec' 
  AND p.prenom = 'Julie'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Vampire Diaries' 
  AND p.nom = 'Plec' 
  AND p.prenom = 'Julie'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Kevin Williamson
INSERT INTO personne (nom, prenom) 
SELECT 'Williamson', 'Kevin'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Williamson' AND prenom = 'Kevin'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Williamson' 
  AND p.prenom = 'Kevin'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Vampire Diaries' 
  AND p.nom = 'Williamson' 
  AND p.prenom = 'Kevin'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : The Wire
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'The Wire',
    '02 Jun 2002',
    'The Baltimore drug scene, as seen through the eyes of drug dealers and law enforcement.'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Wire' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Wire' AND g.libelle = 'Drama';


-- Insertion du genre : Thriller
INSERT INTO genre (libelle) 
SELECT 'Thriller'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Thriller');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'The Wire' AND g.libelle = 'Thriller';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 2 Primetime Emmys. 16 wins & 59 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 2 Primetime Emmys. 16 wins & 59 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'The Wire' AND p.libelle = 'Nominated for 2 Primetime Emmys. 16 wins & 59 nominations total';


-- Insertion de la personne : Dominic West
INSERT INTO personne (nom, prenom) 
SELECT 'West', 'Dominic'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'West' AND prenom = 'Dominic'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'West' 
  AND p.prenom = 'Dominic'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Wire' 
  AND p.nom = 'West' 
  AND p.prenom = 'Dominic'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Lance Reddick
INSERT INTO personne (nom, prenom) 
SELECT 'Reddick', 'Lance'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Reddick' AND prenom = 'Lance'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Reddick' 
  AND p.prenom = 'Lance'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Wire' 
  AND p.nom = 'Reddick' 
  AND p.prenom = 'Lance'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Sonja Sohn
INSERT INTO personne (nom, prenom) 
SELECT 'Sohn', 'Sonja'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Sohn' AND prenom = 'Sonja'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Sohn' 
  AND p.prenom = 'Sonja'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Wire' 
  AND p.nom = 'Sohn' 
  AND p.prenom = 'Sonja'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : David Simon
INSERT INTO personne (nom, prenom) 
SELECT 'Simon', 'David'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Simon' AND prenom = 'David'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Simon' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'The Wire' 
  AND p.nom = 'Simon' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Torchwood
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Torchwood',
    '22 Oct 2006',
    'The members of the Torchwood Institute, a secret organization founded by the British Crown, fight to protect the Earth from extraterrestrial and supernatural threats.'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Torchwood' AND g.libelle = 'Action';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Torchwood' AND g.libelle = 'Drama';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Torchwood' AND g.libelle = 'Mystery';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '11 wins & 47 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '11 wins & 47 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Torchwood' AND p.libelle = '11 wins & 47 nominations total';


-- Insertion de la personne : John Barrowman
INSERT INTO personne (nom, prenom) 
SELECT 'Barrowman', 'John'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Barrowman' AND prenom = 'John'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Barrowman' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Torchwood' 
  AND p.nom = 'Barrowman' 
  AND p.prenom = 'John'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Eve Myles
INSERT INTO personne (nom, prenom) 
SELECT 'Myles', 'Eve'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Myles' AND prenom = 'Eve'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Myles' 
  AND p.prenom = 'Eve'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Torchwood' 
  AND p.nom = 'Myles' 
  AND p.prenom = 'Eve'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Kai Owen
INSERT INTO personne (nom, prenom) 
SELECT 'Owen', 'Kai'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Owen' AND prenom = 'Kai'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Owen' 
  AND p.prenom = 'Kai'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Torchwood' 
  AND p.nom = 'Owen' 
  AND p.prenom = 'Kai'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Russell T. Davies
INSERT INTO personne (nom, prenom) 
SELECT 'T. Davies', 'Russell'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'T. Davies' AND prenom = 'Russell'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'T. Davies' 
  AND p.prenom = 'Russell'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Torchwood' 
  AND p.nom = 'T. Davies' 
  AND p.prenom = 'Russell'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Traveler
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Traveler',
    '10 May 2007',
    'Jay and Tyler are hunted by the FBI after the bombing of a museum. Their only lead is their best friend, Will Traveler, who disappeared. What part did he play in this nightmare of violence, death and conspiracies. Who is Will Trav...'
);


-- Insertion du genre : Action
INSERT INTO genre (libelle) 
SELECT 'Action'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Action');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Traveler' AND g.libelle = 'Action';


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Traveler' AND g.libelle = 'Crime';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Traveler' AND g.libelle = 'Mystery';


-- Insertion de la personne : Matt Bomer
INSERT INTO personne (nom, prenom) 
SELECT 'Bomer', 'Matt'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Bomer' AND prenom = 'Matt'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Bomer' 
  AND p.prenom = 'Matt'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Traveler' 
  AND p.nom = 'Bomer' 
  AND p.prenom = 'Matt'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Logan Marshall-Green
INSERT INTO personne (nom, prenom) 
SELECT 'Marshall-Green', 'Logan'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Marshall-Green' AND prenom = 'Logan'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Marshall-Green' 
  AND p.prenom = 'Logan'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Traveler' 
  AND p.nom = 'Marshall-Green' 
  AND p.prenom = 'Logan'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Aaron Stanford
INSERT INTO personne (nom, prenom) 
SELECT 'Stanford', 'Aaron'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Stanford' AND prenom = 'Aaron'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Stanford' 
  AND p.prenom = 'Aaron'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Traveler' 
  AND p.nom = 'Stanford' 
  AND p.prenom = 'Aaron'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : David DiGilio
INSERT INTO personne (nom, prenom) 
SELECT 'DiGilio', 'David'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'DiGilio' AND prenom = 'David'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'DiGilio' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Traveler' 
  AND p.nom = 'DiGilio' 
  AND p.prenom = 'David'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Tru Calling
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Tru Calling',
    '30 Oct 2003',
    'A university graduate working in the city morgue is able to repeat the same day over again to prevent murders or other disasters.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Tru Calling' AND g.libelle = 'Drama';


-- Insertion du genre : Fantasy
INSERT INTO genre (libelle) 
SELECT 'Fantasy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Fantasy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Tru Calling' AND g.libelle = 'Fantasy';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Tru Calling' AND g.libelle = 'Mystery';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '3 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '3 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Tru Calling' AND p.libelle = '3 nominations total';


-- Insertion de la personne : Eliza Dushku
INSERT INTO personne (nom, prenom) 
SELECT 'Dushku', 'Eliza'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Dushku' AND prenom = 'Eliza'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Dushku' 
  AND p.prenom = 'Eliza'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Tru Calling' 
  AND p.nom = 'Dushku' 
  AND p.prenom = 'Eliza'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Shawn Reaves
INSERT INTO personne (nom, prenom) 
SELECT 'Reaves', 'Shawn'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Reaves' AND prenom = 'Shawn'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Reaves' 
  AND p.prenom = 'Shawn'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Tru Calling' 
  AND p.nom = 'Reaves' 
  AND p.prenom = 'Shawn'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Zach Galifianakis
INSERT INTO personne (nom, prenom) 
SELECT 'Galifianakis', 'Zach'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Galifianakis' AND prenom = 'Zach'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Galifianakis' 
  AND p.prenom = 'Zach'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Tru Calling' 
  AND p.nom = 'Galifianakis' 
  AND p.prenom = 'Zach'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jon Harmon Feldman
INSERT INTO personne (nom, prenom) 
SELECT 'Harmon Feldman', 'Jon'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Harmon Feldman' AND prenom = 'Jon'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Harmon Feldman' 
  AND p.prenom = 'Jon'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Tru Calling' 
  AND p.nom = 'Harmon Feldman' 
  AND p.prenom = 'Jon'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : True Blood
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'True Blood',
    '07 Sep 2008',
    'Telepathic waitress Sookie Stackhouse encounters a strange new supernatural world when she meets the mysterious Bill Compton, a southern Louisiana gentleman and vampire.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'True Blood' AND g.libelle = 'Drama';


-- Insertion du genre : Fantasy
INSERT INTO genre (libelle) 
SELECT 'Fantasy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Fantasy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'True Blood' AND g.libelle = 'Fantasy';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'True Blood' AND g.libelle = 'Mystery';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 1 Primetime Emmy. 39 wins & 160 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 1 Primetime Emmy. 39 wins & 160 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'True Blood' AND p.libelle = 'Won 1 Primetime Emmy. 39 wins & 160 nominations total';


-- Insertion de la personne : Anna Paquin
INSERT INTO personne (nom, prenom) 
SELECT 'Paquin', 'Anna'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Paquin' AND prenom = 'Anna'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Paquin' 
  AND p.prenom = 'Anna'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'True Blood' 
  AND p.nom = 'Paquin' 
  AND p.prenom = 'Anna'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Stephen Moyer
INSERT INTO personne (nom, prenom) 
SELECT 'Moyer', 'Stephen'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Moyer' AND prenom = 'Stephen'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Moyer' 
  AND p.prenom = 'Stephen'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'True Blood' 
  AND p.nom = 'Moyer' 
  AND p.prenom = 'Stephen'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Sam Trammell
INSERT INTO personne (nom, prenom) 
SELECT 'Trammell', 'Sam'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Trammell' AND prenom = 'Sam'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Trammell' 
  AND p.prenom = 'Sam'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'True Blood' 
  AND p.nom = 'Trammell' 
  AND p.prenom = 'Sam'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Alan Ball
INSERT INTO personne (nom, prenom) 
SELECT 'Ball', 'Alan'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Ball' AND prenom = 'Alan'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Ball' 
  AND p.prenom = 'Alan'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'True Blood' 
  AND p.nom = 'Ball' 
  AND p.prenom = 'Alan'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Ugly Betty
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Ugly Betty',
    '28 Sep 2006',
    'Smart but wholesome Betty embraces her unique appearance and independent attitude in the cutthroat world of New York fashion.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Ugly Betty' AND g.libelle = 'Comedy';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Ugly Betty' AND g.libelle = 'Drama';


-- Insertion du genre : Romance
INSERT INTO genre (libelle) 
SELECT 'Romance'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Romance');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Ugly Betty' AND g.libelle = 'Romance';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 3 Primetime Emmys. 52 wins & 124 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 3 Primetime Emmys. 52 wins & 124 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Ugly Betty' AND p.libelle = 'Won 3 Primetime Emmys. 52 wins & 124 nominations total';


-- Insertion de la personne : America Ferrera
INSERT INTO personne (nom, prenom) 
SELECT 'Ferrera', 'America'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Ferrera' AND prenom = 'America'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Ferrera' 
  AND p.prenom = 'America'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Ugly Betty' 
  AND p.nom = 'Ferrera' 
  AND p.prenom = 'America'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Eric Mabius
INSERT INTO personne (nom, prenom) 
SELECT 'Mabius', 'Eric'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Mabius' AND prenom = 'Eric'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Mabius' 
  AND p.prenom = 'Eric'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Ugly Betty' 
  AND p.nom = 'Mabius' 
  AND p.prenom = 'Eric'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Tony Plana
INSERT INTO personne (nom, prenom) 
SELECT 'Plana', 'Tony'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Plana' AND prenom = 'Tony'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Plana' 
  AND p.prenom = 'Tony'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Ugly Betty' 
  AND p.nom = 'Plana' 
  AND p.prenom = 'Tony'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Fernando Gaitán
INSERT INTO personne (nom, prenom) 
SELECT 'Gaitán', 'Fernando'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Gaitán' AND prenom = 'Fernando'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Gaitán' 
  AND p.prenom = 'Fernando'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Ugly Betty' 
  AND p.nom = 'Gaitán' 
  AND p.prenom = 'Fernando'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Silvio Horta
INSERT INTO personne (nom, prenom) 
SELECT 'Horta', 'Silvio'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Horta' AND prenom = 'Silvio'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Horta' 
  AND p.prenom = 'Silvio'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Ugly Betty' 
  AND p.nom = 'Horta' 
  AND p.prenom = 'Silvio'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Veronica Mars
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Veronica Mars',
    '22 Sep 2004',
    'After her best friend is murdered, and her father is removed as county sheriff, Veronica Mars dedicates her life to cracking the toughest mysteries in the affluent town of Neptune.'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Veronica Mars' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Veronica Mars' AND g.libelle = 'Drama';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Veronica Mars' AND g.libelle = 'Mystery';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '6 wins & 20 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '6 wins & 20 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Veronica Mars' AND p.libelle = '6 wins & 20 nominations total';


-- Insertion de la personne : Kristen Bell
INSERT INTO personne (nom, prenom) 
SELECT 'Bell', 'Kristen'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Bell' AND prenom = 'Kristen'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Bell' 
  AND p.prenom = 'Kristen'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Veronica Mars' 
  AND p.nom = 'Bell' 
  AND p.prenom = 'Kristen'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jason Dohring
INSERT INTO personne (nom, prenom) 
SELECT 'Dohring', 'Jason'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Dohring' AND prenom = 'Jason'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Dohring' 
  AND p.prenom = 'Jason'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Veronica Mars' 
  AND p.nom = 'Dohring' 
  AND p.prenom = 'Jason'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Enrico Colantoni
INSERT INTO personne (nom, prenom) 
SELECT 'Colantoni', 'Enrico'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Colantoni' AND prenom = 'Enrico'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Colantoni' 
  AND p.prenom = 'Enrico'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Veronica Mars' 
  AND p.nom = 'Colantoni' 
  AND p.prenom = 'Enrico'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Rob Thomas
INSERT INTO personne (nom, prenom) 
SELECT 'Thomas', 'Rob'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Thomas' AND prenom = 'Rob'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Thomas' 
  AND p.prenom = 'Rob'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Veronica Mars' 
  AND p.nom = 'Thomas' 
  AND p.prenom = 'Rob'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : V
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'V',
    '03 Nov 2009',
    'An extraterrestrial race arrives on Earth with seemingly good intentions, only to slowly reveal their true machinations the more ingrained into society they become.'
);


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'V' AND g.libelle = 'Drama';


-- Insertion du genre : Sci-Fi
INSERT INTO genre (libelle) 
SELECT 'Sci-Fi'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Sci-Fi');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'V' AND g.libelle = 'Sci-Fi';


-- Insertion du genre : Thriller
INSERT INTO genre (libelle) 
SELECT 'Thriller'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Thriller');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'V' AND g.libelle = 'Thriller';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Nominated for 1 Primetime Emmy. 1 win & 15 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Nominated for 1 Primetime Emmy. 1 win & 15 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'V' AND p.libelle = 'Nominated for 1 Primetime Emmy. 1 win & 15 nominations total';


-- Insertion de la personne : Elizabeth Mitchell
INSERT INTO personne (nom, prenom) 
SELECT 'Mitchell', 'Elizabeth'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Mitchell' AND prenom = 'Elizabeth'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Mitchell' 
  AND p.prenom = 'Elizabeth'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'V' 
  AND p.nom = 'Mitchell' 
  AND p.prenom = 'Elizabeth'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Morris Chestnut
INSERT INTO personne (nom, prenom) 
SELECT 'Chestnut', 'Morris'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Chestnut' AND prenom = 'Morris'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Chestnut' 
  AND p.prenom = 'Morris'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'V' 
  AND p.nom = 'Chestnut' 
  AND p.prenom = 'Morris'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Joel Gretsch
INSERT INTO personne (nom, prenom) 
SELECT 'Gretsch', 'Joel'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Gretsch' AND prenom = 'Joel'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Gretsch' 
  AND p.prenom = 'Joel'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'V' 
  AND p.nom = 'Gretsch' 
  AND p.prenom = 'Joel'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Kenneth Johnson
INSERT INTO personne (nom, prenom) 
SELECT 'Johnson', 'Kenneth'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Johnson' AND prenom = 'Kenneth'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Johnson' 
  AND p.prenom = 'Kenneth'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'V' 
  AND p.nom = 'Johnson' 
  AND p.prenom = 'Kenneth'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Scott Peters
INSERT INTO personne (nom, prenom) 
SELECT 'Peters', 'Scott'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Peters' AND prenom = 'Scott'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Peters' 
  AND p.prenom = 'Scott'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'V' 
  AND p.nom = 'Peters' 
  AND p.prenom = 'Scott'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Weeds
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Weeds',
    '07 Aug 2005',
    'When a suburban mother turns to dealing marijuana in order to maintain her privileged lifestyle after her husband dies, she finds out just how addicted her entire neighborhood already is.'
);


-- Insertion du genre : Comedy
INSERT INTO genre (libelle) 
SELECT 'Comedy'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Comedy');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Weeds' AND g.libelle = 'Comedy';


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Weeds' AND g.libelle = 'Crime';


-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Weeds' AND g.libelle = 'Drama';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT 'Won 2 Primetime Emmys. 15 wins & 100 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 2 Primetime Emmys. 15 wins & 100 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Weeds' AND p.libelle = 'Won 2 Primetime Emmys. 15 wins & 100 nominations total';


-- Insertion de la personne : Mary-Louise Parker
INSERT INTO personne (nom, prenom) 
SELECT 'Parker', 'Mary-Louise'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Parker' AND prenom = 'Mary-Louise'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Parker' 
  AND p.prenom = 'Mary-Louise'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Weeds' 
  AND p.nom = 'Parker' 
  AND p.prenom = 'Mary-Louise'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Hunter Parrish
INSERT INTO personne (nom, prenom) 
SELECT 'Parrish', 'Hunter'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Parrish' AND prenom = 'Hunter'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Parrish' 
  AND p.prenom = 'Hunter'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Weeds' 
  AND p.nom = 'Parrish' 
  AND p.prenom = 'Hunter'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Alexander Gould
INSERT INTO personne (nom, prenom) 
SELECT 'Gould', 'Alexander'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Gould' AND prenom = 'Alexander'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Gould' 
  AND p.prenom = 'Alexander'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Weeds' 
  AND p.nom = 'Gould' 
  AND p.prenom = 'Alexander'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Jenji Kohan
INSERT INTO personne (nom, prenom) 
SELECT 'Kohan', 'Jenji'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Kohan' AND prenom = 'Jenji'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Kohan' 
  AND p.prenom = 'Jenji'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Weeds' 
  AND p.nom = 'Kohan' 
  AND p.prenom = 'Jenji'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : Whitechapel
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Whitechapel',
    '02 Feb 2009',
    'A fast-tracked inspector, a hardened detective sergeant, and an expert in historical homicides investigate modern crimes with connections to the past in the Whitechapel district of London.'
);


-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Whitechapel' AND g.libelle = 'Crime';


-- Insertion du genre : Mystery
INSERT INTO genre (libelle) 
SELECT 'Mystery'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Mystery');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Whitechapel' AND g.libelle = 'Mystery';


-- Insertion du genre : Thriller
INSERT INTO genre (libelle) 
SELECT 'Thriller'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Thriller');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Whitechapel' AND g.libelle = 'Thriller';


-- Insertion des récompenses
INSERT INTO prix (libelle) 
SELECT '8 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = '8 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Whitechapel' AND p.libelle = '8 nominations total';


-- Insertion de la personne : Rupert Penry-Jones
INSERT INTO personne (nom, prenom) 
SELECT 'Penry-Jones', 'Rupert'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Penry-Jones' AND prenom = 'Rupert'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Penry-Jones' 
  AND p.prenom = 'Rupert'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Whitechapel' 
  AND p.nom = 'Penry-Jones' 
  AND p.prenom = 'Rupert'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Phil Davis
INSERT INTO personne (nom, prenom) 
SELECT 'Davis', 'Phil'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Davis' AND prenom = 'Phil'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Davis' 
  AND p.prenom = 'Phil'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Whitechapel' 
  AND p.nom = 'Davis' 
  AND p.prenom = 'Phil'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Steve Pemberton
INSERT INTO personne (nom, prenom) 
SELECT 'Pemberton', 'Steve'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Pemberton' AND prenom = 'Steve'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Pemberton' 
  AND p.prenom = 'Steve'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Whitechapel' 
  AND p.nom = 'Pemberton' 
  AND p.prenom = 'Steve'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Ben Court
INSERT INTO personne (nom, prenom) 
SELECT 'Court', 'Ben'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Court' AND prenom = 'Ben'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Court' 
  AND p.prenom = 'Ben'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Whitechapel' 
  AND p.nom = 'Court' 
  AND p.prenom = 'Ben'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Caroline Ip
INSERT INTO personne (nom, prenom) 
SELECT 'Ip', 'Caroline'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Ip' AND prenom = 'Caroline'
);


-- Insertion du rôle : Scénariste
INSERT INTO role (libelle) 
SELECT 'Scénariste'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Scénariste');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Scénariste' 
  AND p.nom = 'Ip' 
  AND p.prenom = 'Caroline'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Whitechapel' 
  AND p.nom = 'Ip' 
  AND p.prenom = 'Caroline'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la série : X Files
INSERT INTO serie (titre, description) 
VALUES (
    'X Files',
    'In the world there are thousands of mysteries still unsolved, the problem is when these mysteries become our greatest fears of our life. These stories awaken our worst nightmares.'
);


-- Insertion du genre : Horror
INSERT INTO genre (libelle) 
SELECT 'Horror'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Horror');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'X Files' AND g.libelle = 'Horror';


-- Insertion du genre : Sci-Fi
INSERT INTO genre (libelle) 
SELECT 'Sci-Fi'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Sci-Fi');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'X Files' AND g.libelle = 'Sci-Fi';


-- Insertion de la personne : Rois Rull
INSERT INTO personne (nom, prenom) 
SELECT 'Rull', 'Rois'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Rull' AND prenom = 'Rois'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Rull' 
  AND p.prenom = 'Rois'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'X Files' 
  AND p.nom = 'Rull' 
  AND p.prenom = 'Rois'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Kin Tammy
INSERT INTO personne (nom, prenom) 
SELECT 'Tammy', 'Kin'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Tammy' AND prenom = 'Kin'
);


-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Tammy' 
  AND p.prenom = 'Kin'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'X Files' 
  AND p.nom = 'Tammy' 
  AND p.prenom = 'Kin'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);


-- Insertion de la personne : Steve Garel
INSERT INTO personne (nom, prenom) 
SELECT 'Garel', 'Steve'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Garel' AND prenom = 'Steve'
);


-- Insertion du rôle : Realisateur
INSERT INTO role (libelle) 
SELECT 'Realisateur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Realisateur');


-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Realisateur' 
  AND p.nom = 'Garel' 
  AND p.prenom = 'Steve'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);


-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'X Files' 
  AND p.nom = 'Garel' 
  AND p.prenom = 'Steve'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
    AND part.Id_personne = p.Id_personne
);

