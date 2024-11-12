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

<!------------------------------------------ Contenuto principale: MAIN ---------------------------------------------->
<main>
  <div class="thq-section-padding">
    <div class="thq-flex-column thq-section-max-width">

      <!-- Titolo principale -->
      <header class="containerTitle">
        <h1>Contattaci</h1>
        <h2>Descrivici la tua esigenza! Ti risponderemo nel minor tempo possibile</h2>
      </header>

      <!-- Form contatto -->
      <form id="form" name="form" method="post" action="api/tickets/addNewTicket">

        <div class="container">
          <div class="inputForm">
            <label for="formNome">Nome</label>
            <!--Campo di input a riga singola per l'immissione di testo -->
            <input type="text" id="formNome" name="nome" required maxlength="15" aria-label="Inserisci il tuo nome">
          </div>
          <div class="inputForm">
            <label for="formCognome">Cognome</label>
            <input type="text" id="formCognome" name="cognome" required maxlength="15" aria-label="Inserisci il tuo cognome">
          </div>
        </div>

        <div class="container">
          <div class="inputForm">
            <label for="formEmail">Email</label>
            <input type="email" id="formEmail" name="email" pattern="[a-zA-Z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" required maxlength="30" aria-label="Inserisci il tuo indirizzo email">
          </div>
          <div class="inputForm">
            <label for="formCellulare">Cellulare</label>
            <input type="tel" id="formCellulare" name="telefono" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required maxlength="12" placeholder="123-456-7890" aria-label="Inserisci il tuo numero di cellulare">
          </div>
        </div>

        <div class="container">
          <div class="inputForm">
            <label for="formTopic">Tematica</label>
            <!-- Definisce un elenco a discesa -->
            <select id="formTopic" name="selectTematica" required>
              <!-- Opzioni selezionabili -->
              <option value="" disabled selected>Seleziona</option>
              <option value="Funzioni del sito">Funzioni del sito</option>
              <option value="Gestione dell'account">Gestione dell'account</option>
              <option value="Privacy e sicurezza">Privacy e sicurezza</option>
              <option value="Normative e segnalazioni">Normative e segnalazioni</option>
            </select>
          </div>
          <div class="inputForm">
            <label for="formArgument">Argomento</label>
            <select id="formArgument" name="selectArgomento" required>
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
        </div>

        <div class="container">
          <div class="inputForm100">
            <label for="formMessage">Aggiungi altri dettagli</label>
            <!-- Area per ereditare testi multiriga -->
            <textarea id="formMessage" name="dettagli" required maxlength="500" placeholder="Descrivi il tuo problema" aria-label="Aggiungi ulteriori dettagli sul problema"></textarea>
          </div>
        </div>

        <div class="container">
          <div class="inputForm100">
            <!-- Campo di selezione file e un pulsante "Sfoglia" per il caricamento dei file -->
            <label for="formFile">Allegato (facoltativo)</label>
            <input type="file" id="formFile" name="file" accept="image/*" aria-label="Carica un file immagine se necessario">
          </div>
        </div>

        <div class="checkContainer">
          <span class="bold">Informativa al trattamento dei dati personali</span>
          <p>I dati che stai fornendo saranno trattati da Code Crusaders in linea con quanto indicato nell'<a href="https://www.codecrusaders.com/informativa-privacy" class="linkPrivacy">Informativa</a>
            sul trattamento dei dati personali.
          </p>
          <div class="containerCheckbox">
            <!-- Casella di controllo a due stati (checked, not checked)-->
            <input type="checkbox" id="formCheck" name="check" required value="check" aria-label="Accetta i termini e le condizioni"/>
            <label for="formCheck">Ho preso visione dell' Informativa e do il consenso.</label>
          </div>
        </div>

        <!-- Pulsante invia - sottomette la form-->
        <input type="submit" value="Invia la tua richiesta" aria-label="Invia la tua richiesta">
      </form>

      <!-- Div per il messaggio di conferma -->
      <div id="successMessage">
        Richiesta presa in carico con successo!
      </div>

    </div>
  </div>
</main>

<%@ include file="../include/Footer.inc" %>

<!-- <script src="../javascript/InsertForm.js"></script> -->
<script src="../javascript/SelectForm.js"></script>

</body>
</html>