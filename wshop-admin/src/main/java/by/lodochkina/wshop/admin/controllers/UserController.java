package by.lodochkina.wshop.admin.controllers;

import by.lodochkina.wshop.admin.security.AuthenticatedUser;
import by.lodochkina.wshop.admin.validators.UserValidator;
import by.lodochkina.wshop.entities.Role;
import by.lodochkina.wshop.entities.User;
import by.lodochkina.wshop.security.SecurityService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static by.lodochkina.wshop.admin.utils.SecurityUtils.MANAGE_USERS;

@Slf4j
@Controller
@Secured(MANAGE_USERS)
public class UserController extends WShopAdminBaseController {

    private static final String VIEW_PREFIX = "users/";

    private final SecurityService securityService;
    private final UserValidator userValidator;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public UserController(SecurityService securityService, UserValidator userValidator, PasswordEncoder passwordEncoder) {
        this.securityService = securityService;
        this.userValidator = userValidator;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    protected String getHeaderTitle() {
        return "Управление пользователями";
    }

    @ModelAttribute("rolesList")
    public List<Role> permissionsList() {
        return this.securityService.getAllRoles();
    }

    @GetMapping("/users")
    public String getAllUsers(Model model) {
        List<User> userList = this.securityService.getAllUsers();
        model.addAttribute("users", userList);
        return VIEW_PREFIX + "users";
    }

    @GetMapping("/users/new")
    public String showUserForm(Model model) {
        model.addAttribute("user", new User());
        return VIEW_PREFIX + "create_user";
    }

    @PostMapping(value = "/users")
    public String createUser(@Valid @ModelAttribute("user") User user, BindingResult result, RedirectAttributes redirectAttributes) {
        this.userValidator.validate(user, result);
        if (result.hasErrors()) {
            return VIEW_PREFIX + "create_user";
        }
        String password = user.getPassword();
        String encodedPwd = this.passwordEncoder.encode(password);
        user.setPassword(encodedPwd);
        User persistedUser = this.securityService.createUser(user);
        log.debug("Created new User with id : {} and name : {}", persistedUser.getId(), persistedUser.getName());
        redirectAttributes.addFlashAttribute("info", "User created successfully");
        return "redirect:/users";
    }

    @GetMapping("/users/{id}")
    public String editUserForm(@PathVariable("id") User user, Model model) {
        model.addAttribute("user", user);
        return VIEW_PREFIX + "edit_user";
    }

    @PostMapping("/users/{id}")
    public String updateUser(@PathVariable("id") User userFromDB, @ModelAttribute("user") User user, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return VIEW_PREFIX + "edit_user";
        }
        BeanUtils.copyProperties(user, userFromDB, "id", "password", "passwordResetToken");
        User persistedUser = this.securityService.updateUser(user);
        log.debug("Updated user with id : {} and name : {}", persistedUser.getId(), persistedUser.getName());
        redirectAttributes.addFlashAttribute("info", "User updates successfully");
        return "redirect:/users";
    }

    @GetMapping("/myAccount")
    public String userProfile(Model model, @AuthenticationPrincipal AuthenticatedUser authenticatedUser){
        User user = authenticatedUser.getUser();
        model.addAttribute("user", user);
        return VIEW_PREFIX + "profile";
    }
}
