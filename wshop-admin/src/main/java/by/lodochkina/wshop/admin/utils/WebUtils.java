package by.lodochkina.wshop.admin.utils;

import javax.servlet.http.HttpServletRequest;

public class WebUtils {
    public static String getURLWithContextPath(HttpServletRequest request) {
        return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    }
}