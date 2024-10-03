package it.unife.ingsw2024.models;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "ticket")
@Data
@AllArgsConstructor
@NoArgsConstructor

public class Ticket {
    @Id
    @GeneratedValue
    private int number;
    private String topi;
    private String argument;
    private String detail;
    private int progress;
    private String date;
    private int image_id;
    private int user_id;
}
