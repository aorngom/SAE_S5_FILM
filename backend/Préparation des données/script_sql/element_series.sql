INSERT INTO genre (libelle) VALUES
('Action'), ('Drama'), ('Comedy'), ('Thriller'), ('Sci-Fi')
ON CONFLICT DO NOTHING;

INSERT INTO prix (libelle) VALUES
('Emmy Award Winner'),
('Golden Globe Nominee'),
('People Choice Award'),
('Best Drama Series'),
('Critics Choice Award')
ON CONFLICT DO NOTHING;

INSERT INTO role (libelle) VALUES 
('Acteur Principal'),
('Réalisateur'),
('Créateur')
ON CONFLICT DO NOTHING;
--

-- Saison + épisodes
INSERT INTO saison (numero, description, id_serie) VALUES (1, 'Saison 1 de 24', 1);
INSERT INTO episode (numero, duree, id_saison) VALUES
(1, '42 min', 1),
(2, '43 min', 1);

-- Genre
INSERT INTO posseder VALUES (1, (SELECT id_genre FROM genre WHERE libelle='Action'));

-- Prix
INSERT INTO recevoir VALUES (1, (SELECT id_prix FROM prix WHERE libelle='Emmy Award Winner'));

-- Créateur / Réalisateur / Acteur
INSERT INTO personne (nom, prenom) VALUES ('Surnow', 'Joel');
INSERT INTO personne (nom, prenom) VALUES ('Cassar', 'Jon');
INSERT INTO personne (nom, prenom) VALUES ('Sutherland', 'Kiefer');

INSERT INTO participer VALUES (1, (SELECT id_personne FROM personne WHERE nom='Surnow'));
INSERT INTO participer VALUES (1, (SELECT id_personne FROM personne WHERE nom='Cassar'));
INSERT INTO participer VALUES (1, (SELECT id_personne FROM personne WHERE nom='Sutherland'));
--

INSERT INTO saison (numero, description, id_serie) VALUES (1, 'Saison 1', 2);
INSERT INTO episode (numero, duree, id_saison) VALUES
(1, '41 min', 2),
(2, '40 min', 2);

INSERT INTO posseder VALUES (2, (SELECT id_genre FROM genre WHERE libelle='Drama'));
INSERT INTO recevoir VALUES (2, (SELECT id_prix FROM prix WHERE libelle='People Choice Award'));

INSERT INTO personne (nom, prenom) VALUES ('Star', 'Darren');
INSERT INTO personne (nom, prenom) VALUES ('Smith', 'Jeff');
INSERT INTO personne (nom, prenom) VALUES ('Grimes', 'Shenae');

INSERT INTO participer VALUES (2, (SELECT id_personne FROM personne WHERE nom='Star'));
INSERT INTO participer VALUES (2, (SELECT id_personne FROM personne WHERE nom='Smith'));
INSERT INTO participer VALUES (2, (SELECT id_personne FROM personne WHERE nom='Grimes'));
--

INSERT INTO saison (numero, description, id_serie) VALUES (1, 'Saison 1', 3);
INSERT INTO episode VALUES (default, 1, '45 min', 3), (default, 2, '44 min', 3);

INSERT INTO posseder VALUES (3, (SELECT id_genre FROM genre WHERE libelle='Action'));
INSERT INTO recevoir VALUES (3, (SELECT id_prix FROM prix WHERE libelle='Golden Globe Nominee'));

INSERT INTO personne (nom, prenom) VALUES ('Abrams', 'JJ');
INSERT INTO personne (nom, prenom) VALUES ('Cooper', 'Ben');
INSERT INTO personne (nom, prenom) VALUES ('Garner', 'Jennifer');

INSERT INTO participer VALUES (3, (SELECT id_personne FROM personne WHERE nom='Abrams'));
INSERT INTO participer VALUES (3, (SELECT id_personne FROM personne WHERE nom='Cooper'));
INSERT INTO participer VALUES (3, (SELECT id_personne FROM personne WHERE nom='Garner'));
--

INSERT INTO saison VALUES (default, 1, 'Première saison', 4);
INSERT INTO episode VALUES (default, 1, '44 min', 4), (default, 2, '43 min', 4);

INSERT INTO posseder VALUES (4, (SELECT id_genre FROM genre WHERE libelle='Drama'));
INSERT INTO recevoir VALUES (4, (SELECT id_prix FROM prix WHERE libelle='Critics Choice Award'));

INSERT INTO personne (nom, prenom) VALUES ('Whedon', 'Joss');
INSERT INTO personne (nom, prenom) VALUES ('Greenwalt', 'David');
INSERT INTO personne (nom, prenom) VALUES ('Boreanaz', 'David');

INSERT INTO participer VALUES (4, (SELECT id_personne FROM personne WHERE nom='Whedon'));
INSERT INTO participer VALUES (4, (SELECT id_personne FROM personne WHERE nom='Greenwalt'));
INSERT INTO participer VALUES (4, (SELECT id_personne FROM personne WHERE nom='Boreanaz'));


-- ======================================
-- OPTION A : Remplissage simple et sûr
-- ======================================

-- 1) Nettoyage minimal pour éviter collisions
DELETE FROM saison;
DELETE FROM episode;
DELETE FROM posseder;
DELETE FROM recevoir;
DELETE FROM participer;

-- ======================================
-- 2) Récupération d’IDs existants
-- ======================================

