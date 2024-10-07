package it.unife.ingsw2024.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@Table(name = "user")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Generazione automatica dell'ID
    private int id;

    private String firstname;
    private String surname;
    private String email;
    private String phone;

    // Relazione One-to-Many con Ticket
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true) // Un utente può avere molti ticket
    private List<Ticket> tickets;
}
