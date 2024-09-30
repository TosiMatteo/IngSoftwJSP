<!DOCTYPE html>
<html lang="it">

  <head>
    <title>Form</title>
    <meta charset="utf-8" />

    <!-- Carattere di Google -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Inter:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
          data-tag="font"/>
    <!-- External Style Information-->
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <link href="../css/form.css" rel="stylesheet" type="text/css">
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
            <path d="M120-240v-60h720v60H120Zm0-210v-60h720v60H120Zm0-210v-60h720v60H120Z"></path>
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
                  <path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"></path>
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

      <!---------------------------------------------- CONTENUTO ----------------------------------------------------->

      <div class="thq-section-padding">
        <div class="thq-flex-column thq-section-max-width">

          <!-- Contenitore titoli -->
          <div class="sectionTitle">
            <h1>Contattaci</h1>
            <h2>Descrivici la tua esigenza! Ti risponderemo nel minor tempo possibile</h2>
          </div>

          <!---------------- FORM ------------------>
          <form name="form" method="post" action="" >

            <div class="container">
              <div class="inputForm">
                <!-- etichetta elemento modulo-->
                <label for="formNome">
                  Nome
                </label>
                <!-- Campo di testo -->
                <input type="text" id="formNome" name="nome"
                       required maxlength="15" value="" >
              </div>
              <div class="inputForm">
                <label for="formCognome">
                  Cognome
                </label>
                <input type="text" id="formCognome" name="cognome"
                       required maxlength="15" value="">
              </div>
            </div>

            <div class="container">
              <div class="inputForm">
                <label for="formEmail">
                  Email
                </label>
                <input type="email" id="formEmail" name="email"
                       pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$"
                       required maxlength="30" value="" >
              </div>
              <div class="inputForm">
                <label for="formCellulare">
                  Cellulare
                </label>
                <input type="tel" id="formCellulare" name="tel"
                  pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" maxlength="12"
                  placeholder="123-456-7890" value="" >
              </div>
            </div>

            <div class="container">
              <div class="inputForm">
                <label for="formOptions1">
                  Tematica
                </label>
                <!--elemento select, definisce un elenco a discesa -->
                <select id="formOptions1" name="selectTematica" required>
                  <!-- opzione che può essere selezionata -->
                  <option value="" disabled selected> Seleziona</option>
                  <option value="Option 1">Funzioni del sito</option>
                  <option value="Option 2">Gestione dell'account</option>
                  <option value="Option 3">Privacy, sicurezza e report</option>
                  <option value="Option 4">Condizioni e normative</option>
                </select>
              </div>
              <div class="inputForm">
                <label for="formOptions2">
                  Argomento
                </label>
                <select id="formOptions2" name="selectArgomento" required>
                  <option value="" disabled selected>Seleziona</option>
                  <option value="Option 1">Il tuo profilo</option>
                  <option value="Option 2">Aggiunta di amici</option>
                  <option value="Option 3">Impostazioni account</option>
                  <option value="Option 4">Accesso e dowload delle tue informazioni</option>
                  <option value="Option 5">La tua privacy</option>
                  <option value="Option 6">Protezione dell'account</option>
                  <option value="Option 7">Segnalazione di contenuti offensivi</option>
                  <option value="Option 8">Segnalare un problema</option>
                </select>
              </div>
            </div>

            <div class="container">
              <div class="inputForm100">
                <label for="formMessage">
                  Aggiungi altri dettagli
                </label>
                <textarea id="formMessage" name="textarea"
                  required maxlength="500"
                  placeholder="Descrivi il tuo problema"></textarea>
              </div>
            </div>

            <div class="container">
              <div class="inputForm100">
                <label for="formFile">
                  Allegato (facoltativo)
                </label>
                <input type="file" id= "formFile" name="file" accept="image/*">
              </div>
            </div>

            <div class="checkContainer">
              <span class="bold">
                Informativa al trattamento dei dati personali
              </span>
              <span>
                I dati che stai fornendo saranno trattati da Code Crusaders in linea con quanto indicato nell'
                <a href="https://www.codecrusaders.com/informativa-privacy"
                   class="linkPrivacy">Informativa</a>
                sul trattamento dei dati personali.
              </span>
              <div class="containerCheckbox">
                <!-- Caselle di controllo -->
                <input type="checkbox" id="formCheck" name="check" required value="check"/>
                <label for="formCheck">
                  Ho preso visione dell' Informativa e do il consenso.
                </label>
              </div>
            </div>

            <!-- Pulsante invia -->
            <input type="submit" value="Invia la tua richiesta">
          </form>

        </div>
      </div>

      <!---------------------------------------------------- FOOTER ------------------------------------------------->
      <%@ include file="../include/footer.inc" %>

  </body>
</html>
