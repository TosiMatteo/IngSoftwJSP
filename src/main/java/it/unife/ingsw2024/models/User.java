package it.unife.ingsw2024.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/* Modello della tabella
* Le annotation indicano che questa classe è un entity bean,
* mappa una tabella che ha un nome fisico "my_table",
* che i costruttori sono generici e auto creati dal plugin lombok,
* e che lombok creerà anche tutti i getter e setter */
@Entity
@Table(name = "user")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    @Id /* Annotation per definire la primary key della tabella  */
    @GeneratedValue
    private int id;
    private String firstname;
    private String lastname;
    private String email;
    private String password;
    private String phone;

}
