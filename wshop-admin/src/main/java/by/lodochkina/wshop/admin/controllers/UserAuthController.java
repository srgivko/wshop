package by.lodochkina.wshop.admin.controllers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.admin.utils.WebUtils;
import by.lodochkina.wshop.security.SecurityService;
import by.lodochkina.wshop.services.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import javax.servlet.http.HttpServletRequest;

import static by.lodochkina.wshop.admin.utils.MessageCodes.*;

@Controller
public class UserAuthController extends WShopAdminBaseController {

    private static final String VIEW_PREFIX = "public/";

    private final EmailService emailService;

    private final SecurityService securityService;

    private final TemplateEngine templateEngine;

    private final PasswordEncoder passwordEncoder;

    @Autowired
    public UserAuthController(EmailService emailService, SecurityService securityService, TemplateEngine templateEngine, PasswordEncoder passwordEncoder) {
        this.emailService = emailService;
        this.securityService = securityService;
        this.templateEngine = templateEngine;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping(value = "/forgotPwd")
    public String forgotPwd() {
        return VIEW_PREFIX + "forgotPwd";
    }

    @PostMapping(value = "/resetPwd")
    public String handleResetPwd(HttpServletRequest request, RedirectAttributes redirectAttributes, Model model) {
        try {
            String email = request.getParameter("email");
            String token = request.getParameter("token");
            String password = request.getParameter("password");
            String confPassword = request.getParameter("confPassword");
            if (!password.equals(confPassword)) {
                model.addAttribute("email", email);
                model.addAttribute("token", token);
                model.addAttribute("msg", getMessage(ERROR_PASSWORD_CONF_PASSWORD_MISMATCH));
                return "public/resetPwd";
            }
            String encodedPwd = this.passwordEncoder.encode(password);
            this.securityService.updatePassword(email, token, encodedPwd);
            redirectAttributes.addFlashAttribute("msg", getMessage(INFO_PASSWORD_UPDATED_SUCCESS));
        } catch (WShopException e) {
            System.err.println(e);
            redirectAttributes.addFlashAttribute("msg", getMessage(ERROR_INVALID_PASSWORD_RESET_REQUEST));
        }
        return "redirect:/login";
    }

    @GetMapping(value="/resetPwd")
    public String resetPwd(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes)
    {
        String email = request.getParameter("email");
        String token = request.getParameter("token");

        boolean valid = this.securityService.verifyPasswordResetToken(email, token);
        if(valid){
            model.addAttribute("email", email);
            model.addAttribute("token", token);
            return VIEW_PREFIX+"resetPwd";
        } else {
            redirectAttributes.addFlashAttribute("msg", getMessage(ERROR_INVALID_PASSWORD_RESET_REQUEST));
            return "redirect:/login";
        }

    }

    @PostMapping(value = "/forgotPwd")
    public String handleForgotPwd(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        String email = request.getParameter("email");
        try {
            String token = this.securityService.resetPassword(email);
            String resetPwdURL = WebUtils.getURLWithContextPath(request) + "/resetPwd?email=" + email + "&token=" + token;
            this.sendForgotPasswordEmail(email, resetPwdURL);
            redirectAttributes.addFlashAttribute("msg", getMessage(INFO_PASSWORD_RESET_LINK_SENT));
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("msg", e.getMessage());
        }
        return "redirect:/forgotPwd";
    }

    private void sendForgotPasswordEmail(String email, String resetPwdURL) {
        try {
            // Prepare the evaluation context
            final Context ctx = new Context();
            ctx.setVariable("resetPwdURL", resetPwdURL);

            // Create the HTML body using Thymeleaf
            final String htmlContent = this.templateEngine.process("forgot-password-email", ctx);

            this.emailService.send(email, getMessage(LABEL_PASSWORD_RESET_EMAIL_SUBJECT), htmlContent);
        } catch (WShopException e) {
            System.err.println("Some error");
        }
    }

    @Override
    protected String getHeaderTitle() {
        return "Управление пользователями";
    }
}
