package it.unife.ingsw2024.services;


import it.unife.ingsw2024.models.User;
import it.unife.ingsw2024.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/* Service class per interrogare il db  */
@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    /* Metodo che effettua una select all sulla tabella Mysql */
    public List<User> getAll() {
        return userRepository.findAll();
    }

    /* Metodo che effettua una select by Id sulla tabella Mysql */
    public User getById(long id) {
        Optional<User> user = userRepository.findById(id);
        return user.orElse(null);
    }

    /* Metodo che salva un record sulla tabella  */
    public User addUser(User user) {
        return userRepository.save(user);
    }

    public User updateUser(User user) {
        return userRepository.save(user);
    }

    public void deleteUser(User user) {
        userRepository.delete(user);
    }

    /* Metodo che inserisce dati e li recupera da un db H2 (in assenza di mysql)
    public List<User> addElements() {
        this.insert(new User(1L, "Test 1"));
        this.insert(new User(2L, "Test 2"));
        this.insert(new User(3L, "Test 3"));
        return this.getAll();
    }
    */
}
