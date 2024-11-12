<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false"%>

<% String menuActiveLink = "ChattaConNoi"; %>

<!DOCTYPE html>
<html lang="it">

<head>
  <%@ include file="../include/Head.inc" %>
  <link rel="stylesheet" href="css/chatta_con_noi.css" type="text/css">
</head>

<body>

<%@ include file="../include/Top.inc" %>

<!----------------------------------- Contenuto principale: MAIN ------------------------------------------------------>
<main>

  <!---------------------------------------------- Sezione HERO ------------------------------------------------------>
  <section class="hero thq-section-padding">
    <div class="thq-flex-column thq-section-max-width">

      <div class="containerTitle">
        <h1>Chatta con noi</h1>
        <h2>Chiedi aiuto all'operatore di Code Crusaders</h2>
      </div>

      <div class="checkBox">
        <div class="containerCheck">
          <img src="../images/check.png" class="checkImage" alt="Check" />
          <span class="textCheck">Ottieni supporto immediato</span>
        </div>

        <div class="containerCheck">
          <img src="../images/check.png" class="checkImage" alt="Check" />
          <span class="textCheck">Assistenza dal lunedì al sabato dalle ore 8.00 alle ore 20.00</span>
        </div>

        <div class="containerCheck">
          <img src="../images/check.png" class="checkImage" alt="Check" />
          <span class="textCheck">Ricevi assistenza mirata in base alla tua richiesta</span>
        </div>
      </div>
    </div>

    <div class="imgHero" aria-hidden="true"></div>
  </section>

  <!------------------------------------------ Sezione Chat ---------------------------------------------------------->
  <section class="thq-section-padding">
    <div class="thq-flex-column thq-section-max-width">

      <div class="containerSecond">

        <!-- Componente Paragrafo -->
        <div class="containerParagrafo">

          <h2 class="titoloParagrafo">Come funziona la chat di Code Crusaders</h2>
          <p>Entrare in contatto con il mondo di Code Crusaders è semplice e immediato: ti basterà
            <span class="bold">compilare la richiesta</span>
            coi tuoi dati personali e
            <span class="bold">selezionare la tematica</span>
            su cui vuoi ricevere assistenza (specificare Altro se non rientra tra le opzioni).
          </p>
          <p>Successivamente ti basterà
            <span class="bold">cliccare in basso sul pulsante "Inizia chat"</span>
            e utilizzare la nostra live chat per ricevere tutto il supporto di cui hai bisogno.
          </p>
          <p>Altrimenti <span class="bold">puoi consultare la sezione FAQ</span>
            per avere risposta alle domande più frequenti.
          </p>
          <button onclick="window.location.href='https://www.codecrusaders.com/faq'" class="buttonFAQ" aria-label="Vai alla sezione FAQ">Vai a FAQ - Domande Frequenti</button>
          <p>Code Crusaders si riserva il diritto di terminare la chat in caso di conversazioni che:</p>
          <ul>
            <li>Contengano linguaggio volgare, attacchi personali o sessuali, e offese di natura etnica, politica o religiosa;</li>
            <li>Includano spam o link a siti esterni;</li>
            <li>Siano fuori tema;</li>
            <li>Violino il diritto d'autore o utilizzino marchi registrati senza autorizzazione.</li>
          </ul>
        </div>

        <!-- Elemento hr (visibile solo su mobile) -->
        <hr class="hrDivider">

        <!--Componente Chat -->
        <div class="containerChat">

          <div class="titleChat">
            <h2 class="h2Title">Chatta con noi</h2>
            <img src="../images/chatChat.png" class="imgChat" alt="Icona chat" />
          </div>

          <!-------------------------------- FORM Chat -------------------------------->
          <form name="formChat" id="formChat"  method="post" action="api/tickets/addNewTicket">

            <div class="containerForm">
              <span>Compila la richiesta e avvia la conversazione con l'operatore selezionando "Inizia chat".</span>

              <div class="inputChat">
                <label for="formNome">Nome</label>
                <input type="text" id="formNome" name="nome" required maxlength="15" class="textinput" aria-required="true" aria-label="Inserisci il tuo nome">
              </div>

              <div class="inputChat">
                <label for="formCognome">Cognome</label>
                <input type="text" id="formCognome" name="cognome" required maxlength="15" class="textinput" aria-required="true" aria-label="Inserisci il tuo cognome">
              </div>

              <div class="inputChat">
                <label for="formEmail">Email</label>
                <input type="email" id="formEmail" name="email" pattern="[a-zA-Z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" required maxlength="30" class="textinput" aria-required="true" aria-label="Inserisci la tua email">
              </div>

              <div class="inputChat">
                <label for="formTopic">Tematica</label>
                <select id="formTopic" name="selectTematica" required aria-required="true" aria-label="Seleziona la tematica">
                  <option value="" disabled selected>Seleziona</option>
                  <option value="Funzioni del sito">Funzioni del sito</option>
                  <option value="Gestione dell'account">Gestione dell'account</option>
                  <option value="Privacy e sicurezza">Privacy, sicurezza e report</option>
                  <option value="Normative e segnalazioni">Condizioni e normative</option>
                  <option value="Altro">Altro</option>
                </select>
              </div>

              <div class="inputChat">
                <label for="formArgument">Argomento</label>
                <select id="formArgument" name="selectArgomento" required aria-required="true" aria-label="Seleziona l'argomento">
                  <option value="" disabled selected>Seleziona</option>
                  <option value="Aggiungere amici" data-type="Funzioni del sito">Aggiungere amici</option>
                  <option value="Creare un evento" data-type="Funzioni del sito">Creare un evento</option>
                  <option value="Eliminare un evento" data-type="Funzioni del sito">Eliminare un evento</option>
                  <option value="Accesso e password" data-type="Gestione dell'account">Accesso e password</option>
                  <option value="Impostazioni account" data-type="Gestione dell'account">Impostazioni account</option>
                  <option value="Disattivare o eliminare account" data-type="Gestione dell'account">Disattivare o eliminare account</option>
                  <option value="Accesso e download dei tuoi dati" data-type="Privacy e sicurezza">Accesso e download dei tuoi dati</option>
                  <option value="Protezione dell'account" data-type="Privacy e sicurezza">Protezione dell'account</option>
                  <option value="Richiesta di rimozione legale" data-type="Privacy e sicurezza">Richiesta di rimozione legale</option>
                  <option value="Accesso e download delle nostre normative" data-type="Normative e segnalazioni">Accesso e download delle nostre normative</option>
                  <option value="Segnalare contenuti offensivi" data-type="Normative e segnalazioni">Segnalare contenuti offensivi</option>
                  <option value="Segnalare un problema" data-type="Normative e segnalazioni">Segnalare un problema</option>
                </select>
              </div>

              <div class="containerCheckbox">
                <input type="checkbox" id="formCheck2" name="check" value="check" required aria-required="true" aria-label="Accetta l'informativa sulla privacy">
                <label for="formCheck2">
                  Ho preso visione dell'<a href="https://www.codecrusaders.com/informativa-privacy" class="linkPrivacy">Informativa sulla Privacy</a>
                  e compreso che tutte le informazioni che fornirò saranno utilizzate esclusivamente per ottimizzare il supporto offertomi dal Servizio Clienti.
                </label>
              </div>
            </div>

            <hr class="dividerChat">
            <input type="hidden" name="telefono" value="000-000-0000">
            <input type="hidden" name="dettagli" value="Ticket creato tramite chat">

            <input type="submit" value="Inizia chat" aria-label="Inizia chat con il supporto">
          </form>

          <!-- div per il messaggio di conferma -->
          <div id="successMessage">
            Richiesta presa in carico con successo!
          </div>

         </div>
        </div>
      </div>
    </section>
</main>

<%@ include file="../include/Footer.inc" %>

<!-- <script src="../javascript/InsertChat.js"></script> -->
<script src="../javascript/SelectForm.js"></script>

</body>
</html>