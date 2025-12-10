// static/js/detail.js

async function loadSeriesDetail() {
    const params = new URLSearchParams(window.location.search);
    const id = parseInt(params.get("id"));

    const response = await fetch(`/api/series/${id}`);
    if (!response.ok) {
        document.getElementById("detail-page").innerHTML =
            "<p style='color:white;padding:40px;'>Série introuvable.</p>";
        return;
    }

    const serie = await response.json();
    const image = serie.image || "default.jpg";

    document.getElementById("detail-page").innerHTML = `
        <div class="hero" style="--serie-image: url('/static/images/posters_series/${image}')">
            <div class="hero-content">
                <h1>${serie.titre}</h1>
                <p class="description">${serie.description}</p>

                <div class="meta">
                    <span>${serie.genres.join(", ")}</span>
                    <span>| ${serie.date_sortie.split("-")[0]}</span>
                    <span>| ${
                        serie.prix.length > 0
                            ? serie.prix.map(p => p.libelle).join(", ")
                            : "Aucun prix"
                    }</span>
                </div>
            </div>
        </div>

        <section class="infos">
            <h2>Informations</h2>

            <div class="info-grid">
                <div>
                    <h3>Créateurs</h3>
                    <ul>${serie.createurs.map(c => `<li>${c.prenom} ${c.nom}</li>`).join("")}</ul>
                </div>

                <div>
                    <h3>Réalisateurs</h3>
                    <ul>${serie.realisateurs.map(r => `<li>${r.prenom} ${r.nom}</li>`).join("")}</ul>
                </div>

                <div>
                    <h3>Acteurs</h3>
                    <ul>${serie.acteurs.map(a => `<li>${a.prenom} ${a.nom}</li>`).join("")}</ul>
                </div>
            </div>
        </section>

        <section class="saisons">
            <h2>Saisons</h2>

            <div class="season-selector">
                <label for="seasonSelect">Choisir une saison :</label>
                <select id="seasonSelect">
                    ${serie.saisons.map(s => `
                        <option value="${s.numero}">Saison ${s.numero}</option>
                    `).join("")}
                </select>
            </div>

            <div id="episodesCount" class="episodes-box"></div>
        </section>
    `;

    setupSeasonEpisodes(serie);
    loadActionsZone(id);
}

function setupSeasonEpisodes(serie) {
    const select = document.getElementById("seasonSelect");
    const box = document.getElementById("episodesCount");

    function updateEpisodes() {
        const seasonNum = parseInt(select.value);
        const season = serie.saisons.find(s => s.numero === seasonNum);

        box.innerHTML = `
            <div class="episode-count">
                <h3>Saison ${season.numero}</h3>
                <p>${season.episodes.length} épisode(s)</p>
            </div>
        `;
    }

    updateEpisodes();
    select.addEventListener("change", updateEpisodes);
}

// ===============================
//  FAVORIS + NOTES
// ===============================

function loadActionsZone(idSerie) {
    const user = localStorage.getItem("user_identifiant");

    const zone = document.getElementById("actions-zone");
    zone.innerHTML = `
        <div class="actions-container">
            <h2 class="actions-title">Votre avis sur cette série</h2>

            <div class="actions-left">
                <span class="actions-label">Notez cette série :</span>
                <div class="stars" id="ratingStars">
                    <span class="star" data-value="1">★</span>
                    <span class="star" data-value="2">★</span>
                    <span class="star" data-value="3">★</span>
                    <span class="star" data-value="4">★</span>
                    <span class="star" data-value="5">★</span>
                </div>
            </div>

            <div class="actions-right">
                <span class="actions-label">Ajouter aux favoris :</span>
                <div id="favoriteBtn" class="favorite-btn">♡</div>
            </div>
        </div>
    `;

    if (!user) {
        // Pas connecté : on affiche, mais actions bloquées
        const favBtn = document.getElementById("favoriteBtn");
        const stars = document.querySelectorAll(".star");

        favBtn.onclick = () => {
            alert("Vous devez être connecté pour ajouter une série en favoris.");
        };

        stars.forEach(star => {
            star.onclick = () => {
                alert("Vous devez être connecté pour noter cette série.");
            };
        });

        return;
    }

    // Si connecté : on active les vraies actions
    setupFavorite(idSerie, user);
    setupRating(idSerie, user);
    initFavoriteState(idSerie, user);
    initRatingState(idSerie, user);
}

// --- Etat initial du favori ---
async function initFavoriteState(idSerie, identifiant) {
    try {
        const res = await fetch(
            `/api/favori/status?id_serie=${idSerie}&identifiant=${encodeURIComponent(identifiant)}`
        );
        if (!res.ok) return;

        const data = await res.json();
        const btn = document.getElementById("favoriteBtn");

        if (data.is_favori) {
            btn.classList.add("active");
            btn.textContent = "♥";
        } else {
            btn.classList.remove("active");
            btn.textContent = "♡";
        }
    } catch (err) {
        console.error("Erreur initFavoriteState :", err);
    }
}

// --- Favoris ---
function setupFavorite(idSerie, identifiant) {
    const btn = document.getElementById("favoriteBtn");

    btn.onclick = async () => {
        try {
            const res = await fetch("/api/favori/toggle", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ id_serie: idSerie, identifiant })
            });

            if (!res.ok) return;
            const data = await res.json();

            if (data.status === "added") {
                btn.classList.add("active");
                btn.textContent = "♥";
            } else if (data.status === "removed") {
                btn.classList.remove("active");
                btn.textContent = "♡";
            }
        } catch (err) {
            console.error("Erreur favoris :", err);
        }
    };
}

// --- Etat initial de la note ---
async function initRatingState(idSerie, identifiant) {
    try {
        const res = await fetch(
            `/api/note/status?id_serie=${idSerie}&identifiant=${encodeURIComponent(identifiant)}`
        );
        if (!res.ok) return;

        const data = await res.json();
        const score = data.score;
        if (!score) return;

        const stars = document.querySelectorAll(".star");
        stars.forEach(star => {
            const value = parseInt(star.dataset.value);
            if (value <= score) {
                star.classList.add("selected");
            }
        });
    } catch (err) {
        console.error("Erreur initRatingState :", err);
    }
}

// --- Notes ---
function setupRating(idSerie, identifiant) {
    const stars = document.querySelectorAll(".star");

    stars.forEach(star => {
        star.addEventListener("click", async () => {
            const value = parseInt(star.dataset.value);

            // visu
            stars.forEach(s => {
                const v = parseInt(s.dataset.value);
                if (v <= value) {
                    s.classList.add("selected");
                } else {
                    s.classList.remove("selected");
                }
            });

            try {
                const res = await fetch("/api/note", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({
                        id_serie: idSerie,
                        identifiant,
                        score: value
                    })
                });

                if (!res.ok) {
                    console.error("Erreur API note");
                }
            } catch (err) {
                console.error("Erreur note :", err);
            }
        });
    });
}

loadSeriesDetail();
