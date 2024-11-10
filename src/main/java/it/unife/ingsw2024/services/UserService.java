package it.unife.ingsw2024.services;

import it.unife.ingsw2024.models.User;
import it.unife.ingsw2024.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
// Classi di "tipo" service, gestisce la logica di business relativa alla classe utenti.
public class UserService {

    @Autowired // Inietta il repository per accedere ai dati relativi agli utenti.
    private UserRepository userRepository;

    // Restituisce tutti gli utenti della tabella nel DB per mezzo di repository
    public List<User> getAll() {
        return userRepository.findAll();
    }

    // Restituisce un utente specifico sulla base dell'ID specificato
    public User getUserById(int id) {
        return userRepository.findById(id).orElse(null);
    }

    // Aggiunge un nuovo utente nel DB per mezzo di repository
    public void addUser(User user) {
        userRepository.save(user);
    }

    // Aggiorna un ticket esistente per mezzo di repository
    public void updateUser(int id, User user) {
        userRepository.save(user);
    }

    // Elimina un ticket in base all'ID per mezzo di repository
    public void deleteUser(int id) {
        userRepository.deleteById(id);
    }

    // Restituisce un utente specifico sulla base della mail specificata
    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }
}
