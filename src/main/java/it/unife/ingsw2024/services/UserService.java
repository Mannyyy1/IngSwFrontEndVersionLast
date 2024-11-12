package it.unife.ingsw2024.services;

import it.unife.ingsw2024.models.User;
import it.unife.ingsw2024.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/* Service class per gestire la logica di business relativa agli utenti. */
@Service
public class UserService {

    @Autowired // Inietta il repository per accedere ai dati relativi agli utenti.
    private UserRepository userRepository;

    /* Restituisce tutti gli utenti dalla tabella MySQL. */
    public List<User> getAll() {
        return userRepository.findAll(); // Esegue una SELECT su tutti gli utenti.
    }

    /* Restituisce un utente specifico in base all'ID dalla tabella MySQL. */
    public User getUserById(int id) {
        Optional<User> user = userRepository.findById(id); // Trova l'utente tramite l'ID.
        return user.orElse(null); // Restituisce l'utente se esiste, altrimenti null.
    }

    /* Aggiunge un nuovo utente nella tabella MySQL. */
    public void addUser(User user) {
        userRepository.save(user); // Salva un nuovo record utente nel database.
    }

    /* Aggiorna un utente esistente nella tabella MySQL. */
    public void updateUser(int id, User user) {
        userRepository.save(user); // Salva i dati aggiornati di un utente nel database.
    }

    /* Elimina un utente dalla tabella MySQL in base all'ID. */
    public void deleteUser(int id) {
        userRepository.deleteById(id); // Elimina un record utente dal database.
    }

    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

}
