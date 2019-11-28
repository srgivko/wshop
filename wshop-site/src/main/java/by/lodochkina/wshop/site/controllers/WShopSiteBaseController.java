package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.customers.CustomerService;
import by.lodochkina.wshop.entities.Category;
import by.lodochkina.wshop.entities.Customer;
import by.lodochkina.wshop.entities.Product;
import by.lodochkina.wshop.services.CatalogService;
import by.lodochkina.wshop.site.models.Cart;
import by.lodochkina.wshop.site.security.AuthenticatedUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.List;
import java.util.Set;

public abstract class WShopSiteBaseController {

    @Autowired
    protected MessageSource messageSource;

    @Autowired
    protected CatalogService catalogService;

    @Autowired
    protected CustomerService customerService;

    protected abstract String getHeaderTitle();

    public String getMessage(String code) {
        return messageSource.getMessage(code, null, null);
    }

    public String getMessage(String code, String defaultMsg) {
        return messageSource.getMessage(code, null, defaultMsg, null);
    }

    @ModelAttribute("categoryMenu")
    public List<Category> getCategoryMenu() {
        return this.catalogService.getRootCategories();
    }

    @ModelAttribute("authenticatedUser")
    public AuthenticatedUser authenticatedUser(@AuthenticationPrincipal AuthenticatedUser authenticatedUser) {
        return authenticatedUser;
    }

    @ModelAttribute("wishList")
    public Set<Product> getWishList() {
        if (getCurrentUser() == null) {
            return Collections.emptySet();
        }
        Customer customer = this.customerService.findCustomerById(getCurrentUser().getCustomer().getId()).orElseThrow(WShopException::new);
        return customer.getWishList();
    }

    static AuthenticatedUser getCurrentUser() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof AuthenticatedUser) {
            return ((AuthenticatedUser) principal);
        }
        return null;
    }

    public static boolean isLoggedIn() {
        return getCurrentUser() != null;
    }

    Cart getOrCreateCart(HttpServletRequest request) {
        Cart cart = null;
        cart = (Cart) request.getSession().getAttribute("CART_KEY");
        if (cart == null) {
            cart = new Cart();
            request.getSession().setAttribute("CART_KEY", cart);
        }
        return cart;
    }
}
