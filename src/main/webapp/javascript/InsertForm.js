// Aggiunge un listener che attende il caricamento completo del DOM prima di eseguire il codice
document.addEventListener('DOMContentLoaded', function() {
    // Controllo dell'esistenza del modulo
    const form = document.getElementById('form');
    if (!form) {
        console.error('Errore: modulo non trovato');
        return; // Esci se il modulo non esiste
    }

    // Controllo dell'esistenza dei campi del modulo
    const nome = document.getElementById('formNome');
    const cognome = document.getElementById('formCognome');
    const email = document.getElementById('formEmail');
    const cellulare = document.getElementById('formCellulare');
    const topic = document.getElementById('formTopic');
    const argument = document.getElementById('formArgument');
    const message = document.getElementById('formMessage');

    if (!nome) console.error('Errore: campo Nome non trovato');
    if (!cognome) console.error('Errore: campo Cognome non trovato');
    if (!email) console.error('Errore: campo Email non trovato');
    if (!cellulare) console.error('Errore: campo Cellulare non trovato');
    if (!topic) console.error('Errore: campo Topic non trovato');
    if (!argument) console.error('Errore: campo Argument non trovato');
    if (!message) console.error('Errore: campo Messaggio non trovato');

    // Aggiungi il listener solo se tutti gli elementi esistono
    if (nome && cognome && email && cellulare && topic && argument && message) {
        // Aggiunge un listener per l'evento di invio del modulo
        form.addEventListener('submit', function(event) {
            // Previene l'invio predefinito del modulo (cioè il ricaricamento della pagina)
            event.preventDefault();

            // Crea un oggetto 'userData' con i dati dell'utente inseriti nel modulo
            const userData = {
                firstname: nome.value, // Nome
                surname: cognome.value, // Cognome
                email: email.value.trim(),     // Email
                phone: cellulare.value.trim()   // Numero di cellulare
            };

            // Crea un oggetto 'ticketData' con i dati del ticket
            const ticketData = {
                topic: topic.value, // Topic del ticket
                argument: argument.value, // Argomento del ticket
                detail: message.value     // Dettagli del ticket
            };

            // Verifica se i campi obbligatori non sono vuoti
            if (!userData.firstname || !userData.surname || !userData.email || !userData.phone || !ticketData.topic || !ticketData.argument) {
                console.error('Errore: tutti i campi obbligatori devono essere compilati.');
                return;
            }

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
                            form.reset(); // Ripristina il modulo
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
    }
});

/* Questo script gestisce l'invio di un modulo per la creazione di un utente e di un ticket.
All'avvio, verifica la presenza del modulo e dei suoi campi richiesti.
Se tutti gli elementi esistono, aggiunge un listener all'evento di invio del modulo,
prevenendo il comportamento predefinito di ricaricamento della pagina.
Raccoglie i dati dell'utente e del ticket dai campi del modulo e invia i dati dell'utente a un server tramite una
richiesta POST. A seconda della risposta del server, determina se l'utente esiste già o
se è stato creato un nuovo utente. Se l'ID dell'utente è valido, il codice invia i dati del ticket al server.
Infine, se il ticket viene creato con successo, il modulo viene resettato e viene mostrato un
messaggio di conferma all'utente.
 */
