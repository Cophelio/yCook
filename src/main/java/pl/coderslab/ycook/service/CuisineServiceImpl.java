package pl.coderslab.ycook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.ycook.entity.Cuisine;
import pl.coderslab.ycook.repository.CuisineRepository;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class CuisineServiceImpl implements CuisineService {

    @Autowired
    private final CuisineRepository cuisineRepository;

    public CuisineServiceImpl(CuisineRepository cuisineRepository) {
        this.cuisineRepository = cuisineRepository;
    }

    @Override
    public ArrayList<Cuisine> getAll() {
        return cuisineRepository.findAll();
    }

    @Override
    public Cuisine findById(long id) {
        Optional<Cuisine> byId = cuisineRepository.findById(id);
        return byId.get();
    }

    @Override
    public Cuisine findByName(String name) {
        return cuisineRepository.findByName(name);
    }
}
