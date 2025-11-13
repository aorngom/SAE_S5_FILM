// === MENU BURGER ===
const burger = document.getElementById("burger");
const drawer = document.getElementById("nav-drawer");

burger.addEventListener("click", () => {
  drawer.classList.toggle("open");
});

// === ELEMENTS UTILISATEUR ===
const userBtn = document.getElementById("userBtn");
const userLabel = document.getElementById("userLabel");
const userIcon = document.getElementById("userIcon");
const dropdown = document.getElementById("userDropdown");

// === RECUPERATION LOCALSTORAGE ===
const userId = localStorage.getItem("user_identifiant");
const userType = localStorage.getItem("user_type"); // clé déjà définie lors de la connexion

// --- FONCTION : AJOUT DE LA SECTION ADMIN SI ADMIN CONNECTÉ ---
function enableAdminUI() {
    const drawerList = document.querySelector(".drawer-list");

    // Vérifie qu'on n'a pas déjà ajouté le lien
    if (!document.getElementById("adminLink")) {
        const adminItem = document.createElement("li");
        adminItem.innerHTML = `<a href="/admin" class="drawer-link" id="adminLink">Admin</a>`;
        drawerList.appendChild(adminItem);
    }

    // Ajout du bouton "Ajouter une série" dans la navbar
    if (!document.getElementById("addSerieBtn")) {
        const navbar = document.querySelector(".navbar");

        const btn = document.createElement("button");
        btn.id = "addSerieBtn";
        btn.classList.add("nav-btn");
        btn.style.background = "#c62828";
        btn.style.color = "white";
        btn.style.fontWeight = "600";
        btn.style.marginLeft = "10px";
        btn.textContent = "Ajouter une série";
        btn.onclick = () => (window.location.href = "/admin/ajout");

        navbar.appendChild(btn);
    }
}

// === SI NON CONNECTÉ ===
if (!userId) {
    userBtn.onclick = () => window.location.href = "/connexion";
    dropdown.style.display = "none"; 
}

// === SI CONNECTÉ ===
else {
    userLabel.textContent = userId;   // On remplace "Connexion" par l'identifiant
    userLabel.style.color = "#4fd3ff";
    userIcon.style.color = "#4fd3ff";

    // Dropdown utilisateur
    userBtn.onclick = () => {
        dropdown.classList.toggle("open");
    };

    // Déconnexion
    document.getElementById("logoutBtn").onclick = () => {
        localStorage.clear();
        window.location.href = "/";
    };

    // Activation des options Admin
    if (userType === "administrateur") {
        enableAdminUI();
    }
}

// === FERMER DROPDOWN SI CLIC EXTERIEUR ===
document.addEventListener("click", (e) => {
    if (!dropdown.contains(e.target) && !userBtn.contains(e.target)) {
        dropdown.classList.remove("open");
    }
});
