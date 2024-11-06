
function filterTickets() {
    var filter = document.getElementById('ticketFilter').value;
    console.log(filter);
    var tickets = document.querySelectorAll('.ticket');
    tickets.forEach(function (ticket) {
        var status = ticket.getAttribute('data-status');
        console.log("Ticket status:", status);
        if (filter === 'tutti' || status === filter) {
            ticket.style.display = 'block';
        } else {
            ticket.style.display = 'none';
        }
    });
}

function ticketsStatus(id) {
    switch (id) {
        case 0:
            return "Da visionare";
        case 1:
            return "In corso";
        case 2:
            return "Chiuso";
        default:
            return "Errore";
    }
}

function getStatusColor(id) {
    switch (id) {
        case 0:
            return "green";
        case 1:
            return "orange";
        case 2:
            return "red";
        default:
            return "grey";
    }
}

document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll('.ticket').forEach(function (ticket) {
        var status = parseInt(ticket.getAttribute('data-status'));
        var statusText = ticketsStatus(status);
        var statusColor = getStatusColor(status);

        var colourStatusDiv = ticket.querySelector('.colourStatus');
        colourStatusDiv.textContent = statusText;
        colourStatusDiv.style.backgroundColor = statusColor;
    });
});
