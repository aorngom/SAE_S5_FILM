-- ======================================
-- INSERTION DES UTILISATEURS
-- ======================================

-- Administrateurs
INSERT INTO utilisateur (identifiant, email, mdp, type_utilisateur) VALUES
('admin', 'admin@seriesdb.com', 'hashed_password_admin', 'administrateur');

-- Utilisateurs standard
INSERT INTO utilisateur (identifiant, email, mdp, type_utilisateur) VALUES
('john_doe', 'john.doe@example.com', 'hashed_password_1', 'utilisateur'),
('jane_smith', 'jane.smith@example.com', 'hashed_password_2', 'utilisateur'),
('cinephile_pro', 'cinephile@example.com', 'hashed_password_3', 'utilisateur'),
('series_addict', 'addict@example.com', 'hashed_password_4', 'utilisateur'),
('tv_lover', 'tvlover@example.com', 'hashed_password_5', 'utilisateur');