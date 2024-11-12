package it.unife.ingsw2024.models;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Entity
@Table(name = "ticket")
@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "number")
public class Ticket {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Generazione automatica della chiave primaria
    private int number;

    private String topic;
    private String argument;
    private String detail;
    private int progress;
    private Date date;
    private String response;

    // Relazione Many-to-One con User
    @ManyToOne(fetch = FetchType.LAZY) // Molti ticket possono appartenere a un singolo utente
    @JoinColumn(name = "user_id", referencedColumnName = "id") // user_id è la foreign key nella tabella ticket
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private User user;

    // Relazione One-to-One con Image
    @OneToOne(fetch = FetchType.LAZY) // Un ticket ha una sola immagine
    @JoinColumn(name = "image_id", referencedColumnName = "id") // image_id è la foreign key nella tabella ticket
    private Image image;

    public void cambiaStatusTicket(int stato) {
        this.progress = stato;
    }
}
