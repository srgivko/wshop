package by.lodochkina.wshop.admin.controllers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.customers.CustomerService;
import by.lodochkina.wshop.entities.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import static by.lodochkina.wshop.admin.utils.SecurityUtils.MANAGE_CUSTOMERS;

@Controller
@Secured(MANAGE_CUSTOMERS)
public class CustomerController extends WShopAdminBaseController {

    private static final String VIEW_PREFIX = "customers/";

    private final CustomerService customerService;

    @Autowired
    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @Override
    protected String getHeaderTitle() {
        return "Управление клиентами";
    }

    @GetMapping("/customers")
    public String listCustomers(Model model) {
        model.addAttribute("customers", this.customerService.getAllCustomers());
        return VIEW_PREFIX + "customers";
    }

    @GetMapping("/customers/{id}")
    public String viewCustomerForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("customer", this.customerService.findCustomerById(id).orElseThrow(WShopException::new));
        return VIEW_PREFIX + "view_customer";
    }
}
