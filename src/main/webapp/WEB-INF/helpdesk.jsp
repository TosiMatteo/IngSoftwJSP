<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false"%>

<% String menuActiveLink = "HomeDesk"; %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pagina tecnico-Ticket</title>
    <%@ include file="../include/Head.inc" %>
    <style>
        /* Stili di base per i ticket e gli elementi */
        .ticket-container {
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
        }

        .ticket {
            background-color: #f4f4f4;
            border: 1px solid #ccc;
            margin: 10px 0;
            padding: 10px;
            cursor: pointer;
        }

        .ticket.expanded {
            background-color: #fff;
        }

        .ticket-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .ticket-header h3 {
            margin: 0;
        }

        .status {
            padding: 5px 10px;
            border-radius: 5px;
            color: white;
        }

        .status.da-visionare {
            background-color: red;
        }

        .status.in-corso {
            background-color: yellow;
            color: black;
        }

        .status.chiuso {
            background-color: green;
        }

        .ticket-body {
            display: none;
            margin-top: 10px;
        }

        .ticket-body textarea {
            width: 100%;
            height: 100px;
        }

        /* Icona di filtro */
        .filter-icon {
            cursor: pointer;
            margin-bottom: 20px;
        }

    </style>
    <script>
        // Script per gestire l'espansione dei ticket
        function toggleTicket(ticketId) {
            var ticket = document.getElementById(ticketId);
            var body = ticket.querySelector('.ticket-body');
            if (body.style.display === 'block') {
                body.style.display = 'none';
                ticket.classList.remove('expanded');
            } else {
                body.style.display = 'block';
                ticket.classList.add('expanded');
            }
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
</head>
<body>
<!-- header -->
<%@ include file="../include/Top.inc" %>

<div class="ticket-container">
    <div class="filter-icon">
        <label for="ticketFilter">Filtra per stato:</label>
        <select id="ticketFilter" onchange="filterTickets()">
            <option value="all">Tutti</option>
            <option value="da-visionare">Da Visionare</option>
            <option value="in-corso">In Corso</option>
            <option value="chiuso">Chiuso</option>
        </select>
    </div>

    <c:forEach var="ticket" items="${tickets}">
        <div class="ticket" id="ticket_${ticket.id}" data-status="${ticket.stato}" onclick="toggleTicket('ticket_${ticket.id}')">
            <div class="ticket-header">
                <h3>TICKET #${ticket.id} - ${ticket.data}</h3>
                <div class="status ${ticket.stato}">
                    <c:choose>
                        <c:when test="${ticket.stato == 'da-visionare'}">Da Visionare</c:when>
                        <c:when test="${ticket.stato == 'in-corso'}">In Corso</c:when>
                        <c:when test="${ticket.stato == 'chiuso'}">Chiuso</c:when>
                    </c:choose>
                </div>
            </div>
            <div class="ticket-body">
                <div><strong>Nome:</strong> ${ticket.nome}</div>
                <div><strong>Cognome:</strong> ${ticket.cognome}</div>
                <div><strong>Email:</strong> ${ticket.email}</div>
                <div><strong>Numero di cellulare:</strong> ${ticket.numeroCellulare}</div>
                <div><strong>Richiesta di assistenza:</strong> ${ticket.descrizione}</div>
                <textarea placeholder="Scrivi la tua risposta qui..."></textarea>
                <button onclick="submitResponse(${ticket.id})">Invia</button>
            </div>
        </div>
    </c:forEach>
</div>


    <%@ include file="../include/Footer.inc" %>


<script>
    // Funzione per inviare la risposta al controller (implementare logica)
    function submitResponse(ticketId) {
        // Recupera il contenuto del campo di testo
        var textarea = document.querySelector('#ticket_' + ticketId + ' textarea');
        var response = textarea.value;

        // Logica per inviare la risposta al server tramite form o AJAX
        console.log("Risposta per il ticket " + ticketId + ": " + response);
    }
</script>
</body>
</html>
