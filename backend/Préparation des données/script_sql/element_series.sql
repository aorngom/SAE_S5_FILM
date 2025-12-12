-- Nettoyage sécurisé dans l’ordre correct
DELETE FROM jouer;
DELETE FROM participer;
DELETE FROM recevoir;
DELETE FROM posseder;
DELETE FROM episode;
DELETE FROM saison;

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

-- Failed query:
-- DO $$
-- DECLARE
--     s RECORD;           -- chaque série
--     saison_id INT;
--     g_id INT;
--     p_id INT;
--     creator_id INT;
--     director_id INT;
--     actor_id INT;
-- BEGIN
--     -- Boucle sur TOUTES les séries (125 dans ton cas)
--     FOR s IN SELECT id_serie FROM serie ORDER BY id_serie LOOP
-- 
--         -- Genre random
--         SELECT id_genre INTO g_id 
--         FROM genre ORDER BY random() LIMIT 1;
-- 
--         -- Prix random
--         SELECT id_prix INTO p_id 
--         FROM prix ORDER BY random() LIMIT 1;
-- 
--         -- Créateur random
--         SELECT id_personne INTO creator_id
--         FROM personne ORDER BY random() LIMIT 1;
-- 
--         -- Réalisateur random
--         SELECT id_personne INTO director_id
--         FROM personne ORDER BY random() LIMIT 1;
-- 
--         -- Acteur random
--         SELECT id_personne INTO actor_id
--         FROM personne ORDER BY random() LIMIT 1;
-- 
--         -- SAISON
--         INSERT INTO saison (numero, description, id_serie)
--         VALUES (1, 'Saison 1', s.id_serie)
--         RETURNING id_saison INTO saison_id;
-- 
--         -- EPISODES
--         INSERT INTO episode (numero, duree, id_saison) VALUES
--             (1, '42 min', saison_id),
--             (2, '44 min', saison_id);
-- 
--         -- GENRE
--         INSERT INTO posseder(id_serie, id_genre)
--         VALUES (s.id_serie, g_id);
-- 
--         -- PRIX
--         INSERT INTO recevoir(id_serie, id_prix)
--         VALUES (s.id_serie, p_id);
-- 
--         -- CREATOR
--         INSERT INTO participer(id_serie, id_personne)
--         VALUES (s.id_serie, creator_id);
-- 
--         -- DIRECTOR
--         INSERT INTO participer(id_serie, id_personne)
--         VALUES (s.id_serie, director_id);
-- 
--         -- ACTOR
--         INSERT INTO participer(id_serie, id_personne)
--         VALUES (s.id_serie, actor_id);
-- 
--     END LOOP;
-- END $$;
-- 
DO $$
DECLARE
    s RECORD;
    saison_id INT;
    g_id INT;
    p_id INT;
    creator_id INT;
    director_id INT;
    actor_id INT;
BEGIN
    FOR s IN SELECT id_serie FROM serie ORDER BY id_serie LOOP
        SELECT id_genre INTO g_id 
        FROM genre ORDER BY random() LIMIT 1;

        SELECT id_prix INTO p_id 
        FROM prix ORDER BY random() LIMIT 1;

        SELECT id_personne INTO creator_id
        FROM personne ORDER BY random() LIMIT 1;

        SELECT id_personne INTO director_id
        FROM personne 
        WHERE id_personne != creator_id
        ORDER BY random() LIMIT 1;

        SELECT id_personne INTO actor_id
        FROM personne 
        WHERE id_personne NOT IN (creator_id, director_id)
        ORDER BY random() LIMIT 1;

        INSERT INTO saison (numero, description, id_serie)
        VALUES (1, 'Saison 1', s.id_serie)
        RETURNING id_saison INTO saison_id;

        INSERT INTO episode (numero, duree, id_saison) VALUES
            (1, '42 min', saison_id),
            (2, '44 min', saison_id);

        INSERT INTO posseder(id_serie, id_genre)
        VALUES (s.id_serie, g_id)
        ON CONFLICT DO NOTHING;

        INSERT INTO recevoir(id_serie, id_prix)
        VALUES (s.id_serie, p_id)
        ON CONFLICT DO NOTHING;

        INSERT INTO participer(id_serie, id_personne)
        VALUES 
            (s.id_serie, creator_id),
            (s.id_serie, director_id),
            (s.id_serie, actor_id)
        ON CONFLICT DO NO

DO $$
DECLARE
    sid INT;
    p_creator INT;
    p_director INT;
    p_actor1 INT;
    p_actor2 INT;
BEGIN
    FOR sid IN 1..125 LOOP

        -- CREATOR (ROLE 3)
        SELECT id_personne INTO p_creator
        FROM personne ORDER BY random() LIMIT 1;

        INSERT INTO jouer(id_role, id_personne)
        VALUES (3, p_creator)
        ON CONFLICT DO NOTHING;

        -- DIRECTOR (ROLE 2)
        SELECT id_personne INTO p_director
        FROM personne 
        WHERE id_personne <> p_creator
        ORDER BY random() LIMIT 1;

        INSERT INTO jouer(id_role, id_personne)
        VALUES (2, p_director)
        ON CONFLICT DO NOTHING;

        -- ACTOR 1 (ROLE 1)
        SELECT id_personne INTO p_actor1
        FROM personne 
        WHERE id_personne NOT IN (p_creator, p_director)
        ORDER BY random() LIMIT 1;

        INSERT INTO jouer(id_role, id_personne)
        VALUES (1, p_actor1)
        ON CONFLICT DO NOTHING;

        -- ACTOR 2
        SELECT id_personne INTO p_actor2
        FROM personne 
        WHERE id_personne NOT IN (p_creator, p_director, p_actor1)
        ORDER BY random() LIMIT 1;

        INSERT INTO jouer(id_role, id_personne)
        VALUES (1, p_actor2)
        ON CONFLICT DO NOTHING;

    END LOOP;
END $$;
