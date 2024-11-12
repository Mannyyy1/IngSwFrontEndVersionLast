// Seleziona l'elemento con id "formTopic"
let selectedTopic = document.querySelector("#formTopic");
// Seleziona l'elemento con id "formArgument"
let selectedArgument = document.querySelector("#formArgument");

// Disabilita inizialmente "selectedArgument"
selectedArgument.disabled = true;

// Aggiunge un listener per l'evento 'change' su "selectedTopic"
selectedTopic.addEventListener('change', event => {
    // Ottiene il valore dell'opzione selezionata
    let type = event.target.value;

    // Se il valore di "selectedTopic" è 1, disabilita "selectedArgument", altrimenti abilita
    if (selectedTopic.value == 1) {
        selectedArgument.disabled = true;
    } else {
        selectedArgument.disabled = false;
    }

    // Mostra solo le opzioni in "selectedArgument" che corrispondono al tipo selezionato
    [].slice.call(selectedArgument.querySelectorAll('option'))
        .forEach(el => {
            el.style.display = (el.dataset.type === type ? 'block' : 'none')
        })
});