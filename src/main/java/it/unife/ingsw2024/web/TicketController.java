package it.unife.ingsw2024.web;

import it.unife.ingsw2024.models.Ticket;
import it.unife.ingsw2024.models.User;
import it.unife.ingsw2024.services.TicketService;
import it.unife.ingsw2024.services.UserService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;

@RestController // Indica che questa classe gestisce richieste REST e restituisce dati come JSON o XML.
@RequestMapping("/api/tickets") // Imposta il prefisso "/api/tickets" per tutti gli endpoint di questo controller.
public class TicketController {

    @Autowired // Inietta l'istanza del TicketService gestita da Spring.
    private TicketService ticketService;

    @Autowired
    private UserService userService; // Iniettato per recuperare l'utente tramite ID

    // Gestisce le richieste GET su "/api/tickets" per ottenere tutti i ticket.
    @GetMapping()
    public List<Ticket> getTickets(){
        return ticketService.getAllTickets(); // Chiama il servizio per ottenere la lista di tutti i ticket.
    }

    // Gestisce le richieste GET su "/api/tickets?id={id}" per ottenere un ticket specifico.
    @GetMapping("/{id}")
    public Ticket getTicket(@RequestParam int id){
        return ticketService.getTicketById(id); // Chiama il servizio per ottenere un ticket specifico in base all'ID.
    }

    // Gestisce le richieste POST su "/api/tickets" per aggiungere un nuovo ticket.
    @PostMapping
    public ResponseEntity<?> addTicket(@RequestBody Ticket ticket) {
        if (ticket.getUser() == null || ticket.getUser().getId() == 0) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("User ID mancante o non valido");
        }

        // Recupera l'utente in base all'ID
        User user = userService.getUserById(ticket.getUser().getId());

        if (user == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Utente non trovato");
        }

        // Associa l'utente al ticket
        ticket.setUser(user);

        // Salva il ticket
        ticketService.addTicket(ticket);

        return ResponseEntity.status(HttpStatus.CREATED).body(ticket);
    }


    // Gestisce le richieste PUT su "/api/tickets/{id}" per aggiornare un ticket esistente.
    @PutMapping("/{id}")
    public void updateTicket(@PathVariable int id, @RequestBody Ticket ticket) {
        ticketService.updateTicket(id, ticket); // Chiama il servizio per aggiornare il ticket con l'ID specificato.
    }

    // Gestisce le richieste DELETE su "/api/tickets/{id}" per eliminare un ticket.
    @DeleteMapping("/{id}")
    public void deleteTicket(@PathVariable int id) {
        ticketService.deleteTicket(id); // Chiama il servizio per eliminare il ticket con l'ID specificato.
    }

    // Gestisce richieste GET su "/api/tickets/abusi per ottenere tutti i ticket che hanno come tematica l'abuso
    @GetMapping("/abusi")
    public List<Ticket> getAbusi() {
        return ticketService.AbusiTicket(); //Chiama il servizio per ottenere la lista di tutti i ticket con argomento Segnalare contenuti offensivi
    }

    @PostMapping("/updateStatus/{id}")
    public RedirectView updateTicketStatus(@PathVariable int id, @RequestParam int status, HttpServletRequest request) {
        Ticket ticket = ticketService.getTicketById(id);

        if (ticket != null) {
            ticket.cambiaStatusTicket(status);
            ticketService.updateTicket(id, ticket);
        }

        // Recupera l'URL della pagina precedente dall'intestazione 'Referer'
        String previousUrl = request.getHeader("Referer");
        return new RedirectView(previousUrl != null ? previousUrl : "/");
    }

    @PostMapping("/updateResponse/{id}")
    public RedirectView updateTicketResponse(@PathVariable int id, @RequestParam String textAnswer, HttpServletRequest request) {
        Ticket ticket = ticketService.getTicketById(id);

        if (ticket != null) {
            ticket.setResponse(textAnswer);
            ticket.setProgress(2); // Imposta lo stato del ticket a "Risolto= chiuso"
            ticketService.updateTicket(id, ticket);
        }

        // Recupera l'URL della pagina precedente dall'intestazione 'Referer'
        String previousUrl = request.getHeader("Referer");
        return new RedirectView(previousUrl != null ? previousUrl : "/");
    }

    @PostMapping("/addNewTicket")
    public RedirectView addNewTicket(@RequestParam String nome, @RequestParam String cognome, @RequestParam String email, @RequestParam String telefono, @RequestParam String selectTematica, @RequestParam String selectArgomento, @RequestParam String dettagli, HttpServletRequest request) {
        Ticket ticket = new Ticket();
        //find user ID by name and surname and email
        ticket.setTopic(selectTematica);
        ticket.setArgument(selectArgomento);
        ticket.setDetail(dettagli);
        ticket.setProgress(0); // Imposta lo stato del ticket a "Da visionare"
        if(userService.getUserByEmail(email) == null){
            User user = new User();
            user.setFirstname(nome);
            user.setSurname(cognome);
            user.setEmail(email);
            user.setPhone(telefono);
            userService.addUser(user);
        }
        ticket.setUser(userService.getUserByEmail(email));
        ticketService.addTicket(ticket);

        // Recupera l'URL della pagina precedente dall'intestazione 'Referer'
        String previousUrl = request.getHeader("Referer");
        return new RedirectView(previousUrl != null ? previousUrl : "/");
    }

}
