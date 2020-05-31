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

    List<Recipe> findAllByRecommend(boolean recommended);

    List<Recipe> findAllByFavoriteIsTrue();

    List<Recipe> findAllByNameAndCuisine(String name, long cuisineValue);

    List<Recipe> findAllByNameAndType(String name, long cuisineTypeValue);

    List<Recipe> findAllByCuisineAndType(long cuisineValue, long cuisineTypeValue);

    List<Recipe> findAllByNameAndRecommend(String name, boolean recommended);

    List<Recipe> findAllByCuisineAndRecommend(long cuisineValue, boolean recommended);

    List<Recipe> findAllByTypeAndRecommend(long cuisineTypeValue, boolean recommended);

    List<Recipe> findAllByNameAndCuisineAndType(String name, long cuisineValue, long cuisineTypeValue);

    List<Recipe> findAllByNameAndCuisineAndRecommend(String name, long cuisineValue, boolean recommended);

    List<Recipe> findAllByNameAndTypeAndRecommend(String name, long cuisineTypeValue, boolean recommended);

    List<Recipe> findAllByCuisineAndTypeAndRecommend(long cuisineValue, long cuisineTypeValue, boolean recommended);

    List<Recipe> findAllByNameAndCuisineAndTypeAndRecommend(String name, long cuisineValue, long cuisineTypeValue, boolean recommended);

    int countAllByUser_Id(Long user_id);
}
