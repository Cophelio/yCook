package pl.coderslab.ycook.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.ycook.entity.Cuisine;
import pl.coderslab.ycook.entity.Recipe;
import pl.coderslab.ycook.repository.CuisineRepository;
import pl.coderslab.ycook.service.CuisineService;
import pl.coderslab.ycook.service.RecipeService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/mainPage")
public class MainPageController {

    @Autowired
    private final CuisineRepository cuisineRepository;

    @Autowired
    private final CuisineService cuisineService;

    @Autowired
    private final RecipeService recipeService;

    public MainPageController(CuisineRepository cuisineRepository, CuisineService cuisineService, RecipeService recipeService) {
        this.cuisineRepository = cuisineRepository;
        this.cuisineService = cuisineService;
        this.recipeService = recipeService;
    }

    @RequestMapping("/recipe/add")
    public String newProduct(Model model) {
        model.addAttribute("recipe", new Recipe());
        return "addRecipe";
    }

    @ModelAttribute("cuisines")
    public Map<String, String> getCuisines() {
        Map<String, String> cuisines = new HashMap<>();
        ArrayList<Cuisine> cuisineList = this.cuisineRepository.findAll();
        for (Cuisine cuisine : cuisineList)
            cuisines.put(String.valueOf(cuisine.getId()), cuisine.getName());
        return cuisines;
    }
}
