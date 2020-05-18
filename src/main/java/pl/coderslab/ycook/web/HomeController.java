package pl.coderslab.ycook.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

public class HomeController {

    @GetMapping("/")
    public String blank() { return "redirect:/login"; }

    @GetMapping("/welcome")
    public String home() { return "welcome"; }

    @GetMapping("/about")
    @ResponseBody
    public String about() { return "Here you can find some details for logged users"; }
}
