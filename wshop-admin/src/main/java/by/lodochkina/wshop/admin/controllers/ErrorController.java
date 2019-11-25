package by.lodochkina.wshop.admin.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import javax.servlet.http.HttpServletRequest;

public class ErrorController {
/*
    @GetMapping("/error")
    public String handle404(HttpServletRequest request, Exception e) {
        log.error(e.getMessage(), e);
        return "error/error404";
    }

*//*    @ExceptionHandler(WShopException.class)
    public String handleWShopException(Exception ex) {
        log.info(ex.getMessage(), ex);
        return "error/accessDenied";
    }*//*

    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(Exception.class)
    public String handleAllException(Exception ex) {
        log.error(ex.getMessage(), ex);
        return "error/error500";
    }*/
}
