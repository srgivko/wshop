package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.WShopException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@Slf4j
@ControllerAdvice
class GlobalControllerExceptionHandler extends WShopSiteBaseController {

    private final static String VIEW_PREFIX = "errors/";

    @Override
    protected String getHeaderTitle() {
        return "Manage ERRORS";
    }

    @ExceptionHandler({NoHandlerFoundException.class, WShopException.class})
    @ResponseStatus(value = HttpStatus.NOT_FOUND)
    public String handleNotFoundException(Exception ex, Model model) {
        log.warn("GlobalControllerExceptionHandler ERROR", ex);
        model.addAttribute("categoryMenu", super.getCategoryMenu());
        model.addAttribute("wishList", getWishList());
        model.addAttribute("authenticatedUser", getCurrentUser());
        return VIEW_PREFIX.concat("error404");
    }
}