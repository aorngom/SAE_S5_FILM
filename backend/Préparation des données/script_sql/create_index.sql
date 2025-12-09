CREATE INDEX idx_noter_user ON noter(id_utilisateur);
CREATE INDEX idx_noter_serie ON noter(id_serie);

CREATE INDEX idx_hist_user ON historique_recherche(id_utilisateur);

CREATE INDEX idx_decrire_serie ON decrire(id_serie);
CREATE INDEX idx_decrire_mot_cle ON decrire(id_mot_cle);

CREATE INDEX idx_noter_user_serie ON noter(id_utilisateur, id_serie);
CREATE INDEX idx_hist_user_serie ON historique_recherche(id_utilisateur, id_serie);
CREATE INDEX idx_decrire_serie_mot_cle ON decrire(id_serie, id_mot_cle);

CREATE INDEX idx_recherche_date ON recherche(date_recherche);
CREATE INDEX idx_mot_cle_libelle ON mot_cle(libelle);
CREATE INDEX idx_serie_titre ON serie(titre);
CREATE UNIQUE INDEX idx_user_identifiant ON utilisateur(identifiant);
CREATE UNIQUE INDEX idx_user_email ON utilisateur(email);