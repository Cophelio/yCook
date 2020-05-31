package pl.coderslab.ycook.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.ycook.entity.Recipe;

import java.util.List;

@Repository
public interface RecipeRepository extends JpaRepository<Recipe, Long> {
    Recipe findById(int id);

    int countAllByUser_Id(Long user_id);

    int countAllByUser_IdAndFavorite(Long user_id, boolean favorite);

    List<Recipe> findAll();

    List<Recipe> findAllByName(String name);

    List<Recipe> findAllByCuisine(long cuisineValue);

    List<Recipe> findAllByType(long cuisineTypeValue);

    List<Recipe> findAllByFavoriteIsTrue();

    List<Recipe> findAllByNameAndCuisine(String name, long cuisineValue);

    List<Recipe> findAllByNameAndType(String name, long cuisineTypeValue);

    List<Recipe> findAllByCuisineAndType(long cuisineValue, long cuisineTypeValue);

    List<Recipe> findAllByNameAndCuisineAndType(String name, long cuisineValue, long cuisineTypeValue);


}
