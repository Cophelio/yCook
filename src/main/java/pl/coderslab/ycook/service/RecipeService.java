package pl.coderslab.ycook.service;

import pl.coderslab.ycook.entity.Recipe;

import java.util.List;

public interface RecipeService {

    void save(Recipe recipe);

    void delete(Recipe recipe, int id);

    void update(Recipe recipe, int id);

    Recipe findById(int id);

    List<Recipe> getAll();

    List<Recipe> findAllByName(String name);

    List<Recipe> findAllByCuisine(long cuisineValue);

    List<Recipe> findAllByNameAndCuisine(String name, long cuisineValue);
}
