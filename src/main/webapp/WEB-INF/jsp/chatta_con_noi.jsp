<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false"%>

<% String menuActiveLink = "chatta"; %>

<!DOCTYPE html>
<html lang="it">

  <head>
    <title>ChattaConNoi</title>
    <meta charset="utf-8" />

    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Inter:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
          data-tag="font"/>
    <!-- External Style Information-->
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <link href="../css/chatta_con_noi.css" rel="stylesheet" type="text/css">
  </head>

  <body>

  <header class="paddingNavbar">
    <img alt="Logo" src="../images/logoHeader.png" class="logoNavbar" />

    <!--------------------------------- MENU desktop ---------------------------------->

    <!--sezione di navigazione -->
    <nav class="linkNavbar">
      <a href="https://www.codecrusaders.com/home">
        <span class="textNavbar">Home</span>
      </a>
      <a href="https://www.codecrusaders.com/messaggi">
        <span class="textNavbar">Messaggi</span>
      </a>
      <a href="https://www.codecrusaders.com/amici">
        <span class="textNavbar">Amici</span>
      </a>
      <a href="https://www.codecrusaders.com/eventi">
        <span class="textNavbar">Eventi</span>
      </a>
      <a href="https://www.codecrusaders.com/account">
        <span class="textNavbar">Account</span>
      </a>
    </nav>

    <!-------------------------- MENU con logo e icona hamburger (mobile) ----------------------------------------->
    <div class="navbar-burger-menu">
      <!-- SVG scaricato da Google fonts -->
      <svg xmlns="http://www.w3.org/2000/svg"
           height="48px"
           viewBox="0 -960 960 960"
           width="48px"
           fill="#EFEFEF">
        <path d="M120-240v-60h720v60H120Zm0-210v-60h720v60H120Zm0-210v-60h720v60H120Z"/>
      </svg>
    </div>

    <!------------------------- MENU con link e icona x di chiusura (mobile) ------------------------------------->
    <div class="navbar-mobile-menu">
      <div class="navbar-nav">

        <div class="navbar-top">
          <img alt="logo" src="../images/logoHeader.png" class="navbar-logo"/>

          <div class="navbar-close-menu">
            <!-- SVG scaricato da Google fonts -->
            <svg xmlns="http://www.w3.org/2000/svg"
                 height="24px"
                 viewBox="0 -960 960 960"
                 width="24px"
                 fill="#EFEFEF">
              <path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/>
            </svg>
          </div>
        </div>

        <!------------------------- MENU con link e icona x di chiusura (mobile) --------------------------------->
        <nav class="navbar-links-mobile">
          <a href="https://www.codecrusaders.com/home">
            <span class="textNavbar">Home</span>
          </a>
          <a href="https://www.codecrusaders.com/messages">
            <span class="textNavbar">Messaggi</span>
          </a>
          <a href="https://www.codecrusaders.com/friends">
            <span class="textNavbar">Amici</span>
          </a>
          <a href="https://www.codecrusaders.com/events">
            <span class="textNavbar">Event</span>
          </a>
          <a href="https://www.codecrusaders.com/account">
            <span class="textNavbar">Account</span>
          </a>
        </nav>

      </div>
    </div>
  </header>

  <!------------------------------- banner ----------------------------->
  <div class="banner thq-section-padding">
    <div class="thq-flex-column thq-section-max-width">

      <div class="sectionTitle">
        <h1>Chatta con noi</h1>
        <h2>Chiedi aiuto all'operatore di Code Crusaders</h2>
      </div>

      <div class="checkBoxBanner">
        <div class="container">
          <img alt="logo" src="../images/check.png" class="checkBanner" />
            <span class="textBanner">Ottieni supporto immediato</span>
        </div>

        <div class="container">
          <img alt="logo" src="../images/check.png" class="checkBanner" />
            <span class="textBanner">Assistenza dal lunedì al sabato dalle ore 8.00 alle ore 20.00</span>
        </div>

        <div class="container">
          <img alt="logo" src="../images/check.png" class="checkBanner" />
            <span class="textBanner">Ricevi assistenza mirata in base alla tua richiesta</span>
        </div>
      </div>

    </div>

    <div class="imgBanner"></div>

  </div>

