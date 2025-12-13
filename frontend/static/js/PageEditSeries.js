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
                ? s.saisons.map(sa => `Saison ${sa.numero} (ID: ${sa.id_saison})`).join("<br>")
                : "Aucune";

        // --- Episodes ---
        document.getElementById("episodesCount").textContent = s.episodes;

    } catch (err) {
        console.error("Erreur loadSerie():", err);
    }
}

// Ajouter une saison
document.getElementById("addSeasonBtn").addEventListener("click", async () => {
    const numero = document.getElementById("newSeason").value;

    if (!numero) return alert("Numéro de saison obligatoire.");

    await fetch(`/api/admin/series/${serieId}/saisons`, {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({ numero })
    });

    alert("Saison ajoutée !");
    loadSerie();
});

// Ajouter un épisode
document.getElementById("addEpisodeBtn").addEventListener("click", async () => {
    const saisonId = document.getElementById("episodeSeasonId").value;
    const numero = document.getElementById("newEpisode").value;

    if (!saisonId || !numero) return alert("ID saison + numéro épisode obligatoires");

    await fetch(`/api/admin/saisons/${saisonId}/episodes`, {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({ numero })
    });

    alert("Épisode ajouté !");
    loadSerie();
});

// Mettre à jour description + date
document.getElementById("editForm").addEventListener("submit", async (e) => {
    e.preventDefault();

    const payload = {
        description: document.getElementById("description").value,
        date_sortie: document.getElementById("date_sortie").value
    };

    const response = await fetch(`/api/admin/series/${serieId}`, {
        method: "PUT",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(payload)
    });

    if (response.ok) {
        alert("Modifications enregistrées !");
    } else {
        alert("Erreur lors de l'enregistrement.");
    }
});

loadSerie();
