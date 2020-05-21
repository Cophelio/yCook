package pl.coderslab.ycook.service;

import org.springframework.beans.factory.annotation.Autowired;
import pl.coderslab.ycook.entity.Cuisine;
import pl.coderslab.ycook.entity.Recipe;

import java.util.List;

public interface RecipeService {

    void save(Recipe recipe);

    void delete(Recipe recipe, int id);

    void update(Recipe recipe, int id);

    Recipe findById(int id);

    List<Recipe> getAll();
}
