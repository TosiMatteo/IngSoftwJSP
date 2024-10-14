package it.unife.ingsw2024.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

    @RequestMapping({"/", "/supporto"})
    public String supporto(Model model) {
        model.addAttribute("message", "Homepage supporto");
        return "supporto";
    }

    @RequestMapping("/chatta_con_noi")
    public String chattaConNoi(Model model) {
        model.addAttribute("message", "Pagina chatta con noi");
        return "chatta_con_noi";
    }

    @RequestMapping("/form")
    public String form(Model model) {
        model.addAttribute("message", "Pagina form");
        return "form";
    }

    @RequestMapping("/helpdesk")
    public String helpdesk(Model model) {
        model.addAttribute("message", "Pagina per servizio Helpdesk");
        return "helpdesk";
    }
}
