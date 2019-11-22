package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.entities.Product;
import by.lodochkina.wshop.services.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ProductController extends WShopSiteBaseController {

    private final CatalogService catalogService;

    @Autowired
    public ProductController(CatalogService catalogService) {
        this.catalogService = catalogService;
    }

    @GetMapping("/products/{id}")
    public String product(@PathVariable("id") Product product, Model model) {
        model.addAttribute("product", product);
        return "product";
    }

    @GetMapping("/products")
    public String searchProducts(@RequestParam(name = "q", defaultValue = "") String query, Model model) {
        List<Product> products = this.catalogService.searchProducts(query);
        model.addAttribute("products", products);
        return "products";
    }

    @Override
    protected String getHeaderTitle() {
        return "Продукт";
    }
}
