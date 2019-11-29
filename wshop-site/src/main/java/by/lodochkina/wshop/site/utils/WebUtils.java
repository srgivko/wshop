package by.lodochkina.wshop.site.utils;

import javax.servlet.http.HttpServletRequest;

public class WebUtils {
    public static String getURLWithContextPath(HttpServletRequest request) {
        return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    }

    public static String getURLWithoutContextPath(HttpServletRequest request) {
        return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
    }
}