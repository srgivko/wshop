package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.entities.Producer;
import by.lodochkina.wshop.entities.Product;
import by.lodochkina.wshop.site.models.Cart;
import by.lodochkina.wshop.site.models.LineItem;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Optional;

@Controller
public class CartController extends WShopSiteBaseController {

    @Override
    protected String getHeaderTitle() {
        return "Корзина";
    }

    @GetMapping("/cart/items/count")
    @ResponseBody
    public Map<String, Object> getCartItemCount(HttpServletRequest request) {
        Cart cart = getOrCreateCart(request);
        updateLineItems(cart);
        int itemCount = cart.getItemCount();
        Map<String, Object> map = new HashMap<>();
        map.put("count", itemCount);
        map.put("amount", cart.getTotalAmount().doubleValue());
        return map;
    }

    @PostMapping("/cart/items")
    @ResponseBody
    public void addToCart(@RequestBody Product product, HttpServletRequest request) {
        Cart cart = getOrCreateCart(request);
        Product p = super.catalogService.findProductById(product.getId()).orElseThrow(WShopException::new);
        cart.addItem(p);
    }

    @GetMapping("/cart")
    public String showCart(HttpServletRequest request, Model model) {
        Cart cart = getOrCreateCart(request);
        updateLineItems(cart);
        model.addAttribute("cart", cart);
        return "cart";
    }

    @PutMapping("/cart/items")
    @ResponseBody
    public void updateCartItem(@RequestBody LineItem item, HttpServletRequest request) {
        Cart cart = getOrCreateCart(request);
        if (item.getQuantity() <= 0) {
            Long id = item.getProduct().getId();
            cart.removeItem(id);
        } else {
            cart.updateItemQuantity(item.getProduct(), item.getQuantity());
        }
    }

    @DeleteMapping("/cart/items/{id}")
    @ResponseBody
    public void removeCartItem(@PathVariable("id") Long id, HttpServletRequest request) {
        Cart cart = getOrCreateCart(request);
        cart.removeItem(id);
    }

    /**
     * Обновляет цены на товары в корзине
     * Проблема (В сессии созранялась корзина с продуктами, и с истекщими скидками)
     * Решение (Обновлять продукты при изменение корзины)
     * @param cart Корзина пользователя
     */
    private void updateLineItems(Cart cart) {
        Iterator<LineItem> iterator = cart.getItems().iterator();
        while (iterator.hasNext()) {
            LineItem lineItem = iterator.next();
            Optional<Product> productById = super.catalogService.findProductById(lineItem.getProduct().getId());
            if (!productById.isPresent()) {
                iterator.remove();
                continue;
            }

            lineItem.setProduct(productById.get());
        }
    }
}
