package it.unife.ingsw2024.services;

import it.unife.ingsw2024.models.Ticket;
import it.unife.ingsw2024.repositories.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
// Classi di "tipo" service, gestisce la logica di business relativa alla classe ticket.
public class TicketService {

    @Autowired // Inietta il repository per accedere ai dati relativi ai ticket.
    private TicketRepository ticketRepository;

    // Restituisce tutti i ticket della tabella nel DB per mezzo di repository
    public List<Ticket> getAllTickets() {
        return ticketRepository.findAll();
    }

    // Restituisce tutti i ticket della tabella che hanno come tematica "Contenuti offensivi" e che non siano chiusi
        public List<Ticket> AbusiTicket() {
            return ticketRepository.findByArgumentAndProgressNot("Segnalare contenuti offensivi", 2).stream()
                    .map(ticket -> {
                        ticket.setImage(null); // Escludi image per evitare loop
                        return ticket;
                    })
                    .toList();
        }

    // Restituisce un ticket specifico sulla base dell'ID specificato
    public Ticket getTicketById(int id) {
        return ticketRepository.findById(id).orElse(null);
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
