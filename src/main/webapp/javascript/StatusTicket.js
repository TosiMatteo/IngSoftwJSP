function cambiaStatoTicket() {
    // Seleziona l'elemento dove è visualizzato lo stato del ticket
    let status = document.getElementById("statusDefault");

    // Cambia lo stato del ticket in "In Corso" e modifica il colore
    status.textContent = "In Corso";
    status.style.color = "Black";// Cambia il colore a arancione
    status.style.background = "#ffff9e";
}

// Funzione per selezionare le attività in base allo stato
function selectByStatus(status) {
    return tasks.filter(task => task.status === status);
}

