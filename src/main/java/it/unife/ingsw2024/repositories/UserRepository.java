package it.unife.ingsw2024.repositories;

import it.unife.ingsw2024.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
/* Classe che definisce il repository (database)  */
@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    User findByEmail(String email);  // Definisce un metodo di ricerca per email
}
