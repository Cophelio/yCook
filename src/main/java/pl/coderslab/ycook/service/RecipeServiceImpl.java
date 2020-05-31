package pl.coderslab.ycook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.ycook.entity.Recipe;
import pl.coderslab.ycook.repository.RecipeRepository;

import java.util.List;

@Service
public class RecipeServiceImpl implements RecipeService {

    @Autowired
    private final RecipeRepository recipeRepository;

    public RecipeServiceImpl(RecipeRepository recipeRepository) {
        this.recipeRepository = recipeRepository;
    }

    @Override
    public Recipe findById(int id) {
        return recipeRepository.findById(id);
    }

    @Override
    public List<Recipe> getAll() {
        return recipeRepository.findAll();
    }

    @Override
    public List<Recipe> findAllByName(String name) {
        return recipeRepository.findAllByName(name);
    }

    @Override
    public List<Recipe> findAllByCuisine(long cuisineValue) {
        return recipeRepository.findAllByCuisine(cuisineValue);
    }

    @Override
    public List<Recipe> findAllByType(long cuisineTypeValue) {
        return recipeRepository.findAllByType(cuisineTypeValue);
    }

    @Override
    public List<Recipe> findAllByFavoriteIsTrue() {
        return recipeRepository.findAllByFavoriteIsTrue();
    }

    @Override
    public List<Recipe> findAllByNameAndCuisine(String name, long cuisineValue) {
        return recipeRepository.findAllByNameAndCuisine(name, cuisineValue);
    }

    @Override
    public List<Recipe> findAllByNameAndType(String name, long cuisineTypeValue) {
        return recipeRepository.findAllByNameAndType(name, cuisineTypeValue);
    }

    @Override
    public List<Recipe> findAllByCuisineAndType(long cuisineValue, long cuisineTypeValue) {
        return recipeRepository.findAllByCuisineAndType(cuisineValue, cuisineTypeValue);
    }

    @Override
    public List<Recipe> findAllByNameAndCuisineAndType(String name, long cuisineValue, long cuisineTypeValue) {
        return recipeRepository.findAllByNameAndCuisineAndType(name, cuisineValue, cuisineTypeValue);
    }


    @Override
    public int countAllByUser_Id(Long user_id) {
        return recipeRepository.countAllByUser_Id(user_id);
    }

    @Override
    public int countAllByUser_IdAndFavorite(Long user_id, boolean favorite) {
        return recipeRepository.countAllByUser_IdAndFavorite(user_id, favorite);
    }

    @Override
    public void save(Recipe recipe) {
        recipeRepository.save(recipe);
    }

    @Override
    public void delete(Recipe recipe, int id) {
        Recipe foundedRecipe = recipeRepository.findById(id);
        recipeRepository.delete(foundedRecipe);
    }

    @Override
    public void update(Recipe recipe, int id) {

    }

    @Override
    public void updateFavToTrue(Recipe recipe, int id) {
        Recipe foundedRecipe = recipeRepository.findById(id);
        foundedRecipe.setFavorite(true);
    }

    @Override
    public void updateFavToFalse(Recipe recipe, int id) {
        Recipe foundedRecipe = recipeRepository.findById(id);
        foundedRecipe.setFavorite(false);
    }
}
