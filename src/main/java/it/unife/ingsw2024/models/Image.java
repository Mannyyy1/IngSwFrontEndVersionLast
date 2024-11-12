package it.unife.ingsw2024.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Blob;

@Entity
@Table(name = "image")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Image {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Generazione automatica dell'ID
    private int id;

    private String image_name;

    @Lob // Per indicare che si tratta di un grande oggetto binario
    private Blob image_data;

    private String image_type;

    // Relazione One-to-One inversa con Ticket
    @OneToOne(mappedBy = "image", cascade = CascadeType.ALL, orphanRemoval = true) // Un'immagine appartiene a un solo ticket
    private Ticket ticket;
}
