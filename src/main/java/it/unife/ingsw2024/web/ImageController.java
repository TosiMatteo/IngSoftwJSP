package it.unife.ingsw2024.web;


import it.unife.ingsw2024.models.Image;
import it.unife.ingsw2024.services.ImageService;
import it.unife.ingsw2024.utiliies.ImageUtility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("/api/images")
public class ImageController {

    @Autowired
    private ImageService imageService;


    @PostMapping
    public Integer updloadImage(
            @RequestParam("formFile") MultipartFile image) throws IOException {

        // Prelevo il node del file originale
        String imageName = image.getOriginalFilename();
        // Estraggo l'estensione
        String ext = Objects.requireNonNull(imageName)
                .substring(imageName.lastIndexOf(".") + 1)
                .toLowerCase();
        // Prelevo i dati e li comprimo
        byte[] content = ImageUtility.compressImage(image.getBytes());

        // Creo un nuovo oggetto di tipo immagine e setto tutti i valori
        Image img = new Image();
        img.setImage_name(imageName);
        img.setImage_type(ext);
        img.setImage_data(content);

        Integer imageId = imageService.uploadImage(img);

        return imageId;
    }


    public Image getImageById(Integer imageId) {
        return imageService.getImageById(imageId);
    }


    public List<Image> getAllImages() {
        return imageService.getAllImages();
    }

}