async function loadAdminSeries() {
    try {
        const response = await fetch("/api/admin/series/light");

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
                         loading="lazy"
                         onerror="this.src='/static/images/posters_series/default.jpg'">
                </td>

                <td>${s.titre}</td>
                <td>${s.nb_saisons}</td>
                <td>${s.nb_episodes}</td>

                <td>${s.createur ? s.createur : "—"}</td>
                <td>${s.realisateur ? s.realisateur : "—"}</td>
                <td>${s.acteur ? s.acteur : "—"}</td>

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


// ACTIONS ADMIN (modifier / supprimer)

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


// Suppression API
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
