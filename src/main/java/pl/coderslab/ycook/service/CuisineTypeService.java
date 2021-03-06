package pl.coderslab.ycook.service;

import pl.coderslab.ycook.entity.CuisineType;

import java.util.ArrayList;

public interface CuisineTypeService {
    ArrayList<CuisineType> getAll();

    CuisineType findById(long id);

    CuisineType findByName(String name);
}
