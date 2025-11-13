async function loadAdminTable() {
    const response = await fetch("/static/data/series.json");
    const raw = await response.json();

    // ton JSON est un tableau de tableau → on aplatit
    const series = raw.flat();

    const table = document.getElementById("adminSeriesTable");
    table.innerHTML = "";

    series.forEach(s => {
        const nbSaisons = s.saisons?.length || 0;
        const nbEpisodes = s.saisons?.reduce(
            (total, sa) => total + sa.episodes.length, 0
        ) || 0;

        const tr = document.createElement("tr");

        tr.innerHTML = `
            <td>
                <img src="/static/images/posters_series/${s.image}" class="thumbnail"
                     onerror="this.src='/static/images/posters_series/default.jpg'">
            </td>

            <td>${s.titre}</td>

            <td>${s.genres.join(", ")}</td>

            <td>
                <details class="list-dropdown">
                    <summary>${s.realisateurs.length} réalisateur(s)</summary>
                    <ul>
                        ${s.realisateurs.map(r => `<li>${r.prenom} ${r.nom}</li>`).join("")}
                    </ul>
                </details>
            </td>

            <td>
                <details class="list-dropdown">
                    <summary>${s.createurs.length} créateur(s)</summary>
                    <ul>
                        ${s.createurs.map(r => `<li>${r.prenom} ${r.nom}</li>`).join("")}
                    </ul>
                </details>
            </td>

            <td>
                <details class="list-dropdown">
                    <summary>${s.acteurs.length} acteur(s)</summary>
                    <ul>
                        ${s.acteurs.map(r => `<li>${r.prenom} ${r.nom}</li>`).join("")}
                    </ul>
                </details>
            </td>

            <td>${nbSaisons}</td>
            <td>${nbEpisodes}</td>

            <td>
                <button class="action-btn action-edit" onclick="editSerie(${s.Id_serie})">✏</button>
                <button class="action-btn action-delete" onclick="deleteSerie(${s.Id_serie})">🗑</button>
            </td>
        `;

        table.appendChild(tr);
    });
}

function editSerie(id) {
    alert("Modification de la série ID=" + id);
}

function deleteSerie(id) {
    if (confirm("Supprimer la série " + id + " ?")) {
        alert("Suppression simulée (backend non encore relié).");
    }
}

loadAdminTable();
