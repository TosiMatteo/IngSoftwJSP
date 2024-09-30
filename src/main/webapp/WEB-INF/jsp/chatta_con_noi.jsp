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

  <%@ include file="../../include/header.inc"%>

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
  <%@ include file="../../include/footer.inc" %>

  </body>
</html>