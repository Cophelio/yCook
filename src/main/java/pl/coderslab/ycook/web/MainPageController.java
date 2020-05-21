package pl.coderslab.ycook.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.ycook.entity.Cuisine;
import pl.coderslab.ycook.entity.CuisineType;
import pl.coderslab.ycook.entity.Recipe;
import pl.coderslab.ycook.repository.CuisineRepository;
import pl.coderslab.ycook.repository.CuisineTypeRepository;
import pl.coderslab.ycook.repository.RecipeRepository;
import pl.coderslab.ycook.service.CuisineService;
import pl.coderslab.ycook.service.RecipeService;
import pl.coderslab.ycook.validator.RecipeValidator;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MainPageController {

    @Autowired
    private final CuisineRepository cuisineRepository;

    @Autowired
    private final CuisineTypeRepository cuisineTypeRepository;

    @Autowired
    private final CuisineService cuisineService;

    @Autowired
    private final RecipeService recipeService;

    @Autowired
    private final RecipeValidator recipeValidator;

    @Autowired
    private final RecipeRepository recipeRepository;

    public MainPageController(
            CuisineRepository cuisineRepository,
            CuisineTypeRepository cuisineTypeRepository,
            CuisineService cuisineService, RecipeService recipeService,
            RecipeValidator recipeValidator, RecipeRepository recipeRepository) {
        this.cuisineRepository = cuisineRepository;
        this.cuisineTypeRepository = cuisineTypeRepository;
        this.cuisineService = cuisineService;
        this.recipeService = recipeService;
        this.recipeValidator = recipeValidator;
        this.recipeRepository = recipeRepository;
    }

    @GetMapping({"/", "/mainPage"})
    public String mainPage(Model model) {
        List<Recipe> recipes = recipeService.getAll();
        model.addAttribute("allRecipes", recipes);
        return "mainPage";
    }

    @GetMapping("/mainPage/recipe/delete/{id}")
    public String deleteRecipe(@PathVariable int id) {
        Recipe recipe = recipeService.findById(id);
        recipeService.delete(recipe, id);
        return "redirect:/mainPage";
    }

    @RequestMapping("/mainPage/recipe/edit/{id}")
    public String editRecipe(@PathVariable int id, Model model) {
        Recipe recipe = recipeService.findById(id);
        model.addAttribute("foundedRecipe", recipe);
        return "editRecipe";
    }

    @PostMapping("/mainPage/recipe/edit/{id}")
    public String editedRecipe(@ModelAttribute("foundedRecipe") Recipe recipe, BindingResult bindingResult) {
        recipeValidator.validate(recipe, bindingResult);

        if (bindingResult.hasErrors()) {
            return "redirect:/mainPage/recipe/edit/{id}";
        }

        recipeService.save(recipe);

        return "redirect:/mainPage";
    }

    @RequestMapping("/mainPage/recipe/add")
    public String newRecipe(Model model) {
        model.addAttribute("recipe", new Recipe());
        return "addRecipe";
    }

    @PostMapping("/mainPage/recipe/add")
    public String addRecipe(@ModelAttribute("recipe") Recipe recipe, BindingResult bindingResult) {
        recipeValidator.validate(recipe, bindingResult);

        if (bindingResult.hasErrors()) {
            return "redirect:/mainPage/recipe/add";
        }

        recipeService.save(recipe);

        return "redirect:/mainPage";
    }

    @ModelAttribute("cuisines")
    public Map<String, String> getCuisines() {
        Map<String, String> cuisines = new HashMap<>();
        ArrayList<Cuisine> cuisineList = this.cuisineRepository.findAll();
        for (Cuisine cuisine : cuisineList)
            cuisines.put(String.valueOf(cuisine.getId()), cuisine.getName());
        return cuisines;
    }

    @ModelAttribute("cuisineTypes")
    public Map<String, String> getCuisineTypes() {
        Map<String, String> cuisineTypes = new HashMap<>();
        ArrayList<CuisineType> cuisineTypeList = this.cuisineTypeRepository.findAll();
        for (CuisineType cuisineType : cuisineTypeList)
            cuisineTypes.put(String.valueOf(cuisineType.getId()), cuisineType.getName());
        return cuisineTypes;
    }
}
