<%@ page import="it.unife.ingsw2024.models.Ticket" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>

<% String menuActiveLink = "HelpDesk"; %>

<!DOCTYPE html>
<html lang="it">

<head>
    <%@ include file="../include/Head.inc" %>
    <link rel="stylesheet" href="css/helpdesk.css" type="text/css">
    <link rel="stylesheet" href="css/form.css" type="text/css">
</head>

<body>
<%@ include file="../include/Top_helpdesk.inc" %>

<!------------------------------------------ Contenuto principale: MAIN ------------------------------------------------>
<main>
    <div class="thq-section-padding">
        <div class="thq-flex-column thq-section-max-width">

            <!-- Titolo -->
            <header class="sectionTitle">
                <h1>Richieste FORM</h1>
            </header>

            <!-- Form per aggiungere un nuovo ticket -->
            <form id="formNewTicket" name="formNewTicket" action="api/tickets/addNewTicket" method="post">
                <!-- Sectioning root -->
                <fieldset>
                <!-- Nome gruppo -->
                <legend>Aggiungi un nuovo ticket</legend>
                <div class="container">
                    <div class="inputForm">
                        <label for="userName">Nome</label>
                        <input type="text" id="userName" name="nome" required maxlength="15" aria-label="Inserisci il tuo nome">
                    </div>
                    <div class="inputForm">
                        <label for="userSurname">Cognome</label>
                        <input type="text" id="userSurname" name="cognome" required maxlength="15" aria-label="Inserisci il tuo cognome">
                    </div>
                </div>

                <div class="container">
                    <div class="inputForm">
                        <label for="userEmail">Email</label>
                        <input type="email" id="userEmail" name="email" pattern="[a-zA-Z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$"
                               required maxlength="30" aria-label="Inserisci il tuo indirizzo email">
                    </div>
                    <div class="inputForm">
                        <label for="phone">Cellulare</label>
                        <input type="tel" id="phone" name="telefono" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
                               required maxlength="12" placeholder="123-456-7890" aria-label="Inserisci il tuo numero di cellulare">
                    </div>
                </div>

                <div class="container">
                    <div class="inputForm">
                        <label for="formTopic">Tematica</label>
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
                        <label for="detail">Dettagli</label>
                        <textarea id="detail" name="dettagli" required maxlength="500" placeholder="Descrivi il tuo problema" aria-label="Aggiungi ulteriori dettagli sul problema"></textarea>
                    </div>
                </div>

                <!-- Pulsante invia - sottomette la form -->
                <input type="submit" value="Aggiungi Ticket">
                </fieldset>
            </form>

            <hr>

            <!-- Container Filtro + Ticket -->
            <div class="ticket-container">
                <div class="containerFiltro">
                    <img src="../images/filtro.png" alt="Filtra" class="image"/>

                    <label for="ticketFilter"></label>
                    <select id="ticketFilter" name="selectFilter" onchange="filterTickets()">
                        <option value="" disabled selected>Filtra</option>
                        <option value="tutti">Tutti</option>
                        <option value="0">Da visionare</option>
                        <option value="1">In corso</option>
                        <option value="2">Chiuso</option>
                    </select>
                </div>


                <div class="ticketsContainer">
                    <!--Recupera un attributo chiamato "tickets" dall'oggetto request, che dovrebbe essere una lista di oggetti Ticket, e lo assegna alla variabile tickets -->
                    <% List<Ticket> tickets = (List<Ticket>) request.getAttribute("tickets");%>
                    <!-- Verifica se l'attributo "tickets" è presente e non è nullo -->
                    <% if (tickets != null) { %>
                    <!-- Ciclo for-each itererà su ogni oggetto Ticket presente nella lista tickets. All'interno del ciclo,
                    è possibile accedere a ciascun Ticket con la variabile ticket -->
                    <% for (Ticket ticket : tickets) { %>

                    <!-- Bottone utilizzato per aprire e chiudere il relativo contenuto -->
                    <div class="ticket" data-status="<%=ticket.getProgress()%>">
                        <button class="ticketHeader">
                            <div class="sectionTitle">
                                <h4> Data:<%=ticket.getDate()%> </h4>
                                <h3> Ticket #<%=ticket.getNumber()%> </h3>
                            </div>
                            <div class="colourStatus"></div>
                        </button>

                        <div class="ticketBody">

                            <div class="containerDati">
                                <div class="colonna">
                                    <strong class="strongTitle">Dati personali</strong>
                                    <div class="elencoDati">
                                        <!-- Il metodo ticket.getUser() viene chiamato per ottenere l'utente associato al Ticket corrente -->
                                        <% if (ticket.getUser() != null) { %>
                                        <span> Nome: <%=ticket.getUser().getFirstname()%> </span>
                                        <span> Cognome: <%=ticket.getUser().getSurname()%> </span>
                                        <span> Email: <%=ticket.getUser().getEmail()%> </span>
                                        <span> Cellulare: <%=ticket.getUser().getPhone()%></span>
                                        <% } else { %>
                                        <span> Nome: N/A </span>
                                        <span> Cognome: N/A </span>
                                        <span> Email: N/A </span>
                                        <span> Cellulare: N/A </span>
                                        <% } %>
                                    </div>
                                </div>
                                <div class="colonna">
                                    <strong class="strongTitle">Richiesta di assistenza</strong>
                                    <div class="elencoDati">
                                        <!-- Ciascun Metodo viene chiamato per ottenere i dati associati al Ticket corrente -->
                                        <span>Tematica: <%=ticket.getTopic()%></span>
                                        <span>Argomento: <%= ticket.getArgument()%></span>
                                        <span>Dettagli: <%= ticket.getDetail()%></span>
                                        <span>Allegato: <%= ticket.getImage()%></span>
                                    </div>
                                </div>

                            </div>

                            <!-- FORM risposta tecnico -->
                            <form name="updateTicketResponse" id="updateTicketResponse" action="/api/tickets/updateResponse/<%= ticket.getNumber() %>" method="post">
                                <label for="textAnswer"></label>
                                <textarea id="textAnswer" name="textAnswer" required placeholder="Scrivi la tua risposta qui..."></textarea>
                                <input type="submit" value="Invia" aria-label="Risposta"/>
                            </form>

                            <!-- Elenco History salvato per ciascun ticket -->
                            <div class="containerHistory">
                                <div class="titleHistory">
                                    <strong class="strongTitle">History</strong>
                                    <img src="../images/history.png" alt="History" class="image"/>
                                </div>
                                <div class="elencoHistory">
                                    <span> <b>Data: </b> <%=ticket.getDate()%> </span>
                                    <span> <b>Ticket #</b><%=ticket.getNumber()%> </span>
                                    <span> <b>Stato: </b> <%=ticket.getProgress()%> </span>
                                    <span> <b>Risposta: </b> <%=ticket.getResponse()%> </span>
                                </div>
                            </div>

                            <!-- Gestione ticket chiusura -->
                            <div class="containerChiusura">
                                <form action="/api/tickets/updateStatus/<%= ticket.getNumber() %>" method="post" >
                                    <!-- Campo di input nascosto -->
                                    <input type="hidden" name="status" value="2"/>
                                    <button class="buttonChiusura" type="submit">Chiusura ticket</button>
                                </form>
                                <form action="/api/tickets/updateStatus/<%= ticket.getNumber() %>" method="post" >
                                    <input type="hidden" name="status" value="1"/>
                                    <button class="buttonChiusura" type="submit">Annulla Chiusura</button>
                                </form>
                            </div>

                        </div>

                    </div>
                    <% } %>
                    <% } else { %>
                    <p>Non ci sono ticket da visualizzare</p>
                    <% } %> <!-- fine if -->

                </div>
            </div>
        </div>
    </div>
</main>
<%@ include file="../include/Footer_helpdesk.inc" %>

<script src="../javascript/FiltroTickets.js"></script>
<script src="../javascript/OpeningTicket.js"></script>
<script src="../javascript/StatusTicket.js"></script>
<script src="../javascript/SelectForm.js"></script>

</body>
</html>