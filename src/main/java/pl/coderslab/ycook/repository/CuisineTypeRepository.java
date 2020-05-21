package pl.coderslab.ycook.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.ycook.entity.CuisineType;

import java.util.ArrayList;

public interface CuisineTypeRepository extends JpaRepository<CuisineType, Long> {
    ArrayList<CuisineType> findAll();
}
