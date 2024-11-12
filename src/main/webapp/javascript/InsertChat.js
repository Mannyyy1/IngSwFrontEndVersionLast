// Aggiunge un listener che attende il caricamento completo del DOM prima di eseguire il codice
document.addEventListener('DOMContentLoaded', function() {
    // Controllo dell'esistenza del modulo
    const form = document.getElementById('formChat');
    if (!form) {
        console.error('Errore: modulo non trovato');
        return; // Esci se il modulo non esiste
    }

    // Seleziona gli elementi del form per Nome, Cognome, Email, Argomento (Topic) e Dettagli (Argument)
    const nome = document.getElementById('formNome');
    const cognome = document.getElementById('formCognome');
    const email = document.getElementById('formEmail');
    const topic = document.getElementById('formTopic');
    const argument = document.getElementById('formArgument');

    // Controlla l'esistenza di tutti i campi necessari
    if (!nome) console.error('Errore: campo Nome non trovato');
    if (!cognome) console.error('Errore: campo Cognome non trovato');
    if (!email) console.error('Errore: campo Email non trovato');
    if (!topic) console.error('Errore: campo Topic non trovato');
    if (!argument) console.error('Errore: campo Argument non trovato');

    // Aggiungi il listener solo se tutti gli elementi esistono
    if (nome && cognome && email && topic && argument) {
        form.addEventListener('submit', function(event) {
            // Previene il comportamento predefinito del form (evita il ricaricamento della pagina)
            event.preventDefault();

            // Crea un oggetto 'userData' con i valori inseriti nel modulo per nome, cognome e email
            const userData = {
                firstname: nome.value, // Nome
                surname: cognome.value, // Cognome
                email: email.value.trim() // Email
            };

            // Crea un oggetto 'ticketData' con i dettagli del ticket
            const ticketData = {
                topic: topic.value,   // Topic del ticket
                argument: argument.value, // Argomento del ticket
                detail: "ticket creato tramite chat" // Dettaglio aggiuntivo per indicare la creazione via chat
            };

            // Verifica se i campi obbligatori non sono vuoti
            if (!userData.firstname || !userData.surname || !userData.email || !ticketData.topic || !ticketData.argument) {
                console.error('Errore: tutti i campi obbligatori devono essere compilati.');
                return;
            }

            // Invia i dati dell'utente al server per creare o verificare l'utente
            fetch('http://localhost:8080/api/users', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(userData) // Converte l'oggetto userData in una stringa JSON
            })
                .then(response => {
                    if (response.status === 999) {
                        return response.text(); // Restituisce l'ID dell'utente esistente come testo
                    } else if (response.status === 201) {
                        return response.json(); // Se l'utente è stato creato, restituisce l'oggetto utente
                    } else {
                        throw new Error('Errore nella risposta del server: ' + response.status);
                    }
                })
                .then(data => {
                    let userId;
                    if (typeof data === 'string') {
                        userId = data; // Se il dato è una stringa, è l'ID dell'utente esistente
                    } else {
                        userId = data.id; // Se è un oggetto, prendi l'ID dal nuovo utente creato
                    }

                    if (!userId) {
                        console.error('Errore: userId non valido:', userId);
                        return;
                    }

                    // Aggiungi l'ID dell'utente all'oggetto 'ticketData'
                    ticketData.user = { id: userId };

                    // Invia i dati del ticket al server
                    return fetch('http://localhost:8080/api/tickets', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(ticketData)
                    });
                })
                .then(ticketResponse => {
                    if (!ticketResponse.ok) {
                        throw new Error('Errore durante la creazione del ticket: ' + ticketResponse.status);
                    }
                    console.log('Ticket creato con successo');
                    form.reset(); // Ripristina il modulo

                    // Mostra il messaggio di successo per 5 secondi
                    document.getElementById('successMessage').style.display = 'block';
                    setTimeout(() => {
                        document.getElementById('successMessage').style.display = 'none';
                    }, 5000);
                })
                .catch(error => {
                    console.error('Errore:', error); // Logga un errore se la richiesta fallisce
                });
        });
    }
});
