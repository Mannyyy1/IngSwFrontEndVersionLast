/*Funzione JS fisarmonica (contenuto comprimibile) per ticket
Le fisarmoniche sono utili quando si desidera alternare tra nascondere e mostrare una grande quantità di contenuti:*/

// Seleziona tutti gli elementi con la classe "ticketHeader"
var acc = document.getElementsByClassName("ticketHeader");
var i;
// Cicla attraverso ogni elemento "ticketHeader"
for (i = 0; i < acc.length; i++) {
    // Aggiungi un listener per l'evento click a ciascun "ticketHeader"
    acc[i].addEventListener("click", function() {
        // Attiva o disattiva la classe "active" per scopi di stile o indicazione
        this.classList.toggle("active");
        // Seleziona l'elemento successivo (presunto essere il "ticketBody")
        var ticketBody = this.nextElementSibling;
        // Alterna la visualizzazione di "ticketBody" tra "none" e "block"
        if (ticketBody.style.display === "block") {
            ticketBody.style.display = "none";
        } else {
            ticketBody.style.display = "block";
        }
    });
}