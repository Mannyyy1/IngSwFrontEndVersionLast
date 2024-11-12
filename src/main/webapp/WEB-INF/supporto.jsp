<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false"%>

<% String menuActiveLink = "homeDesk"; %>

<!DOCTYPE html>
<html lang="it">

<head>
    <%@ include file="../include/Head.inc" %>
    <link rel="stylesheet" href="css/supporto.css" type="text/css">
</head>

<body>

<%@ include file="../include/Top.inc" %>

<!------------------------------------------ Contenuto principale: MAIN ------------------------------------------------>
<main>
    <!-- Sezione Features1 - Argomenti -->
    <section class="argPadding thq-section-padding">
        <div class="arg-max-width thq-section-max-width">

            <!-- Titolo e barra di ricerca -->
            <div class="containerTitle">
                <h1>Come possiamo aiutarti?</h1>
                <div class="containerBarra">
                    <img src="../images/ricerca.png" alt="Icona di ricerca" class="imageSearch" />
                    <input type="search" name="search" id="search" placeholder="Cerca negli articoli dell’assistenza..." />
                </div>
            </div>

            <!-- Container titolo e argomenti principali -->
            <div class="containerArg">
                <h2>Argomenti popolari</h2>

                <!-- Grid Layout, sistema di layout basato su griglia (con righe e colonne) -->
                <div class="thq-grid-3">
                    <!--Pulsante come collegamento, con codice JavaScript -->
                    <button onclick="document.location='https://www.codecrusaders.com/gestione-account/impostazioni-account'" class="buttonArg">
                        <img src="../images/account.png" alt="Impostazioni Account" class="imageArg" />
                        <h4>Impostazioni Account</h4>
                        <span class="textButton">Modifica le impostazioni, gestisci le notifiche, scopri di più sulle modifiche al nome e altro ancora</span>
                    </button>

                    <button onclick="document.location='https://www.codecrusaders.com/gestione-account/accesso'" class="buttonArg">
                        <img src="../images/chiave.png" alt="Accesso e Password" class="imageArg" />
                        <h4>Accesso e Password</h4>
                        <span class="textButton">Risolvi i problemi di accesso e scopri come modificare o reimpostare la password</span>
                    </button>

                    <button onclick="document.location='https://www.codecrusaders.com/privacy-sicurezza-report/privacy'" class="buttonArg">
                        <img src="../images/lucchetto.png" alt="Privacy e Sicurezza" class="imageArg" />
                        <h4>Privacy e Sicurezza</h4>
                        <span class="textButton">Controlla chi può vedere quello che condividi e garantisci maggiore protezione</span>
                    </button>

                    <button onclick="document.location='https://www.codecrusaders.com/funzioni-del-sito/notifiche'" class="buttonArg">
                        <img src="../images/notifica.png" alt="Notifiche" class="imageArg" />
                        <h4>Notifiche</h4>
                        <span class="textButton">Scegli quali notifiche vuoi ricevere</span>
                    </button>

                    <button onclick="document.location='https://www.codecrusaders.com/funzioni-del-sito/eventi'" class="buttonArg">
                        <img src="../images/evento.png" alt="Eventi" class="imageArg" />
                        <h4>Eventi</h4>
                        <span class="textButton">Crea un evento, controlla chi vede il tuo evento o vi partecipa</span>
                    </button>

                    <button onclick="document.location='https://www.codecrusaders.com/funzioni-del-sito/gruppi'" class="buttonArg">
                        <img src="../images/gruppo.png" alt="Gruppi" class="imageArg" />
                        <h4>Gruppi</h4>
                        <span class="textButton">Scopri come creare, gestire e utilizzare i gruppi</span>
                    </button>
                </div>
            </div>

            <!-- FAQ Button -->
            <div class="containerButton">
                <button onclick="document.location='https://www.codecrusaders.com/faq'" class="buttonFaq">
                    Vai a tutte le Domande Frequenti
                </button>
            </div>

            <!-- divisore: interruzione tematica -->
            <hr>
        </div>
    </section>

    <!-- Sezione Contatto  -->
    <section class="contactPadding thq-section-padding">
        <div class="contact-max-width thq-section-max-width">

            <div class="containerTitle">
                <h2>Non hai risolto il tuo problema?</h2>
                <h3>Contattaci scegliendo una delle modalità elencate. Riceverai le informazioni e l'assistenza richiesta.</h3>
            </div>

            <!-- Opzioni contatto-->
            <!-- Grid Layout, sistema di layout basato su griglia (con righe e colonne -->
            <div class="thq-grid-3-contact">
                <div class="containerLink">
                    <img src="../../images/modulo.png" alt="Modulo di contatto" class="imageContact" />
                    <span class="textButton">Compila il modulo e invialo online</span>
                    <button onclick="document.location='form'" class="buttonContact">Scrivici</button>
                </div>

                <div class="containerLink">
                    <img src="../../images/chat.png" alt="Chatta con noi" class="imageContact" />
                    <span class="textButton">Parla con il nostro team del Servizio clienti via chat</span>
                    <button onclick="document.location='chatta_con_noi'" class="buttonContact">Chatta con noi</button>
                </div>

                <div class="containerLink">
                    <img src="../../images/email.png" alt="Contattaci via email" class="imageContact" />
                    <span class="textButton">Contattaci direttamente via posta elettronica</span>
                    <button onclick="document.location='mailto:supporto@codecrusaders.it?subject=Qui%20metti%20oggetto%20&cc=esempio2@email.com&body=Qui%20metti%20messaggio'" class="buttonContact">Email</button>
                </div>

                <div class="containerLink">
                    <span class="textButton">TECNICO</span>
                    <button onclick="document.location='helpdesk'" class="buttonContact">tenico</button>
                </div>
            </div>
        </div>
    </section>

</main>

<%@ include file="../include/Footer.inc" %>

</body>
</html>