package it.unife.ingsw2024.services;

import it.unife.ingsw2024.models.Ticket;
import it.unife.ingsw2024.repositories.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
// Classi di "tipo" service, gestisce la logica di business relativa alla classe ticket.
public class TicketService {

    @Autowired // Inietta il repository per accedere ai dati relativi ai ticket.
    private TicketRepository ticketRepository;

    // Restituisce tutti i ticket della tabella nel DB per mezzo di repository
    public List<Ticket> getAllTickets() {
        return ticketRepository.findAll();
    }

    // Restituisce tutti i ticket della tabella che hanno come tematica "Contenuti offensivi"
    public List<Ticket> AbusiTicket() {
        return ticketRepository.findByArgument("Segnalare contenuti offensivi");
    }

    // Restituisce un ticket specifico sulla base dell'ID specificato
    public Ticket getTicketById(int id) {
        // Utilizzata la Optional class perchè il ticket cercato potrebbe non esistere.
        // Se è presente nel DB viene restituito, altrimenti ritorna NULL
        Optional<Ticket> ticket = ticketRepository.findById(id);
        return ticket.orElse(null);
    }

    // Aggiunge un nuovo ticket nel DB per mezzo di repository
    public void addTicket(Ticket ticket) {
        ticketRepository.save(ticket);
    }

    // Aggiorna un ticket esistente per mezzo di repository
    public void updateTicket(int id, Ticket ticket) {
        ticketRepository.save(ticket);
    }

    // Elimina un ticket in base all'ID per mezzo di repository
    public void deleteTicket(int id) {
        ticketRepository.deleteById(id);
    }

}
