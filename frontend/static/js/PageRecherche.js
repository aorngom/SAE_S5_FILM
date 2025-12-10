// === RÉCUPÉRATION DES PARAMÈTRES DE L’URL ===
const urlParams = new URLSearchParams(window.location.search);
const query = urlParams.get("q");

// Sélecteurs
const statusBox = document.getElementById("search-status");
const resultsGrid = document.getElementById("search-results");

// --- Fonction principale ---
async function loadSearchResults() {
    if (!query || query.trim() === "") {
        statusBox.textContent = "Veuillez entrer un terme de recherche.";
        return;
    }

    // Mettre un titre dynamique
    document.querySelector(".search-title").textContent =
        `Résultats pour : "${query}"`;

    // Message de chargement
    statusBox.textContent = "Recherche en cours…";

    try {
        // Appel backend
        const response = await fetch(`/api/search?query=${encodeURIComponent(query)}`);

        if (!response.ok) {
            throw new Error("Erreur serveur");
        }

        const data = await response.json();

        // Si aucun résultat
        if (data.length === 0) {
            statusBox.textContent = `Aucun résultat trouvé pour "${query}".`;
            return;
        }

        // Sinon, on vide le message
        statusBox.textContent = "";

        // Affichage des résultats
        displaySeries(data);

    } catch (error) {
        console.error("Erreur recherche :", error);
        statusBox.textContent = "Une erreur est survenue. Réessayez.";
    }
}

// Afficher les séries sous forme de cartes
function displaySeries(seriesList) {
    resultsGrid.innerHTML = "";

    seriesList.forEach((serie, index) => {

        // Création d'une carte
        const card = document.createElement("div");
        card.classList.add("serie-card", "fade-in");
        card.style.animationDelay = `${index * 0.05}s`; // effet progressif

        card.onclick = () => {
            window.location.href = `/detail?id=${serie.id}`;
        };        

        // Image
        const img = document.createElement("img");
        img.src = serie.image_url || "/static/img/no_image.jpg";
        img.alt = serie.titre;

        // Titre
        const title = document.createElement("h3");
        title.textContent = serie.titre;

        // Injection dans la carte
        card.appendChild(img);
        card.appendChild(title);

        // Injection dans la grille
        resultsGrid.appendChild(card);
    });
}

// Lancer automatiquement la recherche au chargement
loadSearchResults();
