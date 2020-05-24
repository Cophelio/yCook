package pl.coderslab.ycook.service;

import pl.coderslab.ycook.entity.Cuisine;
import java.util.ArrayList;

public interface CuisineService {
    ArrayList<Cuisine> getAll();

    Cuisine findById(long id);
}
