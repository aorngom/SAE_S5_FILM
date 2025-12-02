async function loadTrending() {
    try {
        const response = await fetch("/recommendations/trending");
        if (!response.ok) throw new Error("Erreur API /recommendations/trending");

        const list = await response.json();
        console.log("Trending chargés :", list);

        const container = document.getElementById("trending-container");
        container.innerHTML = "";

        list.forEach((item) => {
            const titre = item.serie || "Titre inconnu";
            const titre_transforme = titre.toLowerCase()
                .normalize("NFD")             
                .replace(/[\u0300-\u036f]/g, "")
                .replace(/[\s'’‘]/g, "");
            const image = titre_transforme + ".jpg" || "default.jpg";

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
            card.onclick = () => window.location.href = `/detail?id=${item.id_serie}`;

            container.appendChild(card);
        });

    } catch (err) {
        console.error("Erreur lors du chargement des trending :", err);
        document.getElementById("trending-container").innerHTML =
            "<p style='color:white;'>Impossible de charger les trending.</p>";
    }
}

async function loadAwards() {
    try {
        const response = await fetch("/recommendations/awards");
        if (!response.ok) throw new Error("Erreur API /recommendations/awards");

        const list = await response.json();
        console.log("Awards chargés :", list);

        const container = document.getElementById("awards-container");
        container.innerHTML = "";

        list.forEach((item) => {
            const titre = item.serie || "Titre inconnu";
            const titre_transforme = titre.toLowerCase()
                .normalize("NFD")             
                .replace(/[\u0300-\u036f]/g, "")
                .replace(/[\s'’‘]/g, "");
            const image = titre_transforme + ".jpg" || "default.jpg";

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

            if (item.id_serie) {
                card.onclick = () => window.location.href = `/detail?id=${item.id_serie}`;
            }

            container.appendChild(card);
        });

    } catch (err) {
        console.error("Erreur lors du chargement des awards :", err);
        document.getElementById("awards-container").innerHTML =
            "<p style='color:white;'>Impossible de charger les awards.</p>";
    }
}

async function loadTopRated() {
    try {
        const response = await fetch("/recommendations/top_rated");
        if (!response.ok) throw new Error("Erreur API /recommendations/top_rated");

        const list = await response.json();
        console.log("Top rated chargés :", list);

        const container = document.getElementById("top-rated-container");
        container.innerHTML = "";

        list.forEach((item) => {
            const titre = item.serie || "Titre inconnu";
            const titre_transforme = titre.toLowerCase()
                .normalize("NFD")             
                .replace(/[\u0300-\u036f]/g, "")
                .replace(/[\s'’‘]/g, "");
            const image = titre_transforme + ".jpg" || "default.jpg";

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

            if (item.id_serie) {
                card.onclick = () => window.location.href = `/detail?id=${item.id_serie}`;
            }

            container.appendChild(card);
        });

    } catch (err) {
        console.error("Erreur lors du chargement des awards :", err);
        document.getElementById("awards-container").innerHTML =
            "<p style='color:white;'>Impossible de charger les awards.</p>";
    }
}

// Déclenchement automatique au chargement de la page
loadTrending();
loadAwards();
loadTopRated();