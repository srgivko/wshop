package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.customers.CustomerService;
import by.lodochkina.wshop.entities.Category;
import by.lodochkina.wshop.entities.Customer;
import by.lodochkina.wshop.entities.Product;
import by.lodochkina.wshop.services.CatalogService;
import by.lodochkina.wshop.cart.Cart;
import by.lodochkina.wshop.site.security.AuthenticatedUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.util.stream.Collectors;

public abstract class WShopSiteBaseController {

    private static String RECENTLY_VIEWED_PRODUCTS_COOKIE_NAME = "RECENTLY_VIEWED_PRODUCTS";
    private static String RECENTLY_VIEWED_PRODUCTS_COOKIE_DELIMITER = "#";
    private static String CART_KEY = "CART_KEY";

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
        cart = (Cart) request.getSession().getAttribute(CART_KEY);
        if (cart == null) {
            cart = new Cart();
            request.getSession().setAttribute(CART_KEY, cart);
        }
        return cart;
    }

    List<Product> getRecentlyViewedProducts(HttpServletRequest request, HttpServletResponse response) {
        Cookie recentlyViewedProductsCookie = getRecentlyViewedProductsCookie(request, response);
        if (!recentlyViewedProductsCookie.getValue().isEmpty()) {
            List<Product> productList = new ArrayList<>();
            String[] productIds = recentlyViewedProductsCookie.getValue().split(RECENTLY_VIEWED_PRODUCTS_COOKIE_DELIMITER);
            for (String productId : productIds) {
                this.catalogService.findProductById(Long.parseLong(productId)).ifPresent(productList::add);
            }
            Collections.reverse(productList);
            return productList;
        }
        return Collections.emptyList();
    }

    void addProductToRecentlyViewedProducts(HttpServletRequest request, HttpServletResponse response, Long id) {
        String newCookieValue = "";
        Cookie recentlyViewedProductsCookie = getRecentlyViewedProductsCookie(request, response);
        if (!recentlyViewedProductsCookie.getValue().isEmpty()) {
            List<String> distinctSetProductIds = Arrays.stream(recentlyViewedProductsCookie.getValue().split(RECENTLY_VIEWED_PRODUCTS_COOKIE_DELIMITER))
                    .filter(value -> !value.equals(id.toString()))
                    .distinct()
                    .collect(Collectors.toList());
            if (distinctSetProductIds.size() > 9) {
                distinctSetProductIds.remove(distinctSetProductIds.get(0));
            }
            newCookieValue =  distinctSetProductIds.stream().collect(Collectors.joining(RECENTLY_VIEWED_PRODUCTS_COOKIE_DELIMITER));;
        }
        if (newCookieValue.isEmpty()) {
            newCookieValue = newCookieValue.concat(id.toString());
        } else {
            newCookieValue = newCookieValue.concat(String.format("%s%d", RECENTLY_VIEWED_PRODUCTS_COOKIE_DELIMITER, id));
        }
        recentlyViewedProductsCookie = createNewRecentlyViewedProductsCookie(newCookieValue);
        response.addCookie(recentlyViewedProductsCookie);
    }

    private Cookie getRecentlyViewedProductsCookie(HttpServletRequest request, HttpServletResponse response) {
        Cookie recentlyViewedProducts = WebUtils.getCookie(request, RECENTLY_VIEWED_PRODUCTS_COOKIE_NAME);
        if (recentlyViewedProducts == null) {
            recentlyViewedProducts = createNewRecentlyViewedProductsCookie(null);
            response.addCookie(recentlyViewedProducts);
        }
        return recentlyViewedProducts;
    }

    private Cookie createNewRecentlyViewedProductsCookie(String value) {
        Cookie newRecentlyViewedProductsCookie = new Cookie(RECENTLY_VIEWED_PRODUCTS_COOKIE_NAME, "");
        newRecentlyViewedProductsCookie.setHttpOnly(true);
//        newRecentlyViewedProductsCookie.setSecure(true); https?
        newRecentlyViewedProductsCookie.setMaxAge(7 * 24 * 60 * 60);
        newRecentlyViewedProductsCookie.setPath("/");
        if (value != null) {
            newRecentlyViewedProductsCookie.setValue(value);
        }
        return newRecentlyViewedProductsCookie;
    }
}
