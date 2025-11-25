-- Insertion de la série : Grey’s Anatomy
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Grey’s Anatomy',
    '27 Mar 2005',
    'Grey’s Anatomy chronicles the lives of surgical interns, residents, and attendings at the fictional Grey Sloan Memorial Hospital as they progress in their careers and navigate complex personal lives.'
);

-- Insertion du genre : Drama
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Grey’s Anatomy' AND g.libelle = 'Drama';

-- Insertion des récompenses : Won 4 Primetime Emmys. 90 wins & 253 nominations total
INSERT INTO prix (libelle) 
SELECT 'Won 4 Primetime Emmys. 90 wins & 253 nominations total'
WHERE NOT EXISTS (SELECT 1 FROM prix WHERE libelle = 'Won 4 Primetime Emmys. 90 wins & 253 nominations total');

-- Lien série-prix
INSERT INTO recevoir (Id_serie, Id_prix)
SELECT s.Id_serie, p.Id_prix 
FROM serie s, prix p
WHERE s.titre = 'Grey’s Anatomy' AND p.libelle = 'Won 4 Primetime Emmys. 90 wins & 253 nominations total';

-- Insertion de la personne : Ellen Pompeo
INSERT INTO personne (nom, prenom) 
SELECT 'Pompeo', 'Ellen'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Pompeo' AND prenom = 'Ellen'
);

-- Insertion du rôle : Acteur
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');

-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Pompeo' 
  AND p.prenom = 'Ellen'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);

-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Grey’s Anatomy' 
  AND p.nom = 'Pompeo' 
  AND p.prenom = 'Ellen'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
      AND part.Id_personne = p.Id_personne
);

-- Insertion de la personne : Sandra Oh
INSERT INTO personne (nom, prenom) 
SELECT 'Oh', 'Sandra'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Oh' AND prenom = 'Sandra'
);

-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Oh' 
  AND p.prenom = 'Sandra'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);

-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Grey’s Anatomy' 
  AND p.nom = 'Oh' 
  AND p.prenom = 'Sandra'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
      AND part.Id_personne = p.Id_personne
);

-- Insertion de la série : Women’s Murder Club
INSERT INTO serie (titre, date_sortie, description) 
VALUES (
    'Women’s Murder Club',
    '12 Oct 2007',
    'Based on the novel series by James Patterson, Women’s Murder Club follows four professional women in San Francisco – a homicide detective, a medical examiner, a reporter and an assistant district attorney – who team up to solve murder investigations while juggling personal issues.'
);

-- Insertion du genre : Crime
INSERT INTO genre (libelle) 
SELECT 'Crime'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Crime');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Women’s Murder Club' AND g.libelle = 'Crime';

-- Insertion du genre : Drama (réutilisé)
INSERT INTO genre (libelle) 
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE libelle = 'Drama');

-- Lien série-genre
INSERT INTO posseder (Id_serie, Id_genre)
SELECT s.Id_serie, g.Id_genre 
FROM serie s, genre g
WHERE s.titre = 'Women’s Murder Club' AND g.libelle = 'Drama';

-- Insertion des récompenses : (aucune donnée majeure trouvée)
-- On peut omettre ou ajouter une ligne vide si aucune récompense significative.

-- Insertion de la personne : Angie Harmon
INSERT INTO personne (nom, prenom) 
SELECT 'Harmon', 'Angie'
WHERE NOT EXISTS (
    SELECT 1 FROM personne 
    WHERE nom = 'Harmon' AND prenom = 'Angie'
);

-- Insertion du rôle : Acteur (réutilisé)
INSERT INTO role (libelle) 
SELECT 'Acteur'
WHERE NOT EXISTS (SELECT 1 FROM role WHERE libelle = 'Acteur');

-- Lien personne-role
INSERT INTO jouer (Id_role, Id_personne)
SELECT r.Id_role, p.Id_personne
FROM role r, personne p
WHERE r.libelle = 'Acteur' 
  AND p.nom = 'Harmon' 
  AND p.prenom = 'Angie'
  AND NOT EXISTS (
    SELECT 1 FROM jouer j 
    WHERE j.Id_role = r.Id_role AND j.Id_personne = p.Id_personne
);

-- Lien personne-série
INSERT INTO participer (Id_serie, Id_personne)
SELECT s.Id_serie, p.Id_personne
FROM serie s, personne p
WHERE s.titre = 'Women’s Murder Club' 
  AND p.nom = 'Harmon' 
  AND p.prenom = 'Angie'
  AND NOT EXISTS (
    SELECT 1 FROM participer part 
    WHERE part.Id_serie = s.Id_serie 
      AND part.Id_personne = p.Id_personne
);