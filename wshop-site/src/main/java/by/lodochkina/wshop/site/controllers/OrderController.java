package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.cart.Cart;
import by.lodochkina.wshop.cart.LineItem;
import by.lodochkina.wshop.customers.CustomerService;
import by.lodochkina.wshop.entities.*;
import by.lodochkina.wshop.orders.OrderService;
import by.lodochkina.wshop.services.EmailService;
import by.lodochkina.wshop.site.dto.OrderDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.*;

@Slf4j
@Controller
public class OrderController extends WShopSiteBaseController {

    private final CustomerService customerService;
    private final OrderService orderService;
    private final TemplateEngine templateEngine;
    private final EmailService emailService;

    @Autowired
    public OrderController(
            CustomerService customerService,
            OrderService orderService,
            TemplateEngine templateEngine,
            EmailService emailService
    ) {
        this.customerService = customerService;
        this.orderService = orderService;
        this.templateEngine = templateEngine;
        this.emailService = emailService;
    }

    @Override
    protected String getHeaderTitle() {
        return "Заказы";
    }

    @PostMapping("/orders")
    public String placeOrder(
            @Valid @ModelAttribute("order") OrderDTO order,
            BindingResult result,
            Model model,
            HttpServletRequest request,
            Locale locale
    ) {
        Cart cart = getOrCreateCart(request);
        if (result.hasErrors()) {
            model.addAttribute("cart", cart);
            return "checkout";
        }

        Order newOrder = new Order();

        String email = getCurrentUser().getCustomer().getEmail();
        Customer customer = this.customerService.findCustomerByEmail(email).orElseThrow(WShopException::new);
        newOrder.setCustomer(customer);

        Address address = new Address();
        address.setAddressLine1(order.getAddressLine1());
        address.setAddressLine2(order.getAddressLine2());
        address.setCity(order.getCity());
        address.setState(order.getState());
        address.setZipCode(order.getZipCode());
        address.setCountry(order.getCountry());

        address.setFirstName(order.getFirstName());
        address.setLastName(order.getLastName());
        address.setEmail(order.getEmail());
        address.setPhoneNumber(order.getPhone());

        newOrder.setDeliveryAddress(address);

        Set<OrderItem> orderItems = new HashSet<>();
        List<LineItem> lineItems = cart.getItems();

        for (LineItem lineItem : lineItems) {
            OrderItem item = new OrderItem();
            item.setProduct(lineItem.getProduct());
            item.setQuantity(lineItem.getQuantity());
            item.setTotalPrice(lineItem.getSubTotal(cart.getCoupon()));
            item.setOrder(newOrder);
            orderItems.add(item);
        }

        newOrder.setItems(orderItems);

        newOrder.setStatus(OrderStatus.NEW);

        newOrder.setCoupon(cart.getCoupon());

        newOrder.setPriceDiscountCoupon(cart.getPriceDiscountCoupon());

        newOrder.setCreatedOn(new Date());

        Order savedOrder = this.orderService.createOrder(newOrder);
        this.sendConfirmationOrder(savedOrder, locale);

        request.getSession().removeAttribute("CART_KEY");
        return "redirect:orderconfirmation?orderNumber=" + savedOrder.getOrderNumber();
    }


    @GetMapping("/orderconfirmation")
    public String showOrderConfirmation(@RequestParam(value = "orderNumber") String orderNumber, Model model) {
        Order order = this.orderService.findOrderByOrderNumber(orderNumber).orElseThrow(WShopException::new);
        model.addAttribute("order", order);
        return "orderconfirmation";
    }

    @GetMapping("/orders/{id}")
    public String viewOrder(@PathVariable(value = "id") Order order, Model model) { ;
        model.addAttribute("order", order);
        return "view_order";
    }

    private void sendConfirmationOrder(Order order, Locale locale) {
        try {
            final Context ctx = new Context();
            ctx.setVariable("order", order);
            ctx.setLocale(locale);
            final String htmlContent = this.templateEngine.process("email-templates/orderConfirmation", ctx);
            this.emailService.send(order.getDeliveryAddress().getEmail(), getMessage("label.orderConfirmation", locale), htmlContent);
        } catch (WShopException e) {
            log.error(e.getMessage(), e);
        }
    }
}
