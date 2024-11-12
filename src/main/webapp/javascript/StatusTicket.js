// Funzione per selezionare le attività in base allo stato
function selectByStatus(status) {
    return tasks.filter(task => task.status === status);
}

function ticketsStatus(id) {
    switch (id) {
        case 0:
            return "Da visionare";
        case 1:
            return "In corso";
        case 2:
            return "Chiuso";
        default:
            return "Errore";
    }
}

function getStatusColor(id) {
    switch (id) {
        case 0:
            return "green";
        case 1:
            return "orange";
        case 2:
            return "red";
        default:
            return "grey";
    }
}

// Aggiorna la visualizzazione dello stato per ciascun "ticket" quando la pagina viene caricata
document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll('.ticket').forEach(function (ticket) {
        var status = parseInt(ticket.getAttribute('data-status'));
        var statusText = ticketsStatus(status);
        var statusColor = getStatusColor(status);

        var colourStatusDiv = ticket.querySelector('.colourStatus');
        colourStatusDiv.textContent = statusText; // Imposta il testo dello stato
        colourStatusDiv.style.backgroundColor = statusColor;  // Imposta il colore di sfondo
    });
});