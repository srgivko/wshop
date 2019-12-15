package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.entities.Category;
import by.lodochkina.wshop.entities.Product;
import by.lodochkina.wshop.services.CatalogService;
import by.lodochkina.wshop.site.utils.SortUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class ProductController extends WShopSiteBaseController {

    @GetMapping("/products/{id}")
    public String product(@PathVariable("id") Product product, Model model) {
        List<Category> categoryPath = new ArrayList<>();
        Category parent = product.getCategory();
        while (parent != null) {
            categoryPath.add(parent);
            parent = parent.getParentCategory();
        }
        Collections.reverse(categoryPath);
        model.addAttribute("categoryPath", categoryPath);
        model.addAttribute("product", product);
        return "product";
    }

    @GetMapping("/products")
    public String searchProducts(
            @RequestParam(name = "q", defaultValue = "") String query,
            @RequestParam(value = "sort", defaultValue = "newest", required = false) String sort,
            @PageableDefault Pageable pageable,
            Model model
    ) {
        List<Product> productsSearch = super.catalogService.searchProducts(query);
        List<Product> products = productsSearch.stream().sorted(SortUtils.getComparator(sort))
                .skip(pageable.getPageSize() * pageable.getPageNumber())
                .limit(pageable.getPageSize()).collect(Collectors.toList());
        PageImpl<Product> productPage = new PageImpl<>(products, pageable, productsSearch.size());

        model.addAttribute("productPage", productPage);
        model.addAttribute("sort", sort);
        model.addAttribute("query", query);

        return "products";
    }

    @Override
    protected String getHeaderTitle() {
        return "Продукт";
    }
}
