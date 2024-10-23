<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false"%>

<% String menuActiveLink = "homeDesk"; %>

<!DOCTYPE html>
<html lang="it">

<head>
    <%@ include file="../include/Head.inc" %>
    <link rel="stylesheet" href="css/homeDesk.css" type="text/css">
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
                    <img src="../images/filtro.png" alt="Filtra" class="image" />

                    <label for="ticketFilter"></label>
                    <select id="ticketFilter" name="selectFilter" onchange="filterTickets()">
                        <option value="" disabled selected>Filtra</option>
                        <option value="tutti">Tutti</option>
                        <option value="daVisionare">Da visionare</option>
                        <option value="inCorso">In corso</option>
                        <option value="chiuso">Chiuso</option>
                    </select>
                </div>

                <c:forEach var="ticket" items="${tickets}">

                    <!-- Bottone utilizzato per aprire e chiudere il relativo contenuto -->
                    <button class="ticketHeader">

                        <div class="sectionTitle">
                            <h4> Data: ${ticket.data} </h4>
                            <h3> TICKET #${ticket.id} </h3>
                        </div>

                        <div class="status ${ticket.stato}">
                            <c:choose>
                                <c:when test="${ticket.stato == 'daVisionare'}">Da Visionare</c:when>
                                <c:when test="${ticket.stato == 'inCorso'}">In Corso</c:when>
                                <c:when test="${ticket.stato == 'chiuso'}">Chiuso</c:when>
                            </c:choose>
                        </div>

                    </button>

                    <div class="ticketBody">

                        <div class="containerDati">
                            <div class="colonna">
                                <strong class="strongTitle">Dati personali</strong>
                                <div class="elencoDati">
                                    <span> Nome: ${ticket.nome}</span>
                                    <span> Cognome: ${ticket.cognome}</span>
                                    <span> Email: ${ticket.email}</span>
                                    <span> Cellulare: ${ticket.cellulare}
                                </div>
                            </div>

                            <div class="colonna">
                                <strong class="strongTitle">Richiesta di assistenza</strong>
                                <div class="elencoDati">
                                    <span>Tematica: ${ticket.tematica}</span>
                                    <span>Argomento: ${ticket.argomento}</span>
                                    <span>Dettagli: ${ticket.dettagli}</span>
                                    <span>Allegato: ${ticket.allegato}</span>
                                </div>
                            </div>
                        </div>

                        <textarea id="formTicket" name="textarea" required placeholder="Scrivi la tua risposta qui..."></textarea>

                        <input type="submit" value="Invia" aria-label="Risposta">

                        <div class="containerHistory">
                            <strong class="strongTitle">History</strong>
                            <img src="../images/history.png" alt="History" class="image" />
                        </div>

                    </div>

                </c:forEach>

            </div>
        </div>
    </div>
</main>
<%@ include file="../include/Footer_helpdesk.inc" %>

<script src="../javascript/OpeningTicket.js"></script>

<!--
<script>
    // Funzione per inviare la risposta al controller (implementare logica)
    function submitResponse(ticketId) {
        // Recupera il contenuto del campo di testo
        var textarea = document.querySelector('#ticket_' + ticketId + ' textarea');
        var response = textarea.value;

        // Logica per inviare la risposta al server tramite form o AJAX
        console.log("Risposta per il ticket " + ticketId + ": " + response);
    }
        // Script per filtrare i ticket in base allo stato o alla data
        function filterTickets() {
        var filter = document.getElementById('ticketFilter').value;
        var tickets = document.querySelectorAll('.ticket');
        tickets.forEach(function(ticket) {
        var status = ticket.getAttribute('data-status');
        if (filter === 'all' || status === filter) {
        ticket.style.display = 'block';
    } else {
        ticket.style.display = 'none';
    }
    });
    }

</script>
 -->
</body>
</html>