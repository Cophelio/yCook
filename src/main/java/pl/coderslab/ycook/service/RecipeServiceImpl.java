package pl.coderslab.ycook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.ycook.entity.Recipe;
import pl.coderslab.ycook.repository.RecipeRepository;

@Service
public class RecipeServiceImpl implements RecipeService {

    @Autowired
    private final RecipeRepository recipeRepository;

    public RecipeServiceImpl(RecipeRepository recipeRepository) {
        this.recipeRepository = recipeRepository;
    }

    @Override
    public void save(Recipe recipe) {
        recipe.setName(recipe.getName());
        recipe.setCuisine(recipe.getCuisine());
        recipe.setType(recipe.getType());
        recipe.setIngredients(recipe.getIngredients());
        recipe.setDescription(recipe.getDescription());
        recipe.setKcal(recipe.getKcal());
        recipe.setOther(recipe.getOther());
        recipe.setTime(recipe.getTime());
        recipe.setLevel(recipe.getLevel());
        recipe.setRecommend(recipe.isRecommend());
        recipeRepository.save(recipe);
    }

    @Override
    public Recipe findById(int id) {
        return recipeRepository.findById(id);
    }
}
