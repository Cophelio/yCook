package pl.coderslab.ycook.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.ycook.entity.User;
import pl.coderslab.ycook.entity.UserDetails;
import pl.coderslab.ycook.service.SecurityService;
import pl.coderslab.ycook.service.UserDetailsService;
import pl.coderslab.ycook.service.UserService;
import pl.coderslab.ycook.validator.UserValidator;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        User save = userService.save(userForm);

        UserDetails userDetails = new UserDetails();
        userDetails.setUser(save);

        userDetailsService.save(userDetails);

        securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/mainPage";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Twoja nazwa użytkownika lub hasło są niewłaściwe.");

        if (logout != null)
            model.addAttribute("message", "Zostałeś pomyślnie wylogowany.");

        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
