package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.customers.CustomerService;
import by.lodochkina.wshop.entities.Customer;
import by.lodochkina.wshop.validators.CustomerValidator;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Slf4j
@Controller
public class CustomerController extends WShopSiteBaseController {

    private final CustomerService customerService;
    private final CustomerValidator customerValidator;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public CustomerController(CustomerService customerService, CustomerValidator customerValidator, PasswordEncoder passwordEncoder) {
        this.customerService = customerService;
        this.customerValidator = customerValidator;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    protected String getHeaderTitle() {
        return "Логин/Регистрация";
    }

    @GetMapping("/register")
    protected String registerForm(Model model) {
        model.addAttribute("customer", new Customer());
        return "register";
    }

    @PostMapping("/register")
    protected String register(
            @Valid @ModelAttribute("customer") Customer customer,
            BindingResult result, Model model,
            RedirectAttributes redirectAttributes) {
        customerValidator.validate(customer, result);
        if (result.hasErrors()) {
            return "register";
        }

        String password = customer.getPassword();
        String encodedPwd = passwordEncoder.encode(password);
        customer.setPassword(encodedPwd);

        Customer persistedCustomer = customerService.createCustomer(customer);
        log.debug("Created new Customer with id : {} and email : {}",
                persistedCustomer.getId(), persistedCustomer.getEmail());
        redirectAttributes.addFlashAttribute("info", "Customer created successfully");
        return "redirect:/login";
    }

}
