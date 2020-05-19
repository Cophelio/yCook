package pl.coderslab.ycook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.ycook.entity.Cuisine;
import pl.coderslab.ycook.repository.CuisineRepository;

import java.util.ArrayList;

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
}
