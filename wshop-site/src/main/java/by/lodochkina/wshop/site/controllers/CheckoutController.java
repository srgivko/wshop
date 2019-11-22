package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.site.dto.OrderDTO;
import by.lodochkina.wshop.site.models.Cart;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class CheckoutController extends WShopSiteBaseController {

    @Override
    protected String getHeaderTitle() {
        return "Оформление заказа";
    }

    @GetMapping("/checkout")
    public String checkout(HttpServletRequest request, Model model) {
        OrderDTO order = new OrderDTO();
        model.addAttribute("order", order);
        Cart cart = getOrCreateCart(request);
        model.addAttribute("cart", cart);
        return "checkout";
    }
}
