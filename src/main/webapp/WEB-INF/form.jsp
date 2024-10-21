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

<!-- Contenuto principale -->
<main class="thq-section-padding">
  <section class="thq-flex-column thq-section-max-width">

    <!-- Titoli principali della sezione -->
    <header class="sectionTitle">
      <h1>Contattaci</h1>
      <h2>Descrivici la tua esigenza! Ti risponderemo nel minor tempo possibile</h2>
    </header>

    <!-- Form contatto -->
    <form id="form" name="form" method="post" action="/api/users">

    <!-- Raggruppamento di input correlati -->
      <fieldset class="container">
        <legend>Dati Personali</legend>
        <div class="inputForm">
          <label for="formNome">Nome</label>
          <input type="text" id="formNome" name="nome" required maxlength="15" aria-label="Inserisci il tuo nome">
        </div>
        <div class="inputForm">
          <label for="formCognome">Cognome</label>
          <input type="text" id="formCognome" name="cognome" required maxlength="15" aria-label="Inserisci il tuo cognome">
        </div>
      </fieldset>

      <fieldset class="container">
        <legend>Contatti</legend>
        <div class="inputForm">
          <label for="formEmail">Email</label>
          <input type="email" id="formEmail" name="email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" required maxlength="30" aria-label="Inserisci il tuo indirizzo email">
        </div>
        <div class="inputForm">
          <label for="formCellulare">Cellulare</label>
          <input type="tel" id="formCellulare" name="tel" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" maxlength="12" placeholder="123-456-7890" aria-label="Inserisci il tuo numero di cellulare">
        </div>
      </fieldset>

      <fieldset class="container">
        <legend>Selezioni</legend>
        <div class="inputForm">
          <label for="formTopic">Tematica</label>
          <select id="formTopic" name="selectTematica" required>
            <option value="" disabled selected>Seleziona</option>
            <option value="Funzioni del sito">Funzioni del sito</option>
            <option value="Gestione dell'account">Gestione dell'account</option>
            <option value="Privacy, sicurezza e report">Privacy, sicurezza e report</option>
            <option value="Condizioni e normative">Condizioni e normative</option>
          </select>
        </div>
        <div class="inputForm">
          <label for="formArgument">Argomento</label>
          <select id="formArgument" name="selectArgomento" required>
            <option value="" disabled selected>Seleziona</option>
            <option value="Il tuo profilo">Il tuo profilo</option>
            <option value="Aggiunta di amici">Aggiunta di amici</option>
            <option value="Impostazioni account">Impostazioni account</option>
            <option value="Accesso e download delle tue informazioni">Accesso e download delle tue informazioni</option>
            <option value="La tua privacy">La tua privacy</option>
            <option value="Protezione dell'account">Protezione dell'account</option>
            <option value="Segnalazione di contenuti offensivi">Segnalazione di contenuti offensivi</option>
            <option value="Segnalare un problema">Segnalare un problema</option>
          </select>
        </div>
      </fieldset>

      <fieldset class="container">
        <legend>Dettagli aggiuntivi</legend>
        <div class="inputForm100">
          <label for="formMessage">Aggiungi altri dettagli</label>
          <textarea id="formMessage" name="textarea" required maxlength="500" placeholder="Descrivi il tuo problema" aria-label="Aggiungi ulteriori dettagli sul problema"></textarea>
        </div>
      </fieldset>

      <fieldset class="container">
        <div class="inputForm100">
          <label for="formFile">Allegato (facoltativo)</label>
          <input type="file" id="formFile" name="file" accept="image/*" aria-label="Carica un file immagine se necessario">
        </div>
      </fieldset>

      <fieldset class="checkContainer">
        <span class="bold">Informativa al trattamento dei dati personali</span>
        <p>I dati che stai fornendo saranno trattati da Code Crusaders in linea con quanto indicato nell' <a href="https://www.codecrusaders.com/informativa-privacy" class="linkPrivacy">Informativa</a> sul trattamento dei dati personali.</p>
        <div class="containerCheckbox">
          <input type="checkbox" id="formCheck" name="check" required value="check" aria-label="Accetta i termini e le condizioni"/>
          <label for="formCheck">Ho preso visione dell' Informativa e do il consenso.</label>
        </div>
      </fieldset>

      <!-- Pulsante invia -->
      <input type="submit" value="Invia la tua richiesta" aria-label="Invia la tua richiesta">
    </form>

    <!-- Div per il messaggio di conferma -->
    <div id="successMessage">
      Richiesta presa in carico con successo!
    </div>

  </section>
</main>

<%@ include file="../include/Footer.inc" %>

<script src="../javascript/InsertForm.js"></script>

</body>
</html>
