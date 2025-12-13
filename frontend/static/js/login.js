document.getElementById("loginForm").addEventListener("submit", async (e) => {
    e.preventDefault();

    const emailOrId = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value.trim();
    const msg = document.getElementById("loginMessage");

    try {
        const response = await fetch("/api/auth/login", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                identifiant_ou_email: emailOrId,
                mdp: password
            })
        });

        const data = await response.json();

        if (!response.ok) {
            msg.textContent = data.detail || "Erreur";
            msg.style.color = "red";
            return;
        }

        msg.textContent = `Bienvenue, ${data.identifiant}`;
        msg.style.color = "lime";

        //  STOCKAGE EXACT POUR LA NAVBAR ET PROFIL
        localStorage.setItem("user_identifiant", data.identifiant);
        localStorage.setItem("user_type", data.type_utilisateur);

        //  REDIRECTION conditionnelle
        setTimeout(() => {
            if (data.type_utilisateur === "administrateur") {
                window.location.href = "/admin";   // → page admin
            } else {
                window.location.href = "/";        // → page d'accueil
            }
        }, 800);

    } catch (err) {
        msg.textContent = "Erreur serveur.";
        msg.style.color = "orange";
    }
});
