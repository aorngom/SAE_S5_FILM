const serieId = window.location.pathname.split("/").pop();

// Charger les infos de la série
async function loadSerie() {
    try {
        const response = await fetch(`/api/admin/series/${serieId}`);
        const s = await response.json();

        // --- Champs principaux ---
        document.getElementById("titre").value = s.titre;
        document.getElementById("description").value = s.description || "";
        document.getElementById("date_sortie").value = s.date_sortie || "";
        document.getElementById("image").value = s.image;

        // --- Genres ---
        document.getElementById("genresBox").innerHTML =
            s.genres.length ? s.genres.join(", ") : "Aucun";

        // --- Réalisateurs ---
        document.getElementById("realisateursBox").innerHTML =
            s.realisateurs.length
                ? s.realisateurs.map(r => `${r.prenom} ${r.nom}`).join(", ")
                : "Aucun";

        // --- Créateurs ---
        document.getElementById("createursBox").innerHTML =
            s.createurs.length
                ? s.createurs.map(c => `${c.prenom} ${c.nom}`).join(", ")
                : "Aucun";

        // --- Acteurs ---
        document.getElementById("acteursBox").innerHTML =
            s.acteurs.length
                ? s.acteurs.map(a => `${a.prenom} ${a.nom}`).join(", ")
                : "Aucun";

        // --- Saisons ---
        document.getElementById("saisonsBox").innerHTML =
            s.saisons.length
                ? s.saisons.map(sa => `Saison ${sa.numero_saison}`).join(", ")
                : "Aucune";

        // --- Episodes ---
        document.getElementById("episodesCount").textContent = s.episodes;

    } catch (err) {
        console.error("Erreur loadSerie():", err);
    }
}

// Soumission du formulaire → mise à jour
document.getElementById("editForm").addEventListener("submit", async (e) => {
    e.preventDefault();

    const payload = {
        description: document.getElementById("description").value,
        date_sortie: document.getElementById("date_sortie").value
    };

    try {
        const response = await fetch(`/api/admin/series/${serieId}`, {
            method: "PUT",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(payload)
        });

        if (response.ok) {
            alert("Modifications enregistrées !");
        } else {
            alert("Erreur lors de l'enregistrement.");
        }

    } catch (err) {
        console.error("Erreur update:", err);
    }
});

loadSerie();