<!------------------------------- hero ----------------------------->
    <div class="thq-section-padding">
      <div class="thq-flex-column thq-section-max-width">

        <div class="hero-chat">

          <div class="containerParagrafo">
            <h2 class="titolo">
                Come funziona la chat di Code Crusaders
            </h2>

            <p>
              Entrare in contatto con il mondo di Code Crusaders è semplice e immediato: ti basterà
              <span class="bold">compilare la richiesta</span>
              coi tuoi dati personali e
              <span class="bold">selezionare la tematica</span>
              su cui vuoi ricevere assistenza (specificare Altro se non rientra tra le opzioni).
            </p>
            <p> Successivamente ti basterà
              <span class="bold">cliccare in basso sul pulsante "Inizia chat"</span>
              e utilizzare la nostra live chat per ricevere tutto il supporto di cui hai bisogno.
            </p>
            <p>
              Altrimenti
              <span class="bold">puoi consultare la sezione FAQ</span>
              per avere risposta alle domande più frequenti.
            </p>

            <button onclick="document.location='https://www.codecrusaders.com/faq'" class="buttonFAQ">
              Vai a FAQ - Domande Frequenti
            </button>

            <p>
              Code crusaders si riserva il diritto di terminare la chat in caso di conversazioni che:
            </p>
            <ul>
              <li>Contengano linguaggio volgare, attacchi personali o sessuali, e offese di natura etnica, politica o religiosa;</li>
              <li>Includano spam o link a siti esterni;</li>
              <li>Siano fuori tema;</li>
              <li>Violino il diritto d'autore o utilizzino marchiregistrati senza autorizzazione.</li>
            </ul>

          </div>

          <!-- elemento hr con CSS (mobile) -->
          <hr class="hrDivider">

          <!----------------------- Chat -------------------------------->
          <div class="containerChat">

            <div class="titleChat">
              <h2 class="h2Title">Chatta con noi</h2>
              <img alt="CompanyLogo" src="../images/chatChat.png" class="imgChat"/>
            </div>

            <!-------------------- FORM Chat -------------------------------->
            <form name="formChat" action="" method="post">

              <div class="containerForm">
                <span>
                  Compila la richiesta e avvia la conversazione con l'operatore selezionando "Inizia chat".
                </span>

                <div class="inputChat">
                  <label for="formNome2" >Nome</label>
                  <input type="text" id="formNome2" name="nome" value=""
                         required maxlength="15" class="textinput"/>
                </div>

                <div class="inputChat">
                  <label for="formCognome2" >Cognome</label>
                  <input type="text" id="formCognome2" name="cognome" value=""
                         required maxlength="15" class="textinput"/>
                </div>

                <div class="inputChat">
                  <label for="formEmail2">Email</label>
                  <input type="email" id="formEmail2" value=""
                         pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$"
                         required maxlength="30" class="textinput"/>
                </div>

                <div class="inputChat">
                  <label for="formOptions3" >Tematica</label>
                  <select id="formOptions3" name="tematica" required>
                    <option value="" disabled selected>Seleziona</option>
                    <option value="Option 1">Funzioni del sito</option>
                    <option value="Option 2">Gestione dell'account</option>
                    <option value="Option 3">Privacy, sicurezza e report</option>
                    <option value="Option 4">Condizioni e normative</option>
                    <option value="Option 4">Altro</option>
                  </select>
                </div>

                <div class="containerCheckbox">
                  <input type="checkbox" id="formCheck2" name="check"
                         value="check" required>
                  <label for="formCheck2">
                    Ho preso visione dell'
                    <a href="https://www.codecrusaders.com/informativa-privacy"
                       class="linkPrivacy">Informativa sulla Privacy</a>
                    e compreso che tutte le informazioni che fornirò saranno utilizzate
                    esclusivamente per ottimizzare il supporto offertomi dal Servizio Clienti.
                  </label>
                </div>
              </div>

              <hr>
              <input type="submit" value=" Inizia chat">

            </form>

          </div>
        </div>
      </div>
    </div>


  <!---------------------------------------------------- FOOTER ------------------------------------------------->
  <footer>
    <div class="thq-section-max-width">
      <div class="footer-content">

        <div class="footer-container">
          <img alt="Logo" src="../images/logoHeader.png" class="logoFooter"/>
          <span class="textMotto">
                "La nuova era appartiene ai Code Crusaders: Creatori di possibilità infinite"
              </span>
        </div>

        <div class="footer-menu">
          <div class="footer-column">

            <!-- Definisco testo con forte importanza tag<strong>.
             Il contenuto al suo interno è solitamente visualizzato in grassetto-->
            <strong>Link</strong>
            <div class="footer-links">
              <a href="https://www.codecrusaders.com/home">
                <span class="textFooter">Home</span>
              </a>
              <a href="https://www.codecrusaders.com/messages" >
                <span class="textFooter">Messaggi</span>
              </a>
              <a href="https://www.codecrusaders.com/friends">
                <span class="textFooter">Amici</span>
              </a>
              <a href="https://www.codecrusaders.com/events" >
                <span class="textFooter">Eventi</span>
              </a>
              <a href="https://www.codecrusaders.com/account">
                <span class="textFooter">Account</span>
              </a>
            </div>
          </div>

          <div class="footer-column">
            <strong>Assistenza Clienti</strong>
            <div class="footer-links">
              <a href="https://www.codecrusaders.com/faq">
                <span class="textFooter">FAQ - Domande Frequenti</span>
              </a>
              <a href="https://www.codecrusaders.com/supporto">
                <span class="textFooter">Supporto</span>
              </a>
            </div>
          </div>

          <div class="footer-column">
            <strong>Termini Legali</strong>
            <div class="footer-links">
              <a href="https://www.codecrusaders.com/termini&condizioni">
                <span class="textFooter">Termini &amp; Condizioni</span>
              </a>
              <a href="https://www.codecrusaders.com/informativa-privacy">
                <span class="textFooter">Informativa sulla Privacy</span>
              </a>
              <a href="https://www.codecrusaders.com/cookie">
                <span class="textFooter">Cookie</span>
              </a>
            </div>
          </div>

        </div>
      </div>

      <div class="footerCredits">
        <div class="divider"></div>
        <div>
              <span class="footerContentCredits">
                Copyright ⓒ 2024 Code Crusaders Italia. Tutti i diritti riservati.
              </span>
        </div>
      </div>

    </div>
  </footer>

  <script> </script>
  </body>
</html>