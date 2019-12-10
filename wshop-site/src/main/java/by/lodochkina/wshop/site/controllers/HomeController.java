package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.entities.Category;
import by.lodochkina.wshop.entities.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.*;

@Controller
public class HomeController extends WShopSiteBaseController {

    @Override
    protected String getHeaderTitle() {
        return "Главная страница";
    }

    @ModelAttribute("top5Products")
    public List<Product> getTop5Products() {
        return this.catalogService.getTopPopularProduct(5);
    }

    @GetMapping("/home")
    public String home(Model model) {
        List<Category> previewCategories = new ArrayList<>();
        List<Category> categories = super.catalogService.getAllCategories();
        for (Category category : categories) {
            Set<Product> products = category.getProductsNotDisable();
            Set<Product> previewProducts = new HashSet<>();
            int noOfProductsToDisplay = 4;
            if (products.size() > noOfProductsToDisplay) {
                Iterator<Product> iterator = products.iterator();
                for (int i = 0; i < noOfProductsToDisplay; i++) {
                    previewProducts.add(iterator.next());
                }
            } else {
                previewProducts.addAll(products);
            }
            category.setProducts(previewProducts);
            previewCategories.add(category);
        }
        model.addAttribute("categories", previewCategories);
        return "home";
    }

}
