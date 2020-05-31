package pl.coderslab.ycook.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.ycook.entity.Cuisine;
import pl.coderslab.ycook.entity.CuisineType;
import pl.coderslab.ycook.entity.Recipe;
import pl.coderslab.ycook.entity.User;
import pl.coderslab.ycook.service.CuisineService;
import pl.coderslab.ycook.service.CuisineTypeService;
import pl.coderslab.ycook.service.RecipeService;
import pl.coderslab.ycook.service.UserService;
import pl.coderslab.ycook.validator.RecipeValidator;
import pl.coderslab.ycook.viewModel.RecipeViewModel;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MainPageController {

    @Autowired
    private final CuisineService cuisineService;

    @Autowired
    private final CuisineTypeService cuisineTypeService;

    @Autowired
    private final RecipeService recipeService;

    @Autowired
    private final RecipeValidator recipeValidator;

    @Autowired
    private final UserService userService;

    public MainPageController(
            CuisineService cuisineService,
            CuisineTypeService cuisineTypeService,
            RecipeService recipeService,
            RecipeValidator recipeValidator,
            UserService userService
    ) {
        this.cuisineService = cuisineService;
        this.cuisineTypeService = cuisineTypeService;
        this.recipeService = recipeService;
        this.recipeValidator = recipeValidator;
        this.userService = userService;
    }

    @GetMapping({"/", "/mainPage"})
    public String mainPage(Model model, HttpServletRequest request) {
        List<RecipeViewModel> result = new ArrayList<>();

        String name = null;
        String cuisineValue = null;
        String cuisineTypeValue = null;
        boolean recommended = false;

        if (request.getParameter("name") != null && !(request.getParameter("name").isEmpty())) {
            name = request.getParameter("name");
        }
        if (request.getParameter("cuisineValue") != null && !(request.getParameter("cuisineValue").isEmpty())) {
            cuisineValue = request.getParameter("cuisineValue");
        }
        if (request.getParameter("cuisineTypeValue") != null && !(request.getParameter("cuisineTypeValue").isEmpty())) {
            cuisineTypeValue = request.getParameter("cuisineTypeValue");
        }
//        if (request.getParameter("recommended") == false && !(request.getParameter("recommended").isEmpty())) {
//            recommended = request.getParameter("recommended");
//        }

        if (name != null && cuisineValue != null && cuisineTypeValue != null) {
            long cuisineId = cuisineService.findByName(cuisineValue).getId();
            long cuisineTypeId = cuisineTypeService.findByName(cuisineTypeValue).getId();
            List<Recipe> filteredRecipes = recipeService.findAllByNameAndCuisineAndType(name, cuisineId, cuisineTypeId);

            returnViewModel(filteredRecipes, result);

            model.addAttribute("allRecipes", result);
            return "mainPage";
        }

        if (name != null && cuisineValue != null) {
            long cuisineId = cuisineService.findByName(cuisineValue).getId();
            List<Recipe> filteredRecipes = recipeService.findAllByNameAndCuisine(name, cuisineId);

            returnViewModel(filteredRecipes, result);

            model.addAttribute("allRecipes", result);
            return "mainPage";
        }

        if (name != null && cuisineTypeValue != null) {
            long cuisineTypeId = cuisineTypeService.findByName(cuisineTypeValue).getId();
            List<Recipe> filteredRecipes = recipeService.findAllByNameAndType(name, cuisineTypeId);

            returnViewModel(filteredRecipes, result);

            model.addAttribute("allRecipes", result);
            return "mainPage";
        }

        if (cuisineValue != null && cuisineTypeValue != null) {
            long cuisineId = cuisineService.findByName(cuisineValue).getId();
            long cuisineTypeId = cuisineTypeService.findByName(cuisineTypeValue).getId();
            List<Recipe> filteredRecipes = recipeService.findAllByCuisineAndType(cuisineId, cuisineTypeId);

            returnViewModel(filteredRecipes, result);

            model.addAttribute("allRecipes", result);
            return "mainPage";
        }

        if (name != null) {
            List<Recipe> filteredRecipes = recipeService.findAllByName(name);

            returnViewModel(filteredRecipes, result);

            model.addAttribute("allRecipes", result);
            return "mainPage";
        }

        if (cuisineValue != null) {
            long cuisineId = cuisineService.findByName(cuisineValue).getId();
            List<Recipe> filteredRecipes = recipeService.findAllByCuisine(cuisineId);

            returnViewModel(filteredRecipes, result);

            model.addAttribute("allRecipes", result);
            return "mainPage";
        }

        if (cuisineTypeValue != null) {
            long cuisineTypeId = cuisineTypeService.findByName(cuisineTypeValue).getId();
            List<Recipe> filteredRecipes = recipeService.findAllByType(cuisineTypeId);

            returnViewModel(filteredRecipes, result);

            model.addAttribute("allRecipes", result);
            return "mainPage";
        }

        List<Recipe> recipes = recipeService.getAll();

        returnViewModel(recipes, result);

        model.addAttribute("allRecipes", result);
        return "mainPage";
    }

    @GetMapping("/mainPage/recipe/{id}")
    public String viewRecipe(@PathVariable int id, Model model) {
        Recipe recipe = recipeService.findById(id);
        Cuisine cuisine = cuisineService.findById(recipe.getCuisine());
        CuisineType cuisineType = cuisineTypeService.findById(recipe.getType());
        RecipeViewModel actualRecipe = new RecipeViewModel(recipe, cuisine.getName(), cuisineType.getName());
        model.addAttribute("actualRecipe", actualRecipe);

        return "viewRecipe";
    }

    @GetMapping("/mainPage/favorite")
    public String viewFavoriteRecipeList(Model model) {
        List<RecipeViewModel> result = new ArrayList<>();
        List<Recipe> recipes = recipeService.findAllByFavoriteIsTrue();

        returnViewModel(recipes, result);

        model.addAttribute("allFavRecipes", result);
        return "favList";
    }

    @GetMapping("/mainPage/recipe/add/favorite/{id}")
    public String addToFav(@PathVariable int id) {
        Recipe recipe = recipeService.findById(id);
        recipeService.updateFavToTrue(recipe, id);
        recipeService.save(recipe);
        return "redirect:/mainPage";
    }

    @GetMapping("/mainPage/recipe/delete/favorite/{id}")
    public String deleteFromFav(@PathVariable int id) {
        Recipe recipe = recipeService.findById(id);
        recipeService.updateFavToFalse(recipe, id);
        recipeService.save(recipe);
        return "redirect:/mainPage";
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
            return "editRecipe";
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
            return "addRecipe";
        }

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        org.springframework.security.core.userdetails.User principal =
                (org.springframework.security.core.userdetails.User) authentication.getPrincipal();
        User user = userService.findByUsername(principal.getUsername());
        recipe.setUser(user);
        recipeService.save(recipe);

        return "redirect:/mainPage";
    }

    @ModelAttribute("cuisines")
    public Map<String, String> getCuisines() {
        Map<String, String> cuisines = new HashMap<>();
        ArrayList<Cuisine> cuisineList = this.cuisineService.getAll();
        for (Cuisine cuisine : cuisineList)
            cuisines.put(String.valueOf(cuisine.getId()), cuisine.getName());
        return cuisines;
    }

    @ModelAttribute("cuisineTypes")
    public Map<String, String> getCuisineTypes() {
        Map<String, String> cuisineTypes = new HashMap<>();
        ArrayList<CuisineType> cuisineTypeList = this.cuisineTypeService.getAll();
        for (CuisineType cuisineType : cuisineTypeList)
            cuisineTypes.put(String.valueOf(cuisineType.getId()), cuisineType.getName());
        return cuisineTypes;
    }


    @ModelAttribute("numberOfRecipesByUser")
    public int getNumberOfRecipesForUser() {
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            org.springframework.security.core.userdetails.User principal =
                    (org.springframework.security.core.userdetails.User) authentication.getPrincipal();
            User user = userService.findByUsername(principal.getUsername());
            Long userId = user.getId();
            return recipeService.countAllByUser_Id(userId);
        } catch (NullPointerException e) {
        }
        return 0;
    }

    private void returnViewModel(List<Recipe> filteredRecipes, List<RecipeViewModel> result) {
        for (Recipe recipe : filteredRecipes) {
            Cuisine cuisine = cuisineService.findById(recipe.getCuisine());
            CuisineType cuisineType = cuisineTypeService.findById(recipe.getType());
            RecipeViewModel recipeViewModel = new RecipeViewModel(recipe, cuisine.getName(), cuisineType.getName());
            result.add(recipeViewModel);
        }
    }
}
