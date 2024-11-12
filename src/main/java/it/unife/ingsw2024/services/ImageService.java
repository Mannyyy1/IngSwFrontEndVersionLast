package it.unife.ingsw2024.services;


import it.unife.ingsw2024.models.Image;
import it.unife.ingsw2024.repositories.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImageService {
    @Autowired
    private ImageRepository imageRepository;


}
