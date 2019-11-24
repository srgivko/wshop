package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.entities.Category;
import by.lodochkina.wshop.services.CatalogService;
import by.lodochkina.wshop.site.models.Cart;
import by.lodochkina.wshop.site.security.AuthenticatedUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public abstract class WShopSiteBaseController {

    @Autowired
    protected MessageSource messageSource;

    @Autowired
    protected CatalogService catalogService;

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
