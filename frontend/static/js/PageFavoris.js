// static/js/PageFavoris.js

async function loadFavorisPage() {
    const identifiant = localStorage.getItem("user_identifiant");
    const container = document.getElementById("favorisContent");

    if (!identifiant) {
        container.innerHTML = `
            <p class="empty-msg">
                Vous devez être connecté pour voir vos favoris.
                <br>
                <a href="/connexion" style="color:#4fd3ff;">Se connecter</a>
            </p>
        `;
        return;
    }

    try {
        const res = await fetch(`/api/favoris/${encodeURIComponent(identifiant)}`);
        if (!res.ok) {
            container.innerHTML = `<p class="empty-msg">Erreur lors du chargement de vos favoris.</p>`;
            return;
        }

        const data = await res.json();
        const favoris = data.favoris || [];
        const bienNotes = data.bien_notes || [];

        let html = "";

        // Section favoris
        html += `
            <section class="section-block">
                <h2>Vos séries en favoris</h2>
                <p class="section-subtitle">Les séries que vous avez ajoutées avec le cœur.</p>
        `;

        if (favoris.length === 0) {
            html += `<p class="empty-msg">Vous n'avez pas encore de séries en favoris.</p>`;
        } else {
            html += `<div class="series-grid">`;
            favoris.forEach(s => {
                const image = s.image || "default.jpg";
                html += `
                    <div class="serie-card" onclick="window.location.href='/detail?id=${s.id_serie}'">
                        <img src="/static/images/posters_series/${image}"
                             onerror="this.src='/static/images/posters_series/default.jpg'">
                        <h3>${s.titre}</h3>
                    </div>
                `;
            });
            html += `</div>`;
        }
        html += `</section>`;

        // Section bien notées
        html += `
            <section class="section-block">
                <h2>Séries bien notées</h2>
                <p class="section-subtitle">Les séries auxquelles vous avez donné au moins 3 étoiles.</p>
        `;

        if (bienNotes.length === 0) {
            html += `<p class="empty-msg">Vous n'avez pas encore noté de série (ou vos notes sont inférieures à 3).</p>`;
        } else {
            html += `<div class="series-grid">`;
            bienNotes.forEach(s => {
                const image = s.image || "default.jpg";
                const score = s.score || 0;
                const stars = "★".repeat(score) + "☆".repeat(5 - score);

                html += `
                    <div class="serie-card" onclick="window.location.href='/detail?id=${s.id_serie}'">
                        <img src="/static/images/posters_series/${image}"
                             onerror="this.src='/static/images/posters_series/default.jpg'">
                        <h3>${s.titre}</h3>
                        <div class="card-score">${stars}</div>
                    </div>
                `;
            });
            html += `</div>`;
        }

        html += `</section>`;

        container.innerHTML = html;

    } catch (err) {
        console.error("Erreur favoris :", err);
        container.innerHTML = `<p class="empty-msg">Erreur interne lors du chargement.</p>`;
    }
}

loadFavorisPage();
