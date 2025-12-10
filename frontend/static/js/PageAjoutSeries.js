// ----------------------
// Génération auto du nom image
// ----------------------
document.getElementById("titre").addEventListener("input", () => {
    const titre = document.getElementById("titre").value.trim().toLowerCase().replace(/ /g, "_");
    document.getElementById("imageName").value = titre + ".jpg";
});

// ----------------------
// Ajouter des champs dynamiques
// ----------------------
function addRealisateur() {
    document.getElementById("realList").innerHTML += `
        <input type="text" class="realField" placeholder="Nom Prénom">
    `;
}

function addCreateur() {
    document.getElementById("creaList").innerHTML += `
        <input type="text" class="creaField" placeholder="Nom Prénom">
    `;
}

function addActeur() {
    document.getElementById("acteurList").innerHTML += `
        <input type="text" class="acteurField" placeholder="Nom Prénom">
    `;
}

function addSaison() {
    document.getElementById("saisonList").innerHTML += `
        <div class="saisonBloc">
            <input type="number" class="saisonNum" placeholder="Numéro de saison" required>
            <textarea class="saisonDesc" placeholder="Description"></textarea>
        </div>
    `;
}

// ----------------------
// Charger genres depuis BDD
// ----------------------
async function loadGenres() {
    const req = await fetch("/api/genres");
    const genres = await req.json();
    const select = document.getElementById("genreSelect");

    genres.forEach(g => {
        select.innerHTML += `<option value="${g.id_genre}">${g.libelle}</option>`;
    });
}
loadGenres();

// ----------------------
// Soumission du formulaire
// ----------------------
document.getElementById("addSeriesForm").addEventListener("submit", async (e) => {
    e.preventDefault();

    const formData = new FormData();

    formData.append("titre", document.getElementById("titre").value);
    formData.append("description", document.getElementById("description").value);
    formData.append("date_sortie", document.getElementById("date_sortie").value);
    formData.append("image", document.getElementById("imageFile").files[0]);
    formData.append("genre", document.getElementById("genreSelect").value);

    // Réalisateurs / Créateurs / Acteurs
    formData.append("realisateurs", JSON.stringify(
        [...document.querySelectorAll(".realField")].map(x => x.value)
    ));
    formData.append("createurs", JSON.stringify(
        [...document.querySelectorAll(".creaField")].map(x => x.value)
    ));
    formData.append("acteurs", JSON.stringify(
        [...document.querySelectorAll(".acteurField")].map(x => x.value)
    ));

    // Saisons
    const saisons = [];
    document.querySelectorAll(".saisonBloc").forEach(bloc => {
        saisons.push({
            numero: bloc.querySelector(".saisonNum").value,
            description: bloc.querySelector(".saisonDesc").value
        });
    });
    formData.append("saisons", JSON.stringify(saisons));

    const req = await fetch("/api/admin/series/add", {
        method: "POST",
        body: formData
    });

    const res = await req.json();

    const msg = document.getElementById("message");
    msg.textContent = res.message || "Erreur";
    msg.style.color = res.success ? "lightgreen" : "red";
});
