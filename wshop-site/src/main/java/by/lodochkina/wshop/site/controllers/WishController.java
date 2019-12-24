package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.entities.Customer;
import by.lodochkina.wshop.entities.Product;
import by.lodochkina.wshop.site.dto.ProductDto;
import by.lodochkina.wshop.site.utils.SortUtils;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

@Controller
public class WishController extends WShopSiteBaseController {

    @Override
    protected String getHeaderTitle() {
        return "Избранное";
    }

    @GetMapping("/wishlist")
    public String showAllWishProducts(
            @RequestParam(value = "sort", defaultValue = "newest", required = false) String sort,
            @PageableDefault Pageable pageable,
            Model model
    ) {
        Customer customer = super.customerService.findCustomerById(getCurrentUser().getCustomer().getId()).orElseThrow(WShopException::new);
        List<Product> products = customer.getWishList().stream().sorted(SortUtils.getComparator(sort))
                .skip(pageable.getPageSize() * pageable.getPageNumber())
                .limit(pageable.getPageSize()).collect(Collectors.toList());
        PageImpl<Product> productPage = new PageImpl<>(products, pageable, customer.getWishList().size());

        model.addAttribute("productPage", productPage);
        model.addAttribute("sort", sort);
        return "wishlist";
    }

    @PostMapping("/wishlist/products")
    @ResponseBody
    public ProductDto addToWishList(@RequestBody Product product, Locale locale) {
        product = super.customerService.addProductToWishList(getCurrentUser().getCustomer().getId(), product.getId());
        return ProductDto.createProductDto(product, super.getMessage("message.wishlist.addProduct.success", locale));
    }

    @DeleteMapping("/wishlist/products/{id}")
    @ResponseBody
    public ProductDto removeCartItem(@PathVariable("id") Product product, Locale locale) {
        product = super.customerService.removeProductFromWishList(getCurrentUser().getCustomer().getId(), product.getId());
        return ProductDto.createProductDto(product, super.getMessage("message.wishlist.removeProduct.success", locale));
    }
}
