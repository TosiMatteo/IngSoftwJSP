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
          <label for="formOptions1">Tematica</label>
          <select id="formOptions1" name="selectTematica" required>
            <option value="" disabled selected>Seleziona</option>
            <option value="Funzioni del sito">Funzioni del sito</option>
            <option value="Gestione dell'account">Gestione dell'account</option>
            <option value="Privacy, sicurezza e report">Privacy, sicurezza e report</option>
            <option value="Condizioni e normative">Condizioni e normative</option>
          </select>
        </div>
        <div class="inputForm">
          <label for="formOptions2">Argomento</label>
          <select id="formOptions2" name="selectArgomento" required>
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
        <div class="inputForm100">
          <label for="formFile">Allegato (facoltativo)</label>
          <input type="file" id="formFile" name="file" accept="image/*" aria-label="Carica un file immagine se necessario">
        </div>
      </fieldset>

      <div class="checkContainer">
        <span class="bold">Informativa al trattamento dei dati personali</span>
        <p>I dati che stai fornendo saranno trattati da Code Crusaders in linea con quanto indicato nell' <a href="https://www.codecrusaders.com/informativa-privacy" class="linkPrivacy">Informativa</a> sul trattamento dei dati personali.</p>
        <div class="containerCheckbox">
          <input type="checkbox" id="formCheck" name="check" required value="check" aria-label="Accetta i termini e le condizioni"/>
          <label for="formCheck">Ho preso visione dell' Informativa e do il consenso.</label>
        </div>
      </div>

      <!-- Pulsante invia -->
      <input type="submit" value="Invia la tua richiesta">
    </form>

    <!-- Div per il messaggio di conferma -->
    <div id="successMessage">
      Richiesta presa in carico con successo!
    </div>

  </section>
</main>

<%@ include file="../include/Footer.inc" %>

<script>
  // Aggiunge un listener per l'evento di invio del modulo
  document.getElementById('form').addEventListener('submit', function(event) {
    // Previene l'invio predefinito del modulo (cioè il ricaricamento della pagina)
    event.preventDefault();

    // Crea un oggetto 'userData' con i dati dell'utente inseriti nel modulo
    const userData = {
      firstname: document.getElementById('formNome').value, // Nome
      surname: document.getElementById('formCognome').value, // Cognome
      email: document.getElementById('formEmail').value,     // Email
      phone: document.getElementById('formCellulare').value   // Numero di cellulare
    };

    // Crea un oggetto 'ticketData' con i dati del ticket
    const ticketData = {
      topic: document.getElementById('formOptions1').value, // Argomento del ticket
      argument: document.getElementById('formOptions2').value, // Dettaglio del ticket
      detail: document.getElementById('formMessage').value     // Messaggio dettagliato
    };

    // Invia i dati dell'utente al server per la creazione o verifica
    fetch('http://localhost:8080/api/users', {
      method: 'POST', // Metodo di richiesta POST
      headers: {
        'Content-Type': 'application/json' // Tipo di contenuto JSON
      },
      body: JSON.stringify(userData) // Converti 'userData' in stringa JSON
    })
            .then(response => {
              // Controlla il codice di stato della risposta
              if (response.status === 999) {
                return response.text(); // Se l'utente esiste, restituisce l'ID dell'utente come testo
              } else if (response.status === 201) {
                return response.json(); // Se l'utente è stato creato, restituisce l'oggetto utente
              } else {
                // Se il codice di stato non è 999 né 201, genera un errore
                throw new Error('Errore nella risposta del server: ' + response.status);
              }
            })
            .then(data => {
              let userId; // Variabile per memorizzare l'ID dell'utente
              if (typeof data === 'string') {
                userId = data; // Se la risposta è una stringa, è l'ID dell'utente esistente
              } else {
                userId = data.id; // Altrimenti, ottieni l'ID dal nuovo oggetto utente
              }

              // Controlla se userId è valido
              if (!userId) {
                console.error('Errore: userId non valido:', userId); // Logga un errore se userId non è valido
                return; // Esci dalla funzione se userId non è valido
              }

              // Aggiungi l'ID dell'utente all'oggetto 'ticketData'
              ticketData.user = { id: userId };

              // Invia i dati del ticket al server
              fetch('http://localhost:8080/api/tickets', {
                method: 'POST', // Metodo di richiesta POST
                headers: {
                  'Content-Type': 'application/json' // Tipo di contenuto JSON
                },
                body: JSON.stringify(ticketData) // Converti 'ticketData' in stringa JSON
              })
                      .then(ticketResponse => {
                        // Controlla se la risposta è corretta
                        if (!ticketResponse.ok) {
                          throw new Error('Errore durante la creazione del ticket: ' + ticketResponse.status);
                        }
                        console.log('Ticket creato con successo'); // Messaggio di successo
                        document.getElementById('form').reset(); // Ripristina il modulo
                        document.getElementById('successMessage').style.display = 'block'; // Mostra il messaggio di successo
                        setTimeout(() => {
                          document.getElementById('successMessage').style.display = 'none'; // Nascondi il messaggio dopo 5 secondi
                        }, 5000);
                      })
                      .catch(error => {
                        console.error('Errore nella creazione del ticket:', error); // Logga un errore se la creazione del ticket fallisce
                      });
            })
            .catch(error => {
              console.error('Errore:', error); // Logga un errore se la richiesta iniziale fallisce
            });
  });
  /*
  Spiegazione generale

  Invio del modulo: Quando il modulo viene inviato, il codice previene il comportamento predefinito (il ricaricamento della pagina).
  Raccolta dati: Vengono raccolti i dati dell'utente e del ticket dai campi del modulo.
  Invio dei dati: I dati dell'utente vengono inviati al server.
  A seconda della risposta, viene gestita la logica per determinare se l'utente esiste già o se è stato creato un nuovo utente.
  Creazione del ticket: Dopo aver ottenuto un userId valido, il codice invia i dati del ticket al server e gestisce la risposta, mostrando un messaggio di successo se il ticket è creato con successo.
   */
</script>

</body>
</html>
