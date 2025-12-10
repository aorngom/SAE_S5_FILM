from app.database.connection import get_db


# Découpe la requête en mots
def split_query(user_query: str):
    if not user_query:
        return []
    parts = user_query.lower().strip().split()
    return [p for p in parts if len(p) > 1]


# Suggestions de mots-clés
def get_suggestions(query: str):
    db_gen = get_db()
    conn = next(db_gen)
    try:
        cur = conn.cursor()

        sql = """
            SELECT libelle
            FROM mot_cle
            WHERE libelle ILIKE %s
            ORDER BY poids DESC
            LIMIT 8;
        """

        cur.execute(sql, (query + "%",))
        results = [row["libelle"] for row in cur.fetchall()]

        cur.close()
        conn.close()
        return results

    except Exception as e:
        print("Erreur suggestions :", e)
        try:
            cur.close()
        except Exception:
            pass
        try:
            conn.close()
        except Exception:
            pass
        return []


# Recherche multi-mots avec score TF-IDF cumulé
def search_series(query: str):
    db_gen = get_db()
    conn = next(db_gen)
    try:
        cur = conn.cursor()

        terms = split_query(query)
        terms = terms[:3]  # on limite à 3 mots max
        if not terms:
            cur.close()
            conn.close()
            return []

        score_by_serie = {}   # id_serie -> score cumulé
        titre_by_serie = {}   # id_serie -> titre

        # Traite chaque mot séparément
        for term in terms:

            sql_keywords = """
                SELECT Id_mot_cle, poids, langue
                FROM mot_cle
                WHERE libelle ILIKE %s
                ORDER BY poids DESC
                LIMIT 20;
            """

            cur.execute(sql_keywords, (term + "%",))
            keywords = cur.fetchall()

            if not keywords:
                continue

            # Map id_mot_cle -> poids
            mot_poids = {row["id_mot_cle"]: float(row["poids"]) for row in keywords}
            ids_mots = tuple(mot_poids.keys())

            if len(ids_mots) == 1:
                ids_mots = (ids_mots[0], ids_mots[0])

            sql_series = """
                SELECT d.Id_serie, s.titre, d.Id_mot_cle
                FROM decrire d
                JOIN serie s ON s.Id_serie = d.Id_serie
                WHERE d.Id_mot_cle IN %s;
            """

            cur.execute(sql_series, (ids_mots,))
            rows = cur.fetchall()

            # Cumul du score TF-IDF
            for row in rows:
                serie_id = row["id_serie"]
                mot_id = row["id_mot_cle"]
                titre = row["titre"] or ""

                poids = mot_poids.get(mot_id)
                if poids is None:
                    continue

                titre_by_serie[serie_id] = titre
                score_by_serie[serie_id] = score_by_serie.get(serie_id, 0.0) + poids

        if not score_by_serie:
            cur.close()
            conn.close()
            return []

        # Tri des séries par score décroissant
        sorted_series = sorted(score_by_serie.items(), key=lambda x: x[1], reverse=True)
        results = []

        for serie_id, score in sorted_series:
            titre = titre_by_serie.get(serie_id, "Titre inconnu")
            poster_name = titre.lower().replace(" ", "")

            results.append({
                "id": serie_id,
                "titre": titre,
                "image_url": f"/static/images/posters_series/{poster_name}.jpg"
            })

        cur.close()
        conn.close()
        return results

    except Exception as e:
        print("Erreur recherche série :", e)
        try:
            cur.close()
        except Exception:
            pass
        try:
            conn.close()
        except Exception:
            pass
        return []
