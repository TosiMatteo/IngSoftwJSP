<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false"%>

<% String menuActiveLink = "Supporto"; %>


<!DOCTYPE html>
<html lang="it">
<head>
    <%@ include file="../../include/htmlHead.inc" %>
    <%@ include file="../../include/linker.inc" %>
</head>

<body>
<div>
    <%@ include file="../../include/header.inc"%>


    <!---------------------Features1 component--------------------------->
    <div class="features1-padding thq-section-padding">
        <div class="features1-max-width thq-section-max-width">

            <!-- Container titolo e barra di ricerca -->
            <div class="sectionTitle">
                <h1>Come possiamo aiutarti?</h1>

                <div class="containerBarra">
                    <img alt="image" src="../../images/ricerca.png" class="imageSearch"/>
                    <input type="search" name="search" placeholder="Cerca negli articoli dell’assistenza..." id="search">
                </div>
            </div>

            <!-- Container titolo e 6 argomenti principali -->
            <div class="features-container-arg">
                <h2 class="h2Feature">Argomenti popolari</h2>

                <!-- Contenitore griglia -->
                <div class="thq-grid-3">
                    <!--Pulsante come collegamento, con codice JavaScript -->
                    <button onclick="document.location='https://www.codecrusaders.com/gestione-account/impostazioni-account'"
                            class="buttonFeatureArg">
                        <img alt="image" src="../../images/account.png" class="imagefeature"/>
                        <h4>Impostazioni Account</h4>
                        <span class="textButton">
                              Modifica le impostazioni, gestisci le notifiche, scopri di più sulle modifiche al nome e altro ancora
                            </span>
                    </button>

                    <button onclick="document.location='https://www.codecrusaders.com/gestione-account/accesso'"
                            class="buttonFeatureArg">
                        <img alt="image" src="../../images/chiave.png" class="imagefeature"/>
                        <h4>Accesso e Password</h4>
                        <span class="textButton">
                              Risolvi i problemi di accesso e scopri come modificare o reimpostare la password
                            </span>
                    </button>

                    <button onclick="document.location='https://www.codecrusaders.com/privacy-sicurezza-report/privacy'"
                            class="buttonFeatureArg">
                        <img alt="image" src="../../images/lucchetto.png" class="imagefeature"/>
                        <h4>Privacy e Sicurezza</h4>
                        <span class="textButton">
                              Controlla chi può vedere quello che condividi e garantisci maggiore protezione
                            </span>
                    </button>

                    <button onclick="document.location='https://www.codecrusaders.com/funzioni-del-sito/notifiche'"
                            class="buttonFeatureArg">
                        <img alt="image" src="../../images/notifica.png" class="imagefeature"/>
                        <h4>Notifiche</h4>
                        <span class="textButton">
                              Scegli quali notifiche vuoi ricevere
                            </span>
                    </button>

                    <button onclick="document.location='https://www.codecrusaders.com/funzioni-del-sito/eventi'"
                            class="buttonFeatureArg">
                        <img alt="image" src="../../images/evento.png" class="imagefeature"/>
                        <h4>Eventi</h4>
                        <span class="textButton">
                                  Crea un evento, controlla chi vede il tuo evento o vi partecipa
                            </span>
                    </button>

                    <button onclick="document.location='https://www.codecrusaders.com/funzioni-del-sito/gruppi'"
                            class="buttonFeatureArg">
                        <img alt="image" src="../../images/gruppo.png" class="imagefeature"/>
                        <h4>Gruppi</h4>
                        <span class="textButton">
                                    Scopri come creare, gestire e utilizzare i gruppi
                            </span>
                    </button>
                </div>
            </div>

            <div class="containerButton">
                <button onclick="document.location='https://www.codecrusaders.com/faq'"
                        class="buttonFeatureFaq">
                    Vai a tutte le Domande Frequenti
                </button>
            </div>

            <!-- divisore -->
            <hr>
        </div>
    </div>

    <!------------------------ Features2 component -------------------------------->
    <div class="features2-padding thq-section-padding">
        <div class="features2-max-width thq-section-max-width">

            <div class="sectionTitle2">
                <h2 class="h2Feature">Non hai risolto il tuo problema?</h2>
                <h3>Contattaci scegliendo una delle modalità elencate.
                    Riceverai le informazioni e l'assistenza richiesta.</h3>
            </div>

            <div class="thq-grid-3-secondo">
                <div class="containerLink">
                    <img alt="image" src="../../images/modulo.png" class="imagelinkpag"/>
                    <span class="textButton">
                            Compila il modulo e invialo online
                        </span>
                    <!--link pagina Form -->
                    <button onclick="redirectTo('form')"
                    class="buttonFeaturePag">
                        Scrivici
                    </button>
                </div>

                <div class="containerLink">
                    <img alt="image" src="../../images/chat.png" class="imagelinkpag"/>
                    <span class="textButton">
                            Parla con il nostro team del Servizio clienti via chat
                        </span>
                    <!--link pagina Chatta con noi -->
                    <button onclick="redirectTo('chatta_con_noi')"
                    class="buttonFeaturePag">
                        Chatta con noi
                    </button>
                </div>

                <div class="containerLink">
                    <img src="../../images/email.png" alt="image" class="imagelinkpag"/>
                    <span class="textButton">
                            Contattaci direttamente via posta elettronica
                        </span>
                    <!--Collegamento a un indirizzo e-mail -->
                    <button onclick="document.location='mailto:supporto@codecrusaders.it?subject=Qui%20metti%20oggetto%20&cc=esempio2@email.com&body=Qui%20metti%20messaggio'"
                            class="buttonFeaturePag">
                        Email
                    </button>
                </div>
            </div>

        </div>
    </div>

    <%@ include file="../../include/footer.inc" %>

</div>

</body>
</html>