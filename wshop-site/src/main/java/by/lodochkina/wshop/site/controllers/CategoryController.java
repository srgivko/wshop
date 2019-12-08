package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.entities.Category;
import by.lodochkina.wshop.entities.Product;
import by.lodochkina.wshop.site.utils.SortUtils;
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
import java.util.stream.Stream;

@Controller
public class CategoryController extends WShopSiteBaseController {

    @GetMapping("/categories/{id}")
    public String category(
            @PathVariable("id") Category category,
            @RequestParam(value = "sort", defaultValue = "newest", required = false) String sort,
            @PageableDefault Pageable pageable,
            Model model
    ) {

        List<Category> categoryPath = new ArrayList<>();
        Category parent = category;
        while (parent != null) {
            categoryPath.add(parent);
            parent = parent.getParentCategory();
        }

        Collections.reverse(categoryPath);

        List<Product> products = category.getProductsNotDisable().stream().sorted(SortUtils.getComparator(sort))
                .skip(pageable.getPageSize() * pageable.getPageNumber())
                .limit(pageable.getPageSize()).collect(Collectors.toList());
        PageImpl<Product> productPage = new PageImpl<>(products, pageable, category.getProductsNotDisable().size());

        model.addAttribute("categoryPath", categoryPath);
        model.addAttribute("productPage", productPage);
        model.addAttribute("sort", sort);
        model.addAttribute("category", category);
        return "category";
    }

    @Override
    protected String getHeaderTitle() {
        return "Категория";
    }

}
