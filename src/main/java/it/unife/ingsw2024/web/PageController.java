package it.unife.ingsw2024.web;

import it.unife.ingsw2024.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

    @Autowired
    UserService userService;

    @RequestMapping({"/", "/supporto"})
    public String supporto(Model model) {
        model.addAttribute("test", this.userService.getAll());
        return "supporto";
    }

    @RequestMapping("/chatta_con_noi")
    public String chattaConNoi(Model model) {
        model.addAttribute("test", this.userService.getAll());
        return "chatta_con_noi";
    }

    @RequestMapping("/form")
    public String form(Model model) {
        model.addAttribute("test", this.userService.getAll());
        return "form";
    }

    @RequestMapping("/helpdesk")
    public String helpdesk(Model model) {
        model.addAttribute("test", this.userService.getAll());
        return "helpdesk";
    }
}
