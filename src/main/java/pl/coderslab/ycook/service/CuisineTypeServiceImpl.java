package pl.coderslab.ycook.service;

import org.springframework.beans.factory.annotation.Autowired;
import pl.coderslab.ycook.entity.CuisineType;
import pl.coderslab.ycook.repository.CuisineTypeRepository;

import java.util.ArrayList;

public class CuisineTypeServiceImpl implements CuisineTypeService {

    @Autowired
    private final CuisineTypeRepository cuisineTypeRepository;

    public CuisineTypeServiceImpl(CuisineTypeRepository cuisineTypeRepository) {
        this.cuisineTypeRepository = cuisineTypeRepository;
    }

    @Override
    public ArrayList<CuisineType> getAll() {
        return cuisineTypeRepository.findAll();
    }
}
