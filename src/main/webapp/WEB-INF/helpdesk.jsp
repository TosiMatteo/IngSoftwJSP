<%@ page import="it.unife.ingsw2024.models.Ticket" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>

<% String menuActiveLink = "homeDesk"; %>

<!DOCTYPE html>
<html lang="it">

<head>
    <%@ include file="../include/Head.inc" %>
    <link rel="stylesheet" href="css/homeDesk.css" type="text/css">

    <style>
        .colourStatus {
            display: inline-block; /* O flex */
            width: 140px; /* Imposta una larghezza fissa */
            text-align: center;
            padding: 5px;
            border-radius: 10px;
            font-weight: bold;
            border: #2F2F2F 2px solid;
        }

        .ticket {
            margin-top: 10px;
        }

        .ticket-container {
            border: #2F2F2F 1px solid;
            border-radius: 10px;
        }


    </style>
    <script>
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
        document.addEventListener("DOMContentLoaded", function() {
    document.querySelectorAll('.ticket').forEach(function(ticket) {
        var status = parseInt(ticket.getAttribute('data-status'));
        var statusText = ticketsStatus(status);
        var statusColor = getStatusColor(status);

        var colourStatusDiv = ticket.querySelector('.colourStatus');
        colourStatusDiv.textContent = statusText;
        colourStatusDiv.style.backgroundColor = statusColor;
    });
});

    </script>
</head>

<body>

<%@ include file="../include/Top_helpdesk.inc" %>

<main>
    <div class="thq-section-padding">
        <div class="thq-flex-column thq-section-max-width">

            <!-- Titolo -->
            <header class="sectionTitle">
                <h1>Richieste FORM</h1>
            </header>

            <!-- Container Filtro + Ticket -->
            <div class="ticket-container">
                <div class="containerFiltro">
                    <img src="../images/filtro.png" alt="Filtra" class="image"/>

                    <label for="ticketFilter"></label>
                    <select id="ticketFilter" name="selectFilter" onchange="filterTickets()">
                        <option value="" disabled selected>Filtra</option>
                        <option value="tutti">Tutti</option>
                        <option value="0">Da visionare</option>
                        <option value="1">In corso</option>
                        <option value="2">Chiuso</option>
                    </select>
                </div>


                <div class="ticketsContainer">
                    <% List<Ticket> tickets = (List<Ticket>) request.getAttribute("tickets");%>
                    <% if (tickets != null) { %>
                    <% for (Ticket ticket : tickets) { %>

                    <!-- Bottone utilizzato per aprire e chiudere il relativo contenuto -->
                    <div class="ticket" data-status="<%=ticket.getProgress()%>">
                        <button class="ticketHeader">
                            <div class="sectionTitle">
                                <h4> Data:<%=ticket.getDate()%>
                                </h4>
                                <h3> Ticket#<%=ticket.getNumber()%>
                                </h3>
                            </div>
                            <div class="colourStatus"></div>
                        </button>

                        <div class="ticketBody">
                            <div class="containerDati">
                                <div class="colonna">
                                    <strong class="strongTitle">Dati personali</strong>
                                    <div class="elencoDati">
                                        <span> Nome: <%= ticket.getUser().getFirstname()%></span>
                                        <span> Cognome: <%=ticket.getUser().getSurname()%> </span>
                                        <span> Email: <%=ticket.getUser().getEmail()%> </span>
                                        <span> Cellulare: <%=ticket.getUser().getPhone()%></span>
                                    </div>
                                </div>
                                <div class="colonna">
                                    <strong class="strongTitle">Richiesta di assistenza</strong>
                                    <div class="elencoDati">
                                        <span>Tematica: <%=ticket.getTopic()%></span>
                                        <span>Argomento: <%= ticket.getArgument()%></span>
                                        <span>Dettagli: <%= ticket.getDetail()%></span>
                                        <span>Allegato: <%= ticket.getImage()%></span>
                                    </div>
                                </div>
                            </div>

                            <label for="textAnswer"></label>
                            <textarea id="textAnswer" name="textarea" required
                                      placeholder="Scrivi la tua risposta qui..."></textarea>

                            <!-- elenco History salvato per ciasun ticket -->
                            <input type="submit" value="Invia" aria-label="Risposta" onclick=""/>

                            <div class="containerHistory">
                                <strong class="strongTitle">History</strong>
                                <img src="../images/history.png" alt="History" class="image"/>
                                <div id="log"></div>
                            </div>

                            <div class="fine">
                                <form action="/api/tickets/update" method="post">
                                    <input type="hidden" name="id" value="<%= ticket.getNumber() %>"/>
                                    <input type="hidden" name="status" value="2"/>
                                    <button type="submit">Chiusura ticket</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <% } %>
                    <% } else { %>
                    <p>Non ci sono ticket da visualizzare</p>
                    <% } %> <!-- fine if -->
                </div>
            </div>
        </div>
    </div>
</main>
<%@ include file="../include/Footer_helpdesk.inc" %>


<script>

    var acc = document.getElementsByClassName("ticketHeader");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function () {
            this.classList.toggle("active");
            var ticketBody = this.nextElementSibling;
            if (ticketBody.style.display === "block") {
                ticketBody.style.display = "none";
            } else {
                ticketBody.style.display = "block";
            }
        });
    }

    function copiaTesto() {
        // Ottieni il valore dal textarea
        let text = document.getElementById("textAnswer").value;
        if (text.trim() === "") return; // Se è vuoto, non fare nulla

        //Il metodo toLocaleString() restituisce un oggetto Date come stringa, utilizzando le impostazioni locali.
        const date = new Date();
        let dateFormatted = date.toLocaleString();

        // Crea una nuova riga per il log (lista) (DOM HTML)
        let newElement = document.createElement("p");
        newElement.textContent = `${dateFormatted}: ${text}`;

        // Aggiungi la nuova riga al log
        document.getElementById("log").appendChild(newElement);

        // Pulisce il campo di input dopo l'invio
        document.getElementById("textAnswer").value = "";
    }

    function cambiaStatoTicket(ticketId, newStatus) {
        // Send the request to the server to change the ticket status
        fetch(`/updateTicketStatus`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ticketId: ticketId, progress: newStatus})
        }).then(response => {
            if (response.ok) {
                // Update the UI to reflect the new status
                let statusElement = document.querySelector(`.ticket[data-id='${ticketId}'] .colourStatus`);
                statusElement.textContent = ticketsStatus(newStatus);
                statusElement.style.backgroundColor = newStatus === 2 ? 'red' : 'green';
            } else {
                console.error('Failed to update ticket status');
            }
        });
    }
</script>
</body>
</html>
