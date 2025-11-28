async function loadSeries() {
    try {
        // On récupère les séries depuis l’API FastAPI (backend)
        const response = await fetch("/api/series");
        if (!response.ok) throw new Error("Erreur API /api/series");

        const series = await response.json();
        console.log("Séries chargées :", series);

        const container = document.getElementById("series-container");
        container.innerHTML = "";

        series.forEach((s) => {
            const titre = s.titre || "Titre inconnu";
            const image = s.image || "default.jpg";

            const card = document.createElement("div");
            card.className = "serie-card fade-in";

            const img = document.createElement("img");

            //  /static/images/posters_series/<image>
            img.src = `/static/images/posters_series/${image}`;
            img.alt = titre;

            // Si l'image est introuvable : fallback vers default.jpg
            img.onerror = () => {
                img.src = "/static/images/posters_series/default.jpg";
            };

            const title = document.createElement("h3");
            title.textContent = titre;

            card.appendChild(img);
            card.appendChild(title);

            // Redirection vers la page détail
            card.onclick = () => window.location.href = `/detail?id=${s.Id_serie}`;

            container.appendChild(card);
        });

    } catch (err) {
        console.error("Erreur lors du chargement des séries :", err);
        document.getElementById("series-container").innerHTML =
            "<p style='color:white;'>Impossible de charger les séries.</p>";
    }
}

loadSeries();
