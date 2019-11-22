package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.entities.Category;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class CategoryController extends WShopSiteBaseController {

    @GetMapping("/categories/{id}")
    public String category(@PathVariable("id") Category category, Model model) {
        model.addAttribute("category", category);
        return "category";
    }

    @Override
    protected String getHeaderTitle() {
        return "Категория";
    }
}
