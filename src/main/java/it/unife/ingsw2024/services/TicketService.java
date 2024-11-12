package it.unife.ingsw2024.services;

import it.unife.ingsw2024.models.Ticket;
import it.unife.ingsw2024.repositories.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service // Questa classe è un servizio che gestisce la logica di business per i ticket.
public class TicketService {

    @Autowired // Inietta il repository per accedere ai dati relativi ai ticket.
    private TicketRepository ticketRepository;

    // Restituisce tutti i ticket dalla tabella.
    public List<Ticket> getAllTickets() {
        return ticketRepository.findAll(); // Chiama il repository per ottenere tutti i ticket dal database.
    }

    //restituisce tutti i ticket che hanno come tematica l'abuso
    public List<Ticket> AbusiTicket() {
        return ticketRepository.findByArgument("Segnalare contenuti offensivi");
    }

    // Restituisce un ticket specifico in base all'ID.
    public Ticket getTicketById(int id) {
        Optional<Ticket> ticket = ticketRepository.findById(id); // Trova il ticket tramite il suo ID.
        return ticket.orElse(null); // Restituisce il ticket se esiste, altrimenti null.
    }

    // Aggiunge un nuovo ticket nel database.
    public void addTicket(Ticket ticket) {
        ticketRepository.save(ticket); // Salva il nuovo ticket nel database.
    }

    // Aggiorna un ticket esistente.
    public void updateTicket(int id, Ticket ticket) {
        ticketRepository.save(ticket); // Salva il ticket aggiornato nel database.
    }

    // Elimina un ticket in base all'ID.
    public void deleteTicket(int id) {
        ticketRepository.deleteById(id); // Elimina il ticket dal database tramite il suo ID.
    }

}
