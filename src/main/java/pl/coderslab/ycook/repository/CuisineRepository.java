package pl.coderslab.ycook.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.ycook.entity.Cuisine;

import java.util.ArrayList;

public interface CuisineRepository extends JpaRepository<Cuisine, Long> {
        ArrayList<Cuisine> findAll();

        Cuisine findByName(String name);
}
