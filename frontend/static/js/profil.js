// Charger les infos utilisateur
async function loadProfile() {

    const userId = localStorage.getItem("user_identifiant");

    // Si utilisateur non connecté → redirection connexion
    if (!userId) {
        window.location.href = "/connexion";
        return;
    }

    try {
        // Récupérer les informations utilisateur
        const response = await fetch(`/api/profil/${userId}`);

        if (!response.ok) {
            alert("Impossible de charger votre profil.");
            return;
        }

        const user = await response.json();

        // Remplissage des champs du formulaire
        document.getElementById("prenom").value = user.prenom || "";
        document.getElementById("nom").value = user.nom || "";
        document.getElementById("email").value = user.email || "";
        document.getElementById("identifiant").value = user.identifiant || "";
        document.getElementById("adresse").value = user.adresse || "";
        document.getElementById("telephone").value = user.telephone || "";

    } catch (err) {
        console.error("Erreur loadProfile :", err);
        alert("Erreur interne lors du chargement du profil.");
    }
}


// Soumettre les modifications
document.getElementById("profile-form").addEventListener("submit", async (e) => {
    e.preventDefault();

    const userId = localStorage.getItem("user_identifiant");

    const updated = {
        prenom: document.getElementById("prenom").value,
        nom: document.getElementById("nom").value,
        email: document.getElementById("email").value,
        adresse: document.getElementById("adresse").value,
        telephone: document.getElementById("telephone").value
    };

    try {
        const response = await fetch(`/api/profil/${userId}`, {
            method: "PUT",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(updated)
        });

        if (response.ok) {
            alert("Modifications enregistrées !");
        } else {
            alert("Erreur lors de l'enregistrement.");
        }

    } catch (err) {
        console.error("Erreur update :", err);
        alert("Erreur interne lors de la mise à jour.");
    }
});


// Appel initial
loadProfile();
