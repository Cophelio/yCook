package pl.coderslab.ycook.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.ycook.entity.Recipe;

import java.util.List;

@Repository
public interface RecipeRepository extends JpaRepository<Recipe, Long> {
    Recipe findById(int id);

    List<Recipe> findAll();

    List<Recipe> findAllByName(String name);

    List<Recipe> findAllByCuisine(long cuisineValue);

    List<Recipe> findAllByNameAndCuisine(String name, long cuisineValue);
}
