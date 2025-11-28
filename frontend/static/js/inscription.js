async function handleRegister(event) {
    event.preventDefault();

    const identifiant = document.getElementById("identifiant").value.trim();
    const email = document.getElementById("email").value.trim();
    const prenom = document.getElementById("prenom").value.trim();
    const nom = document.getElementById("nom").value.trim();
    const adresse = document.getElementById("adresse").value.trim();
    const telephone = document.getElementById("telephone").value.trim();
    const password = document.getElementById("password").value.trim();
    const confirm = document.getElementById("confirm").value.trim();
    const msg = document.getElementById("registerMessage");

    if (password !== confirm) {
        msg.textContent = "Les mots de passe ne correspondent pas.";
        msg.style.color = "red";
        return;
    }

    const payload = {
        identifiant,
        email,
        mdp: password,
        prenom,
        nom,
        adresse,
        telephone
    };

    const response = await fetch("/api/auth/register", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload)
    });

    const data = await response.json();

    if (!response.ok) {
        msg.textContent = data.detail;
        msg.style.color = "orange";
        return;
    }

    msg.textContent = "Compte créé avec succès !";
    msg.style.color = "lime";

    setTimeout(() => {
        window.location.href = "/connexion";
    }, 1500);
}

document.getElementById("registerForm")
        .addEventListener("submit", handleRegister);
