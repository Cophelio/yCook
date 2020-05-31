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
    public List<Recipe> findAllByRecommend(boolean recommended) {
        return recipeRepository.findAllByRecommend(recommended);
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
    public List<Recipe> findAllByNameAndRecommend(String name, boolean recommended) {
        return recipeRepository.findAllByNameAndRecommend(name, recommended);
    }

    @Override
    public List<Recipe> findAllByCuisineAndRecommend(long cuisineValue, boolean recommended) {
        return recipeRepository.findAllByCuisineAndRecommend(cuisineValue, recommended);
    }

    @Override
    public List<Recipe> findAllByTypeAndRecommend(long cuisineTypeValue, boolean recommended) {
        return recipeRepository.findAllByTypeAndRecommend(cuisineTypeValue, recommended);
    }

    @Override
    public List<Recipe> findAllByNameAndCuisineAndType(String name, long cuisineValue, long cuisineTypeValue) {
        return recipeRepository.findAllByNameAndCuisineAndType(name, cuisineValue, cuisineTypeValue);
    }

    @Override
    public List<Recipe> findAllByNameAndCuisineAndRecommend(String name, long cuisineValue, boolean recommended) {
        return recipeRepository.findAllByNameAndCuisineAndRecommend(name, cuisineValue, recommended);
    }

    @Override
    public List<Recipe> findAllByNameAndTypeAndRecommend(String name, long cuisineTypeValue, boolean recommended) {
        return recipeRepository.findAllByNameAndTypeAndRecommend(name, cuisineTypeValue, recommended);
    }

    @Override
    public List<Recipe> findAllByCuisineAndTypeAndRecommend(long cuisineValue, long cuisineTypeValue, boolean recommended) {
        return recipeRepository.findAllByCuisineAndTypeAndRecommend(cuisineValue, cuisineTypeValue, recommended);
    }

    @Override
    public List<Recipe> findAllByNameAndCuisineAndTypeAndRecommend(String name, long cuisineValue, long cuisineTypeValue, boolean recommended) {
        return recipeRepository.findAllByNameAndCuisineAndTypeAndRecommend(name, cuisineValue, cuisineTypeValue, recommended);
    }

    @Override
    public int countAllByUser_Id(Long user_id) {
        return recipeRepository.countAllByUser_Id(user_id);
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
