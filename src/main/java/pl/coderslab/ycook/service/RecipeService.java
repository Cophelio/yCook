package pl.coderslab.ycook.service;

import pl.coderslab.ycook.entity.Recipe;

import java.util.List;

public interface RecipeService {

    void save(Recipe recipe);

    void delete(Recipe recipe, int id);

    void update(Recipe recipe, int id);

    void updateFavToTrue(Recipe recipe, int id);

    void updateFavToFalse(Recipe recipe, int id);

    Recipe findById(int id);

    List<Recipe> getAll();

    List<Recipe> findAllByName(String name);

    List<Recipe> findAllByCuisine(long cuisineValue);

    List<Recipe> findAllByType(long cuisineTypeValue);

    List<Recipe> findAllByFavoriteIsTrue();

    List<Recipe> findAllByNameAndCuisine(String name, long cuisineValue);

    List<Recipe> findAllByNameAndType(String name, long cuisineTypeValue);

    List<Recipe> findAllByCuisineAndType(long cuisineValue, long cuisineTypeValue);

    List<Recipe> findAllByNameAndCuisineAndType(String name, long cuisineValue, long cuisineTypeValue);

    int countAllByUser_Id(Long user_id);

    int countAllByUser_IdAndFavorite(Long user_id, boolean favorite);
}
