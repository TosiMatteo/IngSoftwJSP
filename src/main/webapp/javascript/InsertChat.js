// Aggiunge un listener che attende il caricamento completo del DOM prima di eseguire il codice
document.addEventListener('DOMContentLoaded', function() {

    // Seleziona gli elementi del form per Nome, Cognome, Email, Argomento (Topic) e Dettagli (Argument)
    const nome = document.getElementById('formNome');
    const cognome = document.getElementById('formCognome');
    const email = document.getElementById('formEmail');
    const topic = document.getElementById('formTopic');
    const argument = document.getElementById('formArgument');

    // Controlla se i campi esistono; se uno dei campi non viene trovato, mostra un messaggio di errore nella console
    if (!nome) console.error('Errore: campo Nome non trovato');
    if (!cognome) console.error('Errore: campo Cognome non trovato');
    if (!email) console.error('Errore: campo Email non trovato');
    if (!topic) console.error('Errore: campo Topic non trovato');
    if (!argument) console.error('Errore: campo Argument non trovato');

    // Se tutti i campi sono presenti, aggiunge il listener all'invio del form
    if (nome && cognome && email && topic && argument) {
        document.getElementById('formChat').addEventListener('submit', function (event) {
            // Previene il comportamento predefinito del form (evita il ricaricamento della pagina)
            event.preventDefault();

            // Crea un oggetto 'userData' con i valori inseriti nel modulo per nome, cognome e email
            const userData = {
                firstname: nome.value,
                surname: cognome.value,
                email: email.value
            };

            // Crea un oggetto 'ticketData' con i dettagli del ticket
            const ticketData = {
                topic: topic.value,
                argument: argument.value,
                detail: "ticket creato tramite chat" // Dettaglio aggiuntivo per indicare la creazione via chat
            };

            // Effettua una richiesta POST al server per creare o verificare l'utente
            fetch('http://localhost:8080/api/users', {
                method: 'POST', // Metodo POST per inviare i dati al server
                headers: {
                    'Content-Type': 'application/json' // Specifica il tipo di contenuto JSON
                },
                body: JSON.stringify(userData) // Converte l'oggetto userData in una stringa JSON
            })
                .then(response => {
                    // Se lo stato della risposta è 999, l'utente esiste già e restituisce l'ID
                    if (response.status === 999) {
                        return response.text(); // Restituisce l'ID dell'utente esistente come testo
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
                        userId = data; // Se il dato è una stringa, è l'ID dell'utente esistente
                    } else {
                        userId = data.id; // Se è un oggetto, prendi l'ID dal nuovo utente creato
                    }

                    // Controlla se l'ID dell'utente è valido
                    if (!userId) {
                        console.error('Errore: userId non valido:', userId); // Mostra un errore se userId è nullo o indefinito
                        return; // Esci dalla funzione
                    }

                    // Aggiungi l'ID dell'utente all'oggetto 'ticketData'
                    ticketData.user = {id: userId};

                    // Effettua una richiesta POST per creare il ticket associato all'utente
                    fetch('http://localhost:8080/api/tickets', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json' // Specifica il tipo di contenuto JSON
                        },
                        body: JSON.stringify(ticketData) // Converte l'oggetto ticketData in stringa JSON
                    })
                        .then(ticketResponse => {
                            // Controlla se la risposta dal server è positiva
                            if (!ticketResponse.ok) {
                                throw new Error('Errore durante la creazione del ticket: ' + ticketResponse.status);
                            }
                            console.log('Ticket creato con successo'); // Messaggio di conferma

                            // Ripristina il modulo dopo la creazione del ticket
                            document.getElementById('formChat').reset();

                            // Mostra il messaggio di successo per 5 secondi
                            document.getElementById('successMessage').style.display = 'block';
                            setTimeout(() => {
                                document.getElementById('successMessage').style.display = 'none'; // Nascondi il messaggio
                            }, 5000);
                        })
                        .catch(error => {
                            // Logga un errore se la creazione del ticket fallisce
                            console.error('Errore nella creazione del ticket:', error);
                        });
                })
                .catch(error => {
                    // Logga un errore se la richiesta iniziale per l'utente fallisce
                    console.error('Errore:', error);
                });
        });
    }
});

/* Il codice gestisce l'invio di un modulo per creare un utente e un ticket associato.
Dopo aver verificato la presenza dei campi del modulo, i dati dell'utente vengono inviati al server
per crearne uno nuovo o verificare l'esistenza.
Se l'utente esiste o viene creato con successo, viene poi inviato un ticket associato al suo ID.
In caso di successo, il modulo si resetta e appare un messaggio di conferma, mentre eventuali errori vengono loggati.
 */
