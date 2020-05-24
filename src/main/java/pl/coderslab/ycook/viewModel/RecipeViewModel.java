package pl.coderslab.ycook.viewModel;

import pl.coderslab.ycook.entity.Recipe;

public class RecipeViewModel {

    private int id;

    private String name;

    private String cuisine;

    private String type;

    private String ingredients;

    private String description;

    private String kcal;

    private String other;

    private String time;

    private String level;

    private boolean recommend;

    public RecipeViewModel() {
    }

    public RecipeViewModel(Recipe recipe, String cuisine, String type) {
        this.id = recipe.getId();
        this.name = recipe.getName();
        this.cuisine = cuisine;
        this.type = type;
        this.ingredients = recipe.getIngredients();
        this.description = recipe.getDescription();
        this.kcal = recipe.getKcal();
        this.other = recipe.getOther();
        this.time = recipe.getTime();
        this.level = recipe.getLevel();
        this.recommend = recipe.isRecommend();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCuisine() {
        return cuisine;
    }

    public void setCuisine(String cuisine) {
        this.cuisine = cuisine;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getKcal() {
        return kcal;
    }

    public void setKcal(String kcal) {
        this.kcal = kcal;
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public boolean isRecommend() {
        return recommend;
    }

    public void setRecommend(boolean recommend) {
        this.recommend = recommend;
    }
}
