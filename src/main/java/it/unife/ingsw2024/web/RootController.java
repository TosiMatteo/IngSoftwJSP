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
    @RequestMapping("/")
    public String helloWorld() {
        return "view";
    }

    @RequestMapping("/2nd")
    public String secondSubPage() {
        return "test/list";
    }

    @RequestMapping({"/testMysql"})
    public String testMysql(Model model) {
        model.addAttribute("test", this.myService.getAll());
        return "testMysql";
    }

    @RequestMapping({"/view"})
    public String view(Model model) {
        model.addAttribute("test", this.myService.getAll());
        return "view";
    }

    @RequestMapping({"/chatta_con_noi"})
    public String chattaConNoi(Model model) {
        model.addAttribute("test", this.myService.getAll());
        return "chatta_con_noi";
    }




    @RequestMapping({"/testWithElements"})
    public List<MyTable> addElements() {
        return this.myService.addElements();
    }
}