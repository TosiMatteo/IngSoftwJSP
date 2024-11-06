<%@ page import="it.unife.ingsw2024.models.Ticket" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>

<% String menuActiveLink = "homeDesk"; %>

<!DOCTYPE html>
<html lang="it">

<head>
    <%@ include file="../include/Head.inc" %>
    <link rel="stylesheet" href="css/helpdesk.css" type="text/css">

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

            <!-- Form per aggiungere un nuovo ticket -->
            <div class="new-ticket-form">
                <h2>Aggiungi un nuovo ticket</h2>
                <form action="api/tickets/addNewTicket" method="post">
                    <label for="userName">User Name:</label>
                    <input type="text" id="userName" name="userName" required>

                    <label for="userSurname">User Surname:</label>
                    <input type="text" id="userSurname" name="userSurname" required>

                    <label for="userEmail">User Email:</label>
                    <input type="email" id="userEmail" name="userEmail" required>

                    <label for="phone">Telefono:</label>
                    <input type="text" id="phone" name="phone" required maxlength="10">

                    <label for="topic">Tematica:</label>
                    <input type="text" id="topic" name="topic" required>

                    <label for="argument">Argomento:</label>
                    <input type="text" id="argument" name="argument" required>

                    <label for="detail">Dettagli:</label>
                    <input type="text" id="detail" name="detail" required maxlength="50">

                    <input type="submit" value="Aggiungi Ticket">
                </form>
            </div>

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
                                <h4> Data:<%=ticket.getDate()%> </h4>
                                <h3> Ticket#<%=ticket.getNumber()%> </h3>
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

                            <form name="updateTicketResponse" id="updateTicketResponse"
                                  action="/api/tickets/updateResponse/<%= ticket.getNumber() %>" method="post">
                                <label for="textAnswer"></label>
                                <textarea id="textAnswer" name="textAnswer" required
                                          placeholder="Scrivi la tua risposta qui..."></textarea>
                                <input type="submit" value="Invia" aria-label="Risposta"/>
                            </form>

                            <!-- elenco History salvato per ciasun ticket -->
                            <article class="containerHistory">
                                <section class="strongTitleHeader">
                                    <strong class="strongTitle">History</strong>
                                    <img src="../images/history.png" alt="History" class="image"/>
                                </section>
                                <!-- <div id="log"></div> -->
                                <div class="elencoHistory">
                                    <span> <b>Data</b>: <%=ticket.getDate()%> </span>
                                    <span> <b>Ticket#</b><%=ticket.getNumber()%> </span>
                                    <span> <b>Stato:</b> <%=ticket.getProgress()%> </span>
                                    <span> <b>Risposta:</b> <%=ticket.getResponse()%> </span>
                                </div>
                            </article>

                            <div class="fine">
                                <form action="/api/tickets/updateStatus/<%= ticket.getNumber() %>" method="post" >
                                    <input type="hidden" name="status" value="2"/>
                                    <button type="submit">Chiusura ticket</button>
                                </form>
                            </div>

                            <div class="fine">
                                <form action="/api/tickets/updateStatus/<%= ticket.getNumber() %>" method="post" >
                                    <input type="hidden" name="status" value="1"/>
                                    <button type="submit">Annulla Chiusura</button>
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
</script>
</body>
</html>
