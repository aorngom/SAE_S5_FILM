const serieId = window.location.pathname.split("/").pop();

// Charger les infos de la série
async function loadSerie() {
    try {
        const response = await fetch(`/api/admin/series/${serieId}`);
        const s = await response.json();

        // Champs simples
        document.getElementById("titre").value = s.titre;
        document.getElementById("description").value = s.description || "";
        document.getElementById("date_sortie").value = s.date_sortie || "";
        document.getElementById("image").value = s.image; // 🔥 afficher le vrai nom

        // Genres
        document.getElementById("genresBox").textContent =
            s.genres.length ? s.genres.join(", ") : "Aucun";

        // Réalisateurs
        document.getElementById("realisateursBox").textContent =
            s.realisateurs.length
                ? s.realisateurs.map(r => `${r.prenom} ${r.nom}`).join(", ")
                : "Aucun";

        // Créateurs
        document.getElementById("createursBox").textContent =
            s.createurs.length
                ? s.createurs.map(c => `${c.prenom} ${c.nom}`).join(", ")
                : "Aucun";

        // Acteurs
        document.getElementById("acteursBox").innerHTML =
            s.acteurs.length
                ? s.acteurs.map(a => `${a.prenom} ${a.nom}`).join(", ")
                : "Aucun";

        // Saisons
        document.getElementById("saisonsBox").innerHTML = "";
        s.saisons.forEach(sa => {
            document.getElementById("saisonsBox").innerHTML += `
                <div class="saisonBloc">
                    <p>Saison <b>${sa.numero}</b></p>

                    <div class="episodeList">
                        ${sa.episodes.map(e => `<span>Épisode ${e}</span>`).join(" ")}
                    </div>

                    <button type="button" class="btn-add small" onclick="addEpisodeToExisting(${sa.id_saison})">
                        + Ajouter épisode
                    </button>
                </div>
            `;
        });

        document.getElementById("episodesCount").textContent = s.episodes;

    } catch (err) {
        console.error("Erreur loadSerie():", err);
    }
}


// Ajouter SAISON
async function addSaison() {
    const numero = prompt("Numéro de la nouvelle saison :");

    if (!numero || isNaN(numero)) return;

    const res = await fetch(`/api/admin/series/${serieId}/saisons`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ numero })
    });

    if (res.ok) {
        alert("Saison ajoutée !");
        loadSerie();
    } else {
        alert("Erreur lors de l'ajout de saison.");
    }
}


// Ajouter ÉPISODE dans une saison existante
async function addEpisodeToExisting(idSaison) {
    const numero = prompt("Numéro du nouvel épisode :");

    if (!numero || isNaN(numero)) return;

    const res = await fetch(`/api/admin/saisons/${idSaison}/episodes`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ numero })
    });

    if (res.ok) {
        alert("Épisode ajouté !");
        loadSerie();
    } else {
        alert("Erreur lors de l'ajout d'épisode.");
    }
}


// Enregistrement des MODIFICATIONS
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
            loadSerie();
        } else {
            alert("Erreur lors de l'enregistrement.");
        }

    } catch (err) {
        console.error("Erreur update:", err);
    }
});

loadSerie();
