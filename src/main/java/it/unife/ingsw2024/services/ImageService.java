package it.unife.ingsw2024.services;


import it.unife.ingsw2024.models.Image;
import it.unife.ingsw2024.repositories.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
// Classi di "tipo" service, gestisce la logica di business relativa alla classe immagini.
public class ImageService {

    @Autowired // Inietta il repository per accedere ai dati relativi alle immagini.
    private ImageRepository imageRepository;


    public Integer uploadImage(Image image) {
        Image img = imageRepository.save(image);
        return img.getId();
    }

    public Image getImageById(Integer id) {
        return imageRepository.findById(id).orElse(null);
    }

    public List<Image> getAllImages() {
        return imageRepository.findAll();
    }


}
