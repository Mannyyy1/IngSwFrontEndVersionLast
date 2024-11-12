package it.unife.ingsw2024.web;

import it.unife.ingsw2024.models.User;
import it.unife.ingsw2024.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController // Indica che questa classe è un controller REST, che gestisce le richieste HTTP e restituisce dati JSON o XML.
@RequestMapping("/api/users") // Imposta il prefisso per tutti gli endpoint gestiti da questo controller.
public class UserController {

    @Autowired // Inietta automaticamente l'istanza di UserService gestita dal contesto Spring.
    private UserService userService;

    // Gestisce le richieste GET su "/api/users" e restituisce una lista di tutti gli utenti.
    @GetMapping
    public List<User> getAllUsers() {
        return userService.getAll(); // Chiama il servizio per ottenere tutti gli utenti.
    }

    // Gestisce le richieste GET su "/api/users/{id}" e restituisce un utente specifico in base all'ID.
    @GetMapping("/{id}")
    public User getUserById(@PathVariable int id) { // @PathVariable estrae il valore di {id} dall' URL.
        return userService.getUserById(id); // Chiama il servizio per ottenere un utente specifico.
    }

    // Gestisce le richieste POST su "/api/users" per aggiungere un nuovo utente.
    @PostMapping
    public ResponseEntity<?> addUser(@RequestBody User user) {
        // Controlla se esiste un utente con la stessa email
        User existingUser = userService.getUserByEmail(user.getEmail());

        if (existingUser != null) {
            // Restituisce il codice 999 e l'ID dell'utente esistente
            return ResponseEntity.status(999).body(existingUser.getId());
        }

        // Se l'email non esiste, aggiunge il nuovo utente
        userService.addUser(user);
        return ResponseEntity.status(HttpStatus.CREATED).body(user);
    }


    // Gestisce le richieste PUT su "/api/users/{id}" per aggiornare un utente esistente.
    @PutMapping("/{id}")
    public void updateUser(@PathVariable int id, @RequestBody User user) {
        userService.updateUser(id, user); // Chiama il servizio per aggiornare i dati dell'utente con l'ID specificato.
    }

    // Gestisce le richieste DELETE su "/api/users/{id}" per eliminare un utente.
    @DeleteMapping("/{id}")
    public void deleteUser(@PathVariable int id) {
        userService.deleteUser(id); // Chiama il servizio per eliminare l'utente con l'ID specificato.
    }

}
