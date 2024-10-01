package it.unife.ingsw2024.web;

import it.unife.ingsw2024.models.MyTable;
import it.unife.ingsw2024.services.MyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;


import java.util.List;

@Controller
public class RootController {
    @Autowired
    MyService myService;

    @RequestMapping({"/","/supporto"})
    public String supporto(Model model) {
        model.addAttribute("test", this.myService.getAll());
        return "supporto";
    }

    @RequestMapping({"/chatta_con_noi"})
    public String chattaConNoi(Model model) {
        model.addAttribute("test", this.myService.getAll());
        return "chatta_con_noi";
    }

    @RequestMapping({"form"})
    public String form(Model model) {
        model.addAttribute("test", this.myService.getAll());
        return "form";
    }

    @RequestMapping({"/helpdesk"})
    public String Helpdesk(Model model) {
        model.addAttribute("test", this.myService.getAll());
        return "helpdesk";
    }


    @RequestMapping({"/testWithElements"})
    public List<MyTable> addElements() {
        return this.myService.addElements();
    }
}