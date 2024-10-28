/*funzione JS menu di navigazione superiore per smartphone/tablet (apertura verticale) */
function openingMenu() {
    var x = document.getElementById("myLinks");
    if (x.style.display === "flex") {
        x.style.display = "none";
    } else {
        x.style.display = "flex";
    }
}