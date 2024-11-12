/* Funzione JS - Menu di navigazione superiore per mobile (apertura verticale)
* Mostra o nasconde i collegamenti del menu di navigazione quando l'utente fa clic sull'icona del menu hamburger */

function openingMenu() {
    // Seleziona l'elemento con id "myLinks" (presumibilmente il menu)
    var menuHamburger = document.getElementById("myLinks");
    // Controlla se il menu è visibile (display "flex")
    if (menuHamburger.style.display === "flex") {
        // Se visibile, nasconde il menu impostando display a "none"
        menuHamburger.style.display = "none";
    } else {
        // Altrimenti, rende visibile il menu impostando display a "flex"
        menuHamburger.style.display = "flex";
    }
}