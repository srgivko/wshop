package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.site.dto.RestorePasswordDto;
import by.lodochkina.wshop.site.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class LoginController extends WShopSiteBaseController {

    private final PasswordEncoder passwordEncoder;

    @Autowired
    public LoginController(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    protected String getHeaderTitle() {
        return "Управление логины";
    }

    @GetMapping("/login")
    public String showLoginPage(Model model) {
        return "login";
    }

    @GetMapping("/")
    public String showHomePage(Model model) {
        return "redirect:/home";
    }

    @GetMapping("/forgetPwd")
    public String showForgetPwdPage(Model model) {
        return "forgetPwd";
    }

    @PostMapping("/forgetPwd")
    public String restorePassword(@RequestParam("email") String email, HttpServletRequest httpServletRequest, Model model, RedirectAttributes redirectAttributes) {
        try {
            super.customerService.restorePassword(email, WebUtils.getURLWithoutContextPath(httpServletRequest));
            redirectAttributes.addFlashAttribute("info", "Please check email");
        } catch (WShopException ex) {
            redirectAttributes.addFlashAttribute("info", "Customer with that email not exists");
        }
        return "redirect:/login";
    }

    @GetMapping("/login/forget/{code}")
    public String showNewPasswordPage(@PathVariable String code, Model model, RedirectAttributes redirectAttributes) {
        if (!this.customerService.findCustomerByActivationCode(code).isPresent()) {
            redirectAttributes.addFlashAttribute("info", "Customer not exist with that code");
            return "redirect:/login";
        }
        RestorePasswordDto restorePasswordDto = new RestorePasswordDto();
        restorePasswordDto.setCode(code);
        model.addAttribute("restorePasswordDto", restorePasswordDto);
        return "newPassword";
    }

    @PostMapping("/login/forget")
    public String newPassword(@Valid RestorePasswordDto restorePasswordDto, RedirectAttributes redirectAttributes) {
        this.customerService.newPassword(restorePasswordDto.getCode(), this.passwordEncoder.encode(restorePasswordDto.getPassword()));
        redirectAttributes.addFlashAttribute("info", "Password was changed. Please try login.");
        return "redirect:/login";
    }
}
