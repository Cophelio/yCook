package pl.coderslab.ycook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.ycook.entity.Cuisine;
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
}
