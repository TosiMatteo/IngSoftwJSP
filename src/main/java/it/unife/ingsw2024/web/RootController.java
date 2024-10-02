package it.unife.ingsw2024.web;

import it.unife.ingsw2024.models.User;
import it.unife.ingsw2024.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;


import java.util.List;

@Controller
public class RootController {
    @Autowired
    UserService userService;

    /* metodi per il indirizzare le pagine html */
    @RequestMapping({"/","/supporto"})
    public String supporto(Model model) {
        model.addAttribute("test", this.userService.getAll());
        return "supporto";
    }

    @RequestMapping({"/chatta_con_noi"})
    public String chattaConNoi(Model model) {
        model.addAttribute("test", this.userService.getAll());
        return "chatta_con_noi";
    }

    @RequestMapping({"form"})
    public String form(Model model) {
        model.addAttribute("test", this.userService.getAll());
        return "form";
    }

    @RequestMapping({"/helpdesk"})
    public String Helpdesk(Model model) {
        model.addAttribute("test", this.userService.getAll());
        return "helpdesk";
    }
    /* metodi per il indirizzare le pagine html */





   /* @RequestMapping({"/testWithElements"})
    public List<User> addElements() {
        return this.userService.addElements();
    } */

}