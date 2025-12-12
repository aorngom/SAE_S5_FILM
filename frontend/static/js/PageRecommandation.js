// Vérifie si un utilisateur est connecté
function getLoggedUser() {
    return localStorage.getItem("user_identifiant");
}

// fonctions de recommandation d'un utilisateur connecté
async function loadPersonalRecommendations() {
    const user = getLoggedUser();
    if (!user) return;

    try {
        const response = await fetch(`/recommendations/user/${user}`);
        if (!response.ok) throw new Error("Erreur API /recommendations/user");

        const list = await response.json();
        console.log("Recommandations personnalisées :", list);

        const section = document.getElementById("personal-section");
        section.style.display = "block"; // afficher la section perso

        const container = document.getElementById("personal-container");
        container.innerHTML = "";

        list.forEach((item) => createCard(item, container));

    } catch (err) {
        console.error("Erreur recommandation utilisateur :", err);
    }
}

// fonctions de recommandation d'un utilisateur non connecté
async function loadTrending() {
    try {
        const response = await fetch("/recommendations/trending");
        if (!response.ok) throw new Error("Erreur API /recommendations/trending");

        const list = await response.json();
        const container = document.getElementById("trending-container");
        container.innerHTML = "";

        list.forEach((item) => createCard(item, container));
    } catch (err) {
        console.error("Erreur trending :", err);
    }
}

async function loadAwards() {
    try {
        const response = await fetch("/recommendations/awards");
        if (!response.ok) throw new Error("Erreur API /recommendations/awards");

        const list = await response.json();
        const container = document.getElementById("awards-container");
        container.innerHTML = "";

        list.forEach((item) => createCard(item, container));
    } catch (err) {
        console.error("Erreur awards :", err);
    }
}

async function loadTopRated() {
    try {
        const response = await fetch("/recommendations/top_rated");
        if (!response.ok) throw new Error("Erreur API /recommendations/top_rated");

        const list = await response.json();
        const container = document.getElementById("top-rated-container");
        container.innerHTML = "";

        list.forEach((item) => createCard(item, container));
    } catch (err) {
        console.error("Erreur top rated :", err);
    }
}

// fonction pour créer une carte série
function createCard(item, container) {
    const titre = item.serie || item.titre || "Titre inconnu";

    const image = item.image;

    const card = document.createElement("div");
    card.className = "serie-card fade-in";

    const img = document.createElement("img");
    img.src = `/static/images/posters_series/${image}`;
    img.alt = titre;
    img.onerror = () => img.src = "/static/images/posters_series/default.jpg";

    const title = document.createElement("h3");
    title.textContent = titre;

    card.appendChild(img);
    card.appendChild(title);

    if (item.id_serie) {
        card.onclick = () => window.location.href = `/detail?id=${item.id_serie}`;
    }

    container.appendChild(card);
}

// Initialisation de la page
(function initPage() {
    const user = getLoggedUser();
    console.log("Utilisateur connecté :", user);

    if (user) {
        // ✔ Utilisateur connecté : charger les recommandations perso
        loadPersonalRecommendations();
    } else {
        // Utilisateur non connecté : on peut recharger la page après login
        // ou afficher un message dans la section perso
        const section = document.getElementById("personal-section");
        section.style.display = "block"; // afficher la section quand même
        section.innerHTML = "<p>Connectez-vous pour voir vos recommandations personnalisées.</p>";
    }

    // Sections publiques (toujours chargées)
    loadTrending();
    loadAwards();
    loadTopRated();
})();