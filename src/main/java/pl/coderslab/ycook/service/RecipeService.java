package pl.coderslab.ycook.service;

import pl.coderslab.ycook.entity.Recipe;

public interface RecipeService {
    void save(Recipe recipe);

    Recipe findById(int id);
}
