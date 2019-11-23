package by.lodochkina.wshop.admin.controllers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.entities.Order;
import by.lodochkina.wshop.orders.OrderService;
import by.lodochkina.wshop.services.EmailService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import static by.lodochkina.wshop.admin.utils.SecurityUtils.MANAGE_ORDERS;

@Slf4j
@Controller
@Secured(MANAGE_ORDERS)
public class OrderController extends WShopAdminBaseController {

    private static final String VIEW_PREFIX = "orders/";

    private final EmailService emailService;
    private final OrderService orderService;
    private final TemplateEngine templateEngine;

    @Autowired
    public OrderController(EmailService emailService, OrderService orderService, TemplateEngine templateEngine) {
        this.emailService = emailService;
        this.orderService = orderService;
        this.templateEngine = templateEngine;
    }

    @Override
    protected String getHeaderTitle() {
        return "Управление заказов";
    }

    @GetMapping("/orders")
    public String listOrders(Model model) {
        model.addAttribute("orders", this.orderService.getAllOrders());
        return VIEW_PREFIX + "orders";
    }

    @GetMapping("/orders/{id}")
    public String editOrderForm(@PathVariable("id") Order order, Model model) {
        model.addAttribute("order", order);
        return VIEW_PREFIX + "edit_order";
    }

    @PostMapping("/orders/{id}")
    public String updateOrder(@ModelAttribute("order") Order order, @RequestParam(value = "send-email", required = false) Boolean isSendEmail, BindingResult result, Model model, RedirectAttributes redirectAttributes) {
        Order persistedOrder = this.orderService.updateOrder(order);
        if (isSendEmail) {
            this.sendOrderStatusUpdateEmail(persistedOrder);
        }
        log.debug("Updated order with orderNumber : {}", persistedOrder.getOrderNumber());
        redirectAttributes.addFlashAttribute("info", "Order updated successfully");
        return "redirect:/orders";
    }

    private void sendOrderStatusUpdateEmail(Order order) {
        try {
            final Context ctx = new Context();
            ctx.setVariable("order", order);
            final String htmlContent = this.templateEngine.process("email-templates/order-status-update-email", ctx);
            this.emailService.send(order.getCustomer().getEmail(), "QuilCartCart - Order Status Update", htmlContent);
        } catch (WShopException e) {
            log.error(e.getMessage(), e);
        }
    }
}
