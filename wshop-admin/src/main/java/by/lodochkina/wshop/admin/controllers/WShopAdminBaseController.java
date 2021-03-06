package by.lodochkina.wshop.admin.controllers;

import by.lodochkina.wshop.admin.security.AuthenticatedUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.Arrays;
import java.util.Locale;

public abstract class WShopAdminBaseController {

    @Autowired
    protected MessageSource messageSource;

    protected abstract String getHeaderTitle();

    public String getMessage(String code, Locale locale, String... args) {
        if (args != null) {
            Object[] localeArgs = Arrays.stream(args).map(label -> getMessage(label, locale)).toArray();
            return messageSource.getMessage(code, localeArgs, locale);
        }
        return messageSource.getMessage(code, null, locale);
    }

    public String getMessage(String code, Locale locale) {
        return messageSource.getMessage(code, null, locale);
    }

    public String getMessage(String code, String defaultMsg) {
        return messageSource.getMessage(code, null, defaultMsg, null);
    }

    @ModelAttribute("authenticatedUser")
    public AuthenticatedUser authenticatedUser(@AuthenticationPrincipal AuthenticatedUser authenticatedUser) {
        return authenticatedUser;
    }

    public static AuthenticatedUser getCurrentUser() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof AuthenticatedUser) {
            return ((AuthenticatedUser) principal);
        }
        return null;
    }

    public static boolean isLoggedIn() {
        return getCurrentUser() != null;
    }
}
