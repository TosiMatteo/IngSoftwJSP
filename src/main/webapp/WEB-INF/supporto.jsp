<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false"%>

<% String menuActiveLink = "homeDesk"; %>

<!DOCTYPE html>
<html lang="it">

<head>
    <%@ include file="../include/Head.inc" %>
    <link rel="stylesheet" href="css/supporto.css" type="text/css">
</head>

<body>

<%@ include file="../include/Top.inc" %>

<main>
    <!-- Features1 Section -->
    <section class="features1-padding thq-section-padding">
        <div class="features1-max-width thq-section-max-width">
            <!-- Title and Search Bar -->
            <header class="sectionTitle">
                <h1>Come possiamo aiutarti?</h1>
                <div class="containerBarra">
                    <img src="../images/ricerca.png" alt="Icona di ricerca" class="imageSearch" />
                    <input type="search" name="search" id="search" placeholder="Cerca negli articoli dell’assistenza..." />
                </div>
            </header>

            <!-- Popular Topics -->
            <article class="features-container-arg">
                <h2 class="h2Feature">Argomenti popolari</h2>
                <div class="thq-grid-3">
                    <button onclick="document.location='https://www.codecrusaders.com/gestione-account/impostazioni-account'" class="buttonFeatureArg">
                        <img src="../images/account.png" alt="Impostazioni Account" class="imagefeature" />
                        <h4>Impostazioni Account</h4>
                        <span class="textButton">Modifica le impostazioni, gestisci le notifiche, scopri di più sulle modifiche al nome e altro ancora</span>
                    </button>

                    <button onclick="document.location='https://www.codecrusaders.com/gestione-account/accesso'" class="buttonFeatureArg">
                        <img src="../images/chiave.png" alt="Accesso e Password" class="imagefeature" />
                        <h4>Accesso e Password</h4>
                        <span class="textButton">Risolvi i problemi di accesso e scopri come modificare o reimpostare la password</span>
                    </button>

                    <button onclick="document.location='https://www.codecrusaders.com/privacy-sicurezza-report/privacy'" class="buttonFeatureArg">
                        <img src="../images/lucchetto.png" alt="Privacy e Sicurezza" class="imagefeature" />
                        <h4>Privacy e Sicurezza</h4>
                        <span class="textButton">Controlla chi può vedere quello che condividi e garantisci maggiore protezione</span>
                    </button>

                    <button onclick="document.location='https://www.codecrusaders.com/funzioni-del-sito/notifiche'" class="buttonFeatureArg">
                        <img src="../images/notifica.png" alt="Notifiche" class="imagefeature" />
                        <h4>Notifiche</h4>
                        <span class="textButton">Scegli quali notifiche vuoi ricevere</span>
                    </button>

                    <button onclick="document.location='https://www.codecrusaders.com/funzioni-del-sito/eventi'" class="buttonFeatureArg">
                        <img src="../images/evento.png" alt="Eventi" class="imagefeature" />
                        <h4>Eventi</h4>
                        <span class="textButton">Crea un evento, controlla chi vede il tuo evento o vi partecipa</span>
                    </button>

                    <button onclick="document.location='https://www.codecrusaders.com/funzioni-del-sito/gruppi'" class="buttonFeatureArg">
                        <img src="../images/gruppo.png" alt="Gruppi" class="imagefeature" />
                        <h4>Gruppi</h4>
                        <span class="textButton">Scopri come creare, gestire e utilizzare i gruppi</span>
                    </button>
                </div>
            </article>

            <!-- FAQ Button -->
            <div class="containerButton">
                <button onclick="document.location='https://www.codecrusaders.com/faq'" class="buttonFeatureFaq">
                    Vai a tutte le Domande Frequenti
                </button>
            </div>

            <hr />
        </div>
    </section>

    <!-- Features2 Section -->
    <section class="features2-padding thq-section-padding">
        <div class="features2-max-width thq-section-max-width">
            <header class="sectionTitle2">
                <h2 class="h2Feature">Non hai risolto il tuo problema?</h2>
                <h3>Contattaci scegliendo una delle modalità elencate. Riceverai le informazioni e l'assistenza richiesta.</h3>
            </header>

            <!-- Contact Options -->
            <article class="thq-grid-3-secondo">
                <div class="containerLink">
                    <img src="../../images/modulo.png" alt="Modulo di contatto" class="imagelinkpag" />
                    <span class="textButton">Compila il modulo e invialo online</span>
                    <button onclick="document.location='form'" class="buttonFeaturePag">Scrivici</button>
                </div>

                <div class="containerLink">
                    <img src="../../images/chat.png" alt="Chatta con noi" class="imagelinkpag" />
                    <span class="textButton">Parla con il nostro team del Servizio clienti via chat</span>
                    <button onclick="document.location='chatta_con_noi'" class="buttonFeaturePag">Chatta con noi</button>
                </div>

                <div class="containerLink">
                    <img src="../../images/email.png" alt="Contattaci via email" class="imagelinkpag" />
                    <span class="textButton">Contattaci direttamente via posta elettronica</span>
                    <button onclick="document.location='mailto:supporto@codecrusaders.it?subject=Qui%20metti%20oggetto%20&cc=esempio2@email.com&body=Qui%20metti%20messaggio'" class="buttonFeaturePag">Email</button>
                </div>

                <div class="containerLink">
                    <span class="textButton">PAUL CODIO</span>
                    <button onclick="document.location='homeDesk'" class="buttonFeaturePag">tenico</button>
                </div>
            </article>
        </div>
    </section>

</main>

<%@ include file="../include/Footer.inc" %>

</body>
</html>
