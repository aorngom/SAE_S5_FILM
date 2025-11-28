async function loadAdminSeries() {
    try {
        const response = await fetch("/api/admin/series");
        const data = await response.json();

        // data.series = tableau de tableaux → on aplatit
        const series = data.series.flat();

        console.log("Nombre de séries chargées :", series.length);

        const table = document.getElementById("adminSeriesTable");
        table.innerHTML = "";

        series.forEach(s => {
            const image = s.image || "default.jpg";

            const row = document.createElement("tr");

            row.innerHTML = `
                <td>
                    <img src="/static/images/posters_series/${image}"
                         class="admin-img"
                         onerror="this.src='/static/images/posters_series/default.jpg'">
                </td>

                <td>${s.titre}</td>

                <td>${s.genres.join(", ")}</td>

                <td>
                    <details class="list-dropdown">
                        <summary>${s.realisateurs[0] ? s.realisateurs[0].prenom + " " + s.realisateurs[0].nom : "Aucun"}</summary>
                        <ul>
                            ${s.realisateurs.map(r =>
                                `<li>${r.prenom} ${r.nom}</li>`
                            ).join("")}
                        </ul>
                    </details>
                </td>

                <td>
                    <details class="list-dropdown">
                        <summary>${s.createurs[0] ? s.createurs[0].prenom + " " + s.createurs[0].nom : "Aucun"}</summary>
                        <ul>
                            ${s.createurs.map(c =>
                                `<li>${c.prenom} ${c.nom}</li>`
                            ).join("")}
                        </ul>
                    </details>
                </td>

                <td>
                    <details class="list-dropdown">
                        <summary>${s.acteurs[0] ? s.acteurs[0].prenom + " " + s.acteurs[0].nom : "Aucun"}</summary>
                        <ul>
                            ${s.acteurs.map(a =>
                                `<li>${a.prenom} ${a.nom}</li>`
                            ).join("")}
                        </ul>
                    </details>
                </td>

                <td>${s.saisons.length}</td>

                <td>${s.saisons.reduce((acc, sa) => acc + sa.episodes.length, 0)}</td>

                <td>
                    <button class="action-btn action-edit">Modifier</button>
                    <button class="action-btn action-delete">Supprimer</button>
                </td>
            `;

            table.appendChild(row);
        });

    } catch (err) {
        console.error("Erreur :", err);
    }
}

loadAdminSeries();
