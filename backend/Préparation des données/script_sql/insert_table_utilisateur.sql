-- ======================================
-- INSERTION DES UTILISATEURS
-- ======================================
-- ADMIN
INSERT INTO utilisateur
(identifiant, email, mdp, mdp_clair, type_utilisateur, prenom, nom, adresse, telephone)
VALUES
('admin', 'admin@seriesdb.com',
 '$2b$12$Ub7LeUkU7MMVuGvHOhuyveDC8FmK79kS/GJDCmxnGx49X.AZ9Uj2W',
 'admin123',
 'administrateur',
 'Alice', 'Dupont',
 '12 Rue des Admins, Paris',
 '+33 6 11 22 33 44'
);
-- UTILISATEUR
INSERT INTO utilisateur
(identifiant, email, mdp, mdp_clair, type_utilisateur, prenom, nom, adresse, telephone)
VALUES
('john_doe', 'john.doe@example.com',
 '$2b$12$Nl/Qc6oOr77h/tvRLASkLuGfWq4nfQqughD5FPl0jCPEm9AdfbpXq',
 'johndoe123',
 'utilisateur',
 'John', 'Doe',
 '45 Avenue de la République, Lyon',
 '+33 6 45 22 91 10'
);

INSERT INTO utilisateur
(identifiant, email, mdp, mdp_clair, type_utilisateur, prenom, nom, adresse, telephone)
VALUES
('jane_smith', 'jane.smith@example.com',
 '$2b$12$8N3qBySqH9.7lOoQWH3L0ukVJHImrsxrEo.JmP3CkqxO95R5m58QK',
 'janesmith123',
 'utilisateur',
 'Jane', 'Smith',
 '78 Boulevard Victor Hugo, Marseille',
 '+33 7 89 44 11 08'
);

INSERT INTO utilisateur
(identifiant, email, mdp, mdp_clair, type_utilisateur, prenom, nom, adresse, telephone)
VALUES
('cinephile_pro', 'cinephile@example.com',
 '$2b$12$jTHEAE/s26rVxm0UXE8U3.HE.AoOujaODQWbD7j52ym3gi0JxeK6.',
 'cine123',
 'utilisateur',
 'Lucas', 'Martinez',
 '9 Rue des Cinéphiles, Bordeaux',
 '+33 7 12 23 34 45'
);

INSERT INTO utilisateur
(identifiant, email, mdp, mdp_clair, type_utilisateur, prenom, nom, adresse, telephone)
VALUES
('series_addict', 'addict@example.com',
 '$2b$12$lwVLlSw2YvcdllAYmPq.Ku4MXVCMIWTwpLGiGmT.jY0KlUBNpPDLy',
 'addict123',
 'utilisateur',
 'Emma', 'Moreau',
 '33 Rue des Lilas, Toulouse',
 '+33 6 88 44 22 55'
);

INSERT INTO utilisateur
(identifiant, email, mdp, mdp_clair, type_utilisateur, prenom, nom, adresse, telephone)
VALUES
('tv_lover', 'tvlover@example.com',
 '$2b$12$fpNWqUrUpf.3hBeja0waEeQZ5e4bk01gDmpDpySMEOBMvK2jbVHjC',
 'lover123',
 'utilisateur',
 'Paul', 'Girard',
 '50 Rue des Peupliers, Nice',
 '+33 6 73 81 99 12'
);
