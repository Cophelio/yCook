package pl.coderslab.ycook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.ycook.entity.CuisineType;
import pl.coderslab.ycook.repository.CuisineTypeRepository;

import java.util.ArrayList;
import java.util.Optional;

@Service
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

    @Override
    public CuisineType findById(long id) {
        Optional<CuisineType> byId = cuisineTypeRepository.findById(id);
        return byId.get();
    }

    @Override
    public CuisineType findByName(String name) {
        return cuisineTypeRepository.findByName(name);
    }
}
