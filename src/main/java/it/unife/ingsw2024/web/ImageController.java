package it.unife.ingsw2024.web;


import it.unife.ingsw2024.models.Image;
import it.unife.ingsw2024.services.ImageService;
import it.unife.ingsw2024.utiliies.ImageUtility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
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


    // Metodo che restituisce
    public Image getImageById(Integer imageId) {
        return imageService.getImageById(imageId);
    }

    @GetMapping("/downloadImage/{id}")
    public ResponseEntity<ByteArrayResource> downloadImage(@PathVariable Integer id) {
        Image img = imageService.getImageById(id);

        ByteArrayResource resource = new ByteArrayResource(ImageUtility.decompressImage(img.getImage_data()));

        return ResponseEntity.ok().contentType(MediaType.valueOf("image/" + img.getImage_type()))
                .header(HttpHeaders.CONTENT_DISPOSITION,
                        "attachment; filename=\""
                                + img.getImage_name()
                                + "\"")
                .body(resource);
    }


    public List<Image> getAllImages() {
        return imageService.getAllImages();
    }

}