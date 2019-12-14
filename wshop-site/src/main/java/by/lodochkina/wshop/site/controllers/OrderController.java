package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.customers.CustomerService;
import by.lodochkina.wshop.entities.*;
import by.lodochkina.wshop.orders.OrderService;
import by.lodochkina.wshop.services.EmailService;
import by.lodochkina.wshop.site.dto.OrderDTO;
import by.lodochkina.wshop.site.models.Cart;
import by.lodochkina.wshop.site.models.LineItem;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Slf4j
@Controller
public class OrderController extends WShopSiteBaseController {

    private final CustomerService customerService;
    private final OrderService orderService;
    private final EmailService emailService;

    @Autowired
    public OrderController(CustomerService customerService, OrderService orderService, EmailService emailService) {
        this.customerService = customerService;
        this.orderService = orderService;
        this.emailService = emailService;
    }

    @Override
    protected String getHeaderTitle() {
        return "Заказы";
    }

    @PostMapping("/orders")
    public String placeOrder(@Valid @ModelAttribute("order") OrderDTO order,
                             BindingResult result, Model model, HttpServletRequest request) {
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

        newOrder.setDeliveryAddress(address);

        Address billingAddress = new Address();
        billingAddress.setAddressLine1(order.getAddressLine1());
        billingAddress.setAddressLine2(order.getAddressLine2());
        billingAddress.setCity(order.getCity());
        billingAddress.setState(order.getState());
        billingAddress.setZipCode(order.getZipCode());
        billingAddress.setCountry(order.getCountry());

        newOrder.setBillingAddress(billingAddress);

        Set<OrderItem> orderItems = new HashSet<>();
        List<LineItem> lineItems = cart.getItems();

        for (LineItem lineItem : lineItems) {
            OrderItem item = new OrderItem();
            item.setProduct(lineItem.getProduct());
            item.setQuantity(lineItem.getQuantity());
            if (lineItem.getProduct().getDiscountPrice() != null) {
                item.setPrice(lineItem.getProduct().getDiscountPrice());
            } else {
                item.setPrice(lineItem.getProduct().getPrice());
            }
            item.setOrder(newOrder);
            orderItems.add(item);
        }

        newOrder.setItems(orderItems);

        Payment payment = new Payment();
        payment.setCcNumber(order.getCcNumber());
        payment.setCvv(order.getCvv());

        newOrder.setPayment(payment);
        newOrder.setStatus(OrderStatus.NEW);

        Order savedOrder = this.orderService.createOrder(newOrder);

        this.sendOrderConfirmationEmail(savedOrder);

        request.getSession().removeAttribute("CART_KEY");
        return "redirect:orderconfirmation?orderNumber=" + savedOrder.getOrderNumber();
    }

    private void sendOrderConfirmationEmail(Order order) {
        try {
            this.emailService.send(order.getCustomer().getEmail(),
                    "QuilCartCart - Order Confirmation",
                    "Your order has been placed successfully.\n"
                            + "Order Number : " + order.getOrderNumber());
        } catch (WShopException e) {
            log.error(e.getMessage(), e);
        }
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
}
