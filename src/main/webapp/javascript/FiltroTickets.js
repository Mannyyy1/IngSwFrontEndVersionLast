//Funzione che consente di filtrare una serie di "ticket" in base al loro stato
function filterTickets() {
    var filter = document.getElementById('ticketFilter').value;
    console.log(filter); // Stampa il valore del filtro selezionato
    var tickets = document.querySelectorAll('.ticket');
    // Scorre ciascun ticket per applicare il filtro
    tickets.forEach(function (ticket) {
        // Ottiene lo stato del ticket dall'attributo 'data-status'
        var status = ticket.getAttribute('data-status');
        console.log("Ticket status:", status);
        // Mostra o nasconde il ticket in base al filtro selezionato
        if (filter === 'tutti' || status === filter) {
            ticket.style.display = 'block';
        } else {
            ticket.style.display = 'none';
        }
    });
}