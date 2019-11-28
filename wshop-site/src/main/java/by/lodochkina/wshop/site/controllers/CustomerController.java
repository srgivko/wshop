package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.entities.Customer;
import by.lodochkina.wshop.entities.Order;
import by.lodochkina.wshop.site.dto.CaptchaResponseDto;
import by.lodochkina.wshop.site.security.CaptchaService;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Slf4j
@Controller
public class CustomerController extends WShopSiteBaseController {

    private final CustomerValidator customerValidator;
    private final PasswordEncoder passwordEncoder;
    private final CaptchaService captchaService;

    @Autowired
    public CustomerController(CustomerValidator customerValidator, CustomerValidator customerValidator1, PasswordEncoder passwordEncoder, CaptchaService captchaService) {
        this.customerValidator = customerValidator1;
        this.passwordEncoder = passwordEncoder;
        this.captchaService = captchaService;
    }

    @Override
    protected String getHeaderTitle() {
        return "Логин/Регистрация";
    }

    @GetMapping("/register")
    public String registerForm(Model model) {
        model.addAttribute("customer", new Customer());
        return "register";
    }

    @PostMapping("/register")
    public String register(
            @RequestParam(value = "g-recaptcha-response", defaultValue = "default") String captchaResponse,
            @Valid @ModelAttribute("customer") Customer customer,
            BindingResult result, Model model,
            RedirectAttributes redirectAttributes) {
        this.customerValidator.validate(customer, result);
        CaptchaResponseDto captchaResponseDto = this.captchaService.checkCaptcha(captchaResponse);
        if (!captchaResponseDto.isSuccess()) {
            model.addAttribute("captchaError", "captchaError");
        }
        if (result.hasErrors() || !captchaResponseDto.isSuccess()) {
            return "register";
        }

        String password = customer.getPassword();
        String encodedPwd = passwordEncoder.encode(password);
        customer.setPassword(encodedPwd);

        Customer persistedCustomer = super.customerService.createCustomer(customer);
        log.debug("Created new Customer with id : {} and email : {}",
                persistedCustomer.getId(), persistedCustomer.getEmail());
        redirectAttributes.addFlashAttribute("info", "Customer created successfully");
        return "redirect:/login";
    }

    @GetMapping("/myAccount")
    public String myAccount(Model model) {
        String email = getCurrentUser().getCustomer().getEmail();
        Customer customer = super.customerService.findCustomerByEmail(email).orElseThrow(WShopException::new);
        model.addAttribute("customer", customer);
        List<Order> orders = super.customerService.getCustomerOrders(customer.getId());
        model.addAttribute("orders", orders);
        return "myAccount";
    }
}
