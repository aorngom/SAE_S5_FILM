// === MENU BURGER ===
const burger = document.getElementById("burger");
const drawer = document.getElementById("nav-drawer");

burger.addEventListener("click", () => {
    drawer.classList.toggle("open");
});

// === UTILISATEUR ===
const userBtn = document.getElementById("userBtn");
const userLabel = document.getElementById("userLabel");
const dropdown = document.getElementById("userDropdown");
const userIcon = document.getElementById("userIcon");

// === Données de session ===
const userId = localStorage.getItem("user_identifiant");
const userType = localStorage.getItem("user_type");

// === ADMIN UI ===
function enableAdminUI() {
    const drawerList = document.querySelector(".drawer-list");

    if (!document.getElementById("adminLink")) {
        const adminItem = document.createElement("li");
        adminItem.innerHTML = `<a href="/admin" class="drawer-link admin-link" id="adminLink">Admin</a>`;
        drawerList.appendChild(adminItem);
    }

    if (!document.getElementById("addSerieBtn")) {
        const navbar = document.querySelector(".navbar");
        const btn = document.createElement("button");
        btn.id = "addSerieBtn";
        btn.classList.add("nav-btn");
        btn.textContent = "Ajouter une série";
        btn.onclick = () => window.location.href = "/admin/ajout";
        navbar.appendChild(btn);
    }
}

// === NON CONNECTÉ ===
if (!userId) {
    dropdown.style.display = "none";
    userBtn.onclick = () => (window.location.href = "/connexion");
}

// === CONNECTÉ ===
else {
    userLabel.textContent = userId;
    userLabel.style.color = "#4fd3ff";
    userIcon.style.color = "#4fd3ff";

    userBtn.onclick = () => {
        dropdown.classList.toggle("open");
    };

    document.getElementById("logoutBtn").onclick = () => {
        localStorage.clear();
        window.location.href = "/";
    };

    if (userType === "administrateur") {
        enableAdminUI();
    }
}

// === FERMETURE DU MENU SI CLIC EXTERIEUR ===
document.addEventListener("click", (e) => {
    if (!dropdown.contains(e.target) && !userBtn.contains(e.target)) {
        dropdown.classList.remove("open");
    }
});


// =============================================================
// === 🔍 AUTOCOMPLÉTION & RECHERCHE NAVBAR ===
// =============================================================

const navInput = document.querySelector(".nav-input");
const navForm = document.getElementById("nav-search");
const suggestionsBox = document.getElementById("nav-suggestions");

let typingTimer = null;


// === AUTOCOMPLÉTION ===
navInput.addEventListener("input", () => {
    const query = navInput.value.trim();

    clearTimeout(typingTimer);

    if (query.length < 2) {
        suggestionsBox.innerHTML = "";
        suggestionsBox.style.display = "none";
        return;
    }

    typingTimer = setTimeout(() => fetchSuggestions(query), 130);
});


// === API suggestions ===
async function fetchSuggestions(query) {
    try {
        const res = await fetch(`/api/search/suggestions?query=${encodeURIComponent(query)}`);
        const suggestions = await res.json();

        if (!suggestions || suggestions.length === 0) {
            suggestionsBox.innerHTML = "";
            suggestionsBox.style.display = "none";
            return;
        }

        suggestionsBox.innerHTML = "";
        suggestionsBox.style.display = "block";

        suggestions.forEach(word => {
            const div = document.createElement("div");
            div.classList.add("suggestion-item");
            div.textContent = word;

            div.onclick = () => {
                navInput.value = word;
                suggestionsBox.style.display = "none";
                window.location.href = `/recherche?q=${encodeURIComponent(word)}`;
            };

            suggestionsBox.appendChild(div);
        });

    } catch (err) {
        console.error("Erreur suggestions :", err);
    }
}


// === Recherche via la loupe ===
navForm.addEventListener("submit", (e) => {
    e.preventDefault();

    const query = navInput.value.trim();

    if (query.length > 0) {
        suggestionsBox.style.display = "none";
        window.location.href = `/recherche?q=${encodeURIComponent(query)}`;
    }
});


// === Fermer les suggestions hors clic ===
document.addEventListener("click", (e) => {
    const clickedInsideSearch = navForm.contains(e.target);
    if (!clickedInsideSearch) {
        suggestionsBox.style.display = "none";
    }
});
