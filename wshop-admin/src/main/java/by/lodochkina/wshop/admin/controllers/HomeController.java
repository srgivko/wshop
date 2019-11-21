package by.lodochkina.wshop.admin.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController extends WShopAdminBaseController {

    @GetMapping("/home")
    public String home(Model model) {
        return "home";
    }

}