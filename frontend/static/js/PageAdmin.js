// Charger la liste des séries dans le tableau admin
async function loadAdminSeries() {
    try {
        const response = await fetch("/api/admin/series");

        if (!response.ok) {
            console.error("Erreur API :", response.status);
            return;
        }

        const data = await response.json();
        const series = data.series;

        const table = document.getElementById("adminSeriesTable");
        table.innerHTML = "";

        series.forEach(s => {

            const img = s.image ? s.image : "default.jpg";

            const row = document.createElement("tr");

            row.innerHTML = `
                <td>
                    <img src="/static/images/posters_series/${img}"
                         class="admin-img"
                         onerror="this.src='/static/images/posters_series/default.jpg'">
                </td>

                <td>${s.titre}</td>

                <!-- GENRES -->
                <td>${s.genres.length > 0 ? s.genres.join(", ") : "Aucun"}</td>

                <!-- REALISATEURS -->
                <td>
                    <details class="list-dropdown">
                        <summary>
                            ${s.realisateurs.length > 0
                                ? `${s.realisateurs[0].prenom} ${s.realisateurs[0].nom}`
                                : "Aucun"}
                        </summary>
                        <ul>
                            ${s.realisateurs.length > 0
                                ? s.realisateurs.map(r => `<li>${r.prenom} ${r.nom}</li>`).join("")
                                : "<li>Aucun</li>"}
                        </ul>
                    </details>
                </td>

                <!-- CREATEURS -->
                <td>
                    <details class="list-dropdown">
                        <summary>
                            ${s.createurs.length > 0
                                ? `${s.createurs[0].prenom} ${s.createurs[0].nom}`
                                : "Aucun"}
                        </summary>
                        <ul>
                            ${s.createurs.length > 0
                                ? s.createurs.map(c => `<li>${c.prenom} ${c.nom}</li>`).join("")
                                : "<li>Aucun</li>"}
                        </ul>
                    </details>
                </td>

                <!-- ACTEURS -->
                <td>
                    <details class="list-dropdown">
                        <summary>
                            ${s.acteurs.length > 0
                                ? `${s.acteurs[0].prenom} ${s.acteurs[0].nom}`
                                : "Aucun"}
                        </summary>
                        <ul>
                            ${s.acteurs.length > 0
                                ? s.acteurs.map(a => `<li>${a.prenom} ${a.nom}</li>`).join("")
                                : "<li>Aucun</li>"}
                        </ul>
                    </details>
                </td>

                <!-- SAISONS -->
                <td>${s.saisons.length}</td>

                <!-- ÉPISODES -->
                <td>${s.episodes_count}</td>

                <td>
                    <button class="action-btn action-edit" data-id="${s.id_serie}">
                        Modifier
                    </button>

                    <button class="action-btn action-delete" data-id="${s.id_serie}">
                        Supprimer
                    </button>
                </td>
            `;

            table.appendChild(row);
        });

        addAdminActions();

    } catch (err) {
        console.error("Erreur JS :", err);
    }
}

loadAdminSeries();


// ========= ====
// ACTIONS ADMIN
// =============

// Boutons Modifier / Supprimer
function addAdminActions() {
    document.querySelectorAll(".action-edit").forEach(btn => {
        btn.addEventListener("click", () => {
            const id = btn.dataset.id;
            window.location.href = `/admin/serie/${id}`;
        });
    });

    document.querySelectorAll(".action-delete").forEach(btn => {
        btn.addEventListener("click", async () => {
            const id = btn.dataset.id;
            if (confirm("Voulez-vous vraiment supprimer cette série ?")) {
                await deleteSeries(id);
                loadAdminSeries(); 
            }
        });
    });
}


// ========= ====
// Suppression API
// =============

async function deleteSeries(id) {
    const response = await fetch(`/api/admin/series/${id}`, {
        method: "DELETE"
    });

    if (!response.ok) {
        alert("Erreur lors de la suppression !");
        return;
    }

    alert("Série supprimée !");
}
