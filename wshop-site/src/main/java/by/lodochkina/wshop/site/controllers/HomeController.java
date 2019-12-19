package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.coupons.CouponService;
import by.lodochkina.wshop.entities.Category;
import by.lodochkina.wshop.entities.Product;
import by.lodochkina.wshop.entities.coupons.Coupon;
import by.lodochkina.wshop.entities.coupons.PriceCoupon;
import by.lodochkina.wshop.entities.coupons.ProductCoupon;
import by.lodochkina.wshop.entities.coupons.QuantityCoupon;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

@Controller
public class HomeController extends WShopSiteBaseController {

    @Autowired
    private CouponService couponService;

    @Override
    protected String getHeaderTitle() {
        return "Главная страница";
    }

    @ModelAttribute("top5Products")
    public List<Product> getTop5Products() {
        return this.catalogService.getTopPopularProduct(5);
    }

    @GetMapping("/home")
    public String home(
            Model model,
            HttpServletRequest request,
            HttpServletResponse response
    ) {

        List<Category> previewCategories = new ArrayList<>();
        List<Category> categories = super.catalogService.getAllCategories().stream()
                .filter(category -> category.getProducts()!=null && !category.getProducts().isEmpty())
                .collect(Collectors.toList());
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
        model.addAttribute("recentlyViewedProducts", super.getRecentlyViewedProducts(request, response));
        return "home";
    }

}