-- Genres existants (on prend IDs 1 → 25)
WITH g AS (
    SELECT id_genre FROM genre ORDER BY id_genre
), p AS (
    SELECT id_prix FROM prix ORDER BY id_prix
), pers AS (
    SELECT id_personne FROM personne ORDER BY id_personne
)
SELECT 'OK — IDs récupérés' AS status;

-- ======================================
-- 3) Génération des saisons + épisodes
-- ======================================

DO $$
DECLARE 
    s RECORD;           -- chaque série
    saison_id INT;      -- pour la saison créée
    g_id INT;           -- genre pris au hasard
    p_id INT;           -- prix pris au hasard
    creator_id INT;     -- personne au hasard
    director_id INT;
    actor_id INT;
BEGIN
    FOR s IN SELECT id_serie FROM serie ORDER BY id_serie LOOP

        -- Genre random
        SELECT id_genre INTO g_id 
        FROM genre
        ORDER BY random()
        LIMIT 1;

        -- Prix random
        SELECT id_prix INTO p_id 
        FROM prix
        ORDER BY random()
        LIMIT 1;

        -- Créateur random
        SELECT id_personne INTO creator_id
        FROM personne
        ORDER BY random()
        LIMIT 1;

        -- Réalisateur random
        SELECT id_personne INTO director_id
        FROM personne
        ORDER BY random()
        LIMIT 1;

        -- Acteur random
        SELECT id_personne INTO actor_id
        FROM personne
        ORDER BY random()
        LIMIT 1;

        -- ----------------------------
        -- SAISON
        -- ----------------------------
        INSERT INTO saison(numero, description, id_serie)
        VALUES (1, 'Saison 1', s.id_serie)
        RETURNING id_saison INTO saison_id;

        -- ----------------------------
        -- EPISODES
        -- ----------------------------
        INSERT INTO episode(numero, duree, id_saison)
        VALUES 
            (1, '42 min', saison_id),
            (2, '44 min', saison_id);

        -- ----------------------------
        -- GENRE
        -- ----------------------------
        INSERT INTO posseder(id_serie, id_genre)
        VALUES (s.id_serie, g_id);

        -- ----------------------------
        -- PRIX
        -- ----------------------------
        INSERT INTO recevoir(id_serie, id_prix)
        VALUES (s.id_serie, p_id);

        -- ----------------------------
        -- CREATOR
        -- ----------------------------
        INSERT INTO participer(id_serie, id_personne)
        VALUES (s.id_serie, creator_id);

        -- ----------------------------
        -- DIRECTOR
        -- ----------------------------
        INSERT INTO participer(id_serie, id_personne)
        VALUES (s.id_serie, director_id);

        -- ----------------------------
        -- ACTOR
        -- ----------------------------
        INSERT INTO participer(id_serie, id_personne)
        VALUES (s.id_serie, actor_id);

    END LOOP;
END $$;

-- ======================================
-- FIN
-- ======================================
SELECT 'INSERTIONS TERMINÉES POUR 125 SÉRIES' AS status;

SELECT COUNT(*) FROM saison;     -- doit ≈ 125
SELECT COUNT(*) FROM episode;    -- doit ≈ 250
SELECT COUNT(*) FROM posseder;   -- doit ≈ 125
SELECT COUNT(*) FROM recevoir;   -- doit ≈ 125
SELECT COUNT(*) FROM participer; -- doit ≈ 375 (3 personnes × 125)

-- roles
DO $$
DECLARE
    sid INT;
    p_creator INT;
    p_director INT;
    p_actor1 INT;
    p_actor2 INT;
BEGIN
    FOR sid IN 1..125 LOOP

        -- Créateur (rôle 3)
        SELECT id_personne INTO p_creator
        FROM personne ORDER BY RANDOM() LIMIT 1;

        INSERT INTO participer VALUES (sid, p_creator)
        ON CONFLICT DO NOTHING;

        INSERT INTO jouer VALUES (3, p_creator)
        ON CONFLICT DO NOTHING;

        -- Réalisateur (rôle 2)
        SELECT id_personne INTO p_director
        FROM personne 
        WHERE id_personne <> p_creator
        ORDER BY RANDOM() LIMIT 1;

        INSERT INTO participer VALUES (sid, p_director)
        ON CONFLICT DO NOTHING;

        INSERT INTO jouer VALUES (2, p_director)
        ON CONFLICT DO NOTHING;

        -- Acteur 1 (rôle 1)
        SELECT id_personne INTO p_actor1
        FROM personne 
        WHERE id_personne NOT IN (p_creator, p_director)
        ORDER BY RANDOM() LIMIT 1;

        INSERT INTO participer VALUES (sid, p_actor1)
        ON CONFLICT DO NOTHING;

        INSERT INTO jouer VALUES (1, p_actor1)
        ON CONFLICT DO NOTHING;

        -- Acteur 2 (rôle 1)
        SELECT id_personne INTO p_actor2
        FROM personne 
        WHERE id_personne NOT IN (p_creator, p_director, p_actor1)
        ORDER BY RANDOM() LIMIT 1;

        INSERT INTO participer VALUES (sid, p_actor2)
        ON CONFLICT DO NOTHING;

        INSERT INTO jouer VALUES (1, p_actor2)
        ON CONFLICT DO NOTHING;

    END LOOP;
END $$;
