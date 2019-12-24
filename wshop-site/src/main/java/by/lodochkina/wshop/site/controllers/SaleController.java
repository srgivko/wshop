package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.entities.Product;
import by.lodochkina.wshop.sales.SaleService;
import by.lodochkina.wshop.site.utils.SortUtils;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class SaleController {

    private final SaleService saleService;

    public SaleController(SaleService saleService) {
        this.saleService = saleService;
    }

    @GetMapping("/sale")
    public String getAllProductWithActiveSale(
            @RequestParam(value = "sort", defaultValue = "newest", required = false) String sort,
            @PageableDefault Pageable pageable,
            Model model
    ) {
        /// TODO: 12/24/19 need replace
        // TODO: 12/24/19 https://www.baeldung.com/spring-data-jpa-pagination-sorting use mix pagibale and sort
        List<Product> allProductsWithActiveSale = this.saleService.getAllProductsWithActiveSale()
                .stream()
                .filter(product -> !product.isDisabled())
                .collect(Collectors.toList());
        List<Product> products = allProductsWithActiveSale
                .stream()
                .sorted(SortUtils.getComparator(sort))
                .skip(pageable.getPageSize() * pageable.getPageNumber())
                .limit(pageable.getPageSize())
                .collect(Collectors.toList());
        PageImpl<Product> productPage = new PageImpl<>(products, pageable, allProductsWithActiveSale.size());
        model.addAttribute("productPage", productPage);
        model.addAttribute("sort", sort);
        return "sale";
    }
}
