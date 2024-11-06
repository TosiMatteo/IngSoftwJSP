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
    <link rel="stylesheet" href="css/form.css" type="text/css">

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

                    <div class="inputForm">
                    <label for="userName">User Name:</label>
                    <input type="text" id="userName" name="nome" required maxlength="15" aria-label="Inserisci il tuo nome">
                    </div>

                    <div class="inputForm">
                    <label for="userSurname">User Surname:</label>
                    <input type="text" id="userSurname" name="cognome" required maxlength="15" aria-label="Inserisci il tuo cognome">
                    </div>

                    <div class="inputForm">
                    <label for="userEmail">User Email:</label>
                    <input type="email" id="userEmail" name="email" pattern="[a-zA-Z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" required maxlength="30" aria-label="Inserisci il tuo indirizzo email">
                    </div>

                    <div class="inputForm">
                    <label for="phone">Telefono:</label>
                    <input type="tel" id="phone" name="telefono" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required maxlength="12" placeholder="123-456-7890" aria-label="Inserisci il tuo numero di cellulare">
                    </div>

                    <div class="inputForm">
                    <label for="topic">Tematica:</label>
                    <select id="topic" name="selectTematica" required>
                        <!-- Opzioni selezionabili -->
                        <option value="" disabled selected>Seleziona</option>
                        <option value="Funzioni del sito">Funzioni del sito</option>
                        <option value="Gestione dell'account">Gestione dell'account</option>
                        <option value="Privacy e sicurezza">Privacy e sicurezza</option>
                        <option value="Normative e segnalazioni">Normative e segnalazioni</option>
                    </select>
                    </div>

                    <div class="inputForm">
                    <label for="argument">Argomento:</label>
                    <select id="argument" name="selectArgomento" required>
                        <option value="" disabled selected>Seleziona</option>
                        <option value="Aggiungere amici" data-type="Funzioni del sito">Aggiungere amici</option>
                        <option value="Creare un evento" data-type="Funzioni del sito">Creare un evento</option>
                        <option value="Eliminare un evento" data-type="Funzioni del sito">Eliminare un evento</option>
                        <option value="Accesso e password" data-type="Gestione dell'account">Accesso e password</option>
                        <option value="Impostazioni account" data-type="Gestione dell'account">Impostazioni account</option>
                        <option value="Disattivare o eliminare account" data-type="Gestione dell'account">Disattivare o eliminare account</option>
                        <option value="Accesso e download dei tuoi dati" data-type="Privacy e sicurezza">Accesso e download dei tuoi dati</option>
                        <option value="Protezione dell'account" data-type="Privacy e sicurezza">Protezione dell'account</option>
                        <option value="Richiesta di rimozione legale" data-type="Privacy e sicurezza">Richiesta di rimozione legale</option>
                        <option value="Accesso e download delle nostre normative" data-type="Normative e segnalazioni">Accesso e download delle nostre normative</option>
                        <option value="Segnalare contenuti offensivi" data-type="Normative e segnalazioni">Segnalare contenuti offensivi</option>
                        <option value="Segnalare un problema" data-type="Normative e segnalazioni">Segnalare un problema</option>
                    </select>
                    </div>

                    <div class="inputForm">
                    <label for="detail">Dettagli:</label>
                    <textarea id="detail" name="dettagli" required maxlength="500" placeholder="Descrivi il tuo problema" aria-label="Aggiungi ulteriori dettagli sul problema"></textarea>
                    </div>

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
                                        <% if (ticket.getUser() != null) { %>
                                        <span> Nome: <%=ticket.getUser().getFirstname()%> </span>
                                        <span> Cognome: <%=ticket.getUser().getSurname()%> </span>
                                        <span> Email: <%=ticket.getUser().getEmail()%> </span>
                                        <span> Cellulare: <%=ticket.getUser().getPhone()%></span>
                                        <% } else { %>
                                        <span> Nome: N/A </span>
                                        <span> Cognome: N/A </span>
                                        <span> Email: N/A </span>
                                        <span> Cellulare: N/A </span>
                                        <% } %>
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
