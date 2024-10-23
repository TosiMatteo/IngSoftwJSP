/*Funzione Javascript fisarmonica (contenuto comprimibile) per ticket
Le fisarmoniche sono utili quando si desidera alternare tra nascondere e mostrare una grande quantità di contenuti:*/
var acc = document.getElementsByClassName("ticketHeader");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var ticketBody = this.nextElementSibling;
        if (ticketBody.style.display === "block") {
            ticketBody.style.display = "none";
        } else {
            ticketBody.style.display = "block";
        }
    });
}