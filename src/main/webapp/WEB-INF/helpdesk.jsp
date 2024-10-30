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

<!------------------------------------------ Contenuto principale: MAIN ------------------------------------------------>
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

                <!-- Bottone utilizzato per aprire e chiudere il relativo contenuto -->
                <button class="ticketHeader">
                    <div class="sectionTitle">
                        <h4> Data:</h4>
                        <h3> TICKET #</h3>
                    </div>

                    <div id="statusDefault" class="statusDefault">Da visionare</div>
                </button>

                <div class="ticketBody">
                    <div class="containerDati">
                        <div class="colonna">
                            <strong class="strongTitle">Dati personali</strong>
                            <div class="elencoDati">
                                <span> Nome:</span>
                                <span> Cognome: </span>
                                <span> Email: </span>
                                <span> Cellulare: </span>
                            </div>
                        </div>
                        <div class="colonna">
                            <strong class="strongTitle">Richiesta di assistenza</strong>
                            <div class="elencoDati">
                                <span>Tematica: </span>
                                <span>Argomento:</span>
                                <span>Dettagli: </span>
                                <span>Allegato: </span>
                            </div>
                        </div>
                    </div>

                    <textarea id="textAnswer" name="textarea" required placeholder="Scrivi la tua risposta qui..."></textarea>

                    <!-- elenco History salvato per ciasun ticket -->
                    <input type="submit" value="Invia" aria-label="Risposta" onclick="copiaTesto(); cambiaStatoTicket()">

                    <div class="containerHistory">
                        <strong class="strongTitle">History</strong>
                        <img src="../images/history.png" alt="History" class="image" />
                    </div>

                    <div id="log"></div>
                </div>

            </div>
        </div>
    </div>
</main>
<%@ include file="../include/Footer_helpdesk.inc" %>

<script src="../javascript/OpeningTicket.js"></script>
<script src="../javascript/StatusTicket.js"></script>
<script src="../javascript/HistoryHelpdesk.js"></script>


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