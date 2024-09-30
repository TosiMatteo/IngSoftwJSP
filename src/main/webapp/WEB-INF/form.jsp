<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false"%>

<% String menuActiveLink = "Form"; %>

<!DOCTYPE html>
<html lang="it">

  <head>

    <%@ include file="../include/Head.inc"%>
    <link rel="stylesheet" href="css/form.css" type="text/css">
  </head>

  <body>

      <%@include file="../include/Top.inc"%>

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
      <%@ include file="../include/Footer.inc" %>

  </body>
</html>
