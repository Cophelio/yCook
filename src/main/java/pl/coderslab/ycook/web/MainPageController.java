package pl.coderslab.ycook.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.ycook.entity.Recipe;

@Controller
@RequestMapping("/mainPage")
public class MainPageController {

    @RequestMapping("/recipe/add")
    public String newProduct(Model model) {
        model.addAttribute("recipe", new Recipe());
        return "addRecipe";
    }


}
