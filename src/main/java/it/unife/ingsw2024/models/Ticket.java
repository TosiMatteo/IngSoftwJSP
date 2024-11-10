package it.unife.ingsw2024.models;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;

@Entity
@Table(name = "ticket")
@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "number")
public class Ticket {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Generazione automatica della chiave primaria
    private Integer number;

    private String topic;
    private String argument;
    private String detail;
    private Integer progress;
    private LocalDateTime date;
    private String response;


    // Relazione Many-to-One con User
    // Molti ticket possono appartenere a un singolo utente
    @ManyToOne(fetch = FetchType.LAZY)
    // user_id è la foreign key nella tabella ticket
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    // Necessario per evitare loop infinito toString
    @ToString.Exclude
    private User user;

    // Relazione One-to-One con Image
    // Un ticket ha una sola immagine
    @OneToOne(fetch = FetchType.LAZY)
    // image_id è la foreign key nella tabella ticket
    @JoinColumn(name = "image_id", referencedColumnName = "id")
    // Necessario per evitare loop infinito toString
    @ToString.Exclude
    private Image image;

}
