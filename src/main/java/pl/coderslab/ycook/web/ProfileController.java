package pl.coderslab.ycook.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.ycook.entity.Recipe;
import pl.coderslab.ycook.entity.User;
import pl.coderslab.ycook.entity.UserDetails;
import pl.coderslab.ycook.service.RecipeService;
import pl.coderslab.ycook.service.UserDetailsService;
import pl.coderslab.ycook.service.UserService;
import pl.coderslab.ycook.validator.UserValidator;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ProfileController {

    @Autowired
    private final UserService userService;

    @Autowired
    private final UserDetailsService userDetailsService;

    @Autowired
    private final RecipeService recipeService;

    @Autowired
    private UserValidator userValidator;

    public ProfileController(UserService userService, UserDetailsService userDetailsService, RecipeService recipeService) {
        this.userService = userService;
        this.userDetailsService = userDetailsService;
        this.recipeService = recipeService;
    }

    @GetMapping("/profile/{id}")
    public String viewProfile(@PathVariable int id, Model model) {
        User user = userService.findById(id);
        model.addAttribute("user", user);
        return "profile";
    }

    @RequestMapping("/profile/{id}/changePassword")
//    @PreAuthorize("hasRole('ROLE_USER')")
    public String changePassword(@PathVariable int id, HttpServletRequest request, BindingResult bindingResult) {
//
//        userValidator.validate(passwordForm, bindingResult);
//
//        if (bindingResult.hasErrors()) {
//            return "profile";
//        }

        String password = request.getParameter("password");

        User foundedUser = userService.findById(id);
        userService.changePassword(foundedUser, password);
        userService.save(foundedUser);
        return "profile";
    }

    @GetMapping("/profile/{id}/editPersonalInformation")
    public String editPersonalInformation(@PathVariable long id, Model model) {
        User byId = userService.findById(id);
        UserDetails foundedUser = userDetailsService.findByUser(byId);
        model.addAttribute("foundedUser", foundedUser);

        return "editUserDetails";
    }

    @RequestMapping("/profile/{id}/editPersonalInformation")
    public String addPersonalInformation(@PathVariable int id, HttpServletRequest request) {
        User byId = userService.findById(id);
        UserDetails foundedUser = userDetailsService.findByUser(byId);

        String about = request.getParameter("about");
        String favouriteKitchen = request.getParameter("favouriteKitchen");
        String contact = request.getParameter("contact");

        long userId = getUserId();

        userDetailsService.update(foundedUser, userId, about, favouriteKitchen, contact);

        return "redirect:/profile/{id}";
    }


    @ModelAttribute("numberOfRecipesByUser")
    public int getNumberOfRecipesForUser() {
        try {
            return recipeService.countAllByUser_Id(getUserId());
        } catch (NullPointerException ignored) {
        }
        return 0;
    }

    @ModelAttribute("numberOfFavoriteRecipes")
    public int getNumberOfFavoriteRecipes() {
        try {
            return recipeService.countAllByUser_IdAndFavorite(getUserId(), true);
        } catch (NullPointerException ignored) {
        }
        return 0;
    }

    @ModelAttribute("getAbout")
    public String getAbout() {
        try {
            UserDetails byId = userDetailsService.findById(getUserId());
            return byId.getAbout().isEmpty() ? "Brak" : byId.getAbout();


        } catch (NullPointerException ignored) {
        }
        return "Brak";
    }

    @ModelAttribute("getContact")
    public String getContact() {
        try {
            UserDetails byId = userDetailsService.findById(getUserId());
            return byId.getContact().isEmpty() ? "Brak" : byId.getContact();

        } catch (NullPointerException ignored) {
        }
        return "Brak";
    }

    @ModelAttribute("getFavoriteKitchen")
    public String getFavoriteKitchen() {
        try {
            UserDetails byId = userDetailsService.findById(getUserId());
            return byId.getFavouriteKitchen().isEmpty() ? "Brak" : byId.getFavouriteKitchen();

        } catch (NullPointerException ignored) {
        }
        return "Brak";
    }

    @ModelAttribute("getActualUserId")
    public long getActualUserId() {
        try {
            return getUserId();
        } catch (NullPointerException ignored) {
        }
        return 0;
    }

    private long getUserId() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        org.springframework.security.core.userdetails.User principal =
                (org.springframework.security.core.userdetails.User) authentication.getPrincipal();
        User user = userService.findByUsername(principal.getUsername());
        return user.getId();
    }
}
