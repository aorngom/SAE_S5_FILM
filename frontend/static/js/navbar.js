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
