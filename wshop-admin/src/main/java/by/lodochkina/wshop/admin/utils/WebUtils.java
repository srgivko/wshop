package by.lodochkina.wshop.admin.utils;

import javax.servlet.http.HttpServletRequest;

public class WebUtils {

    public static String getURLWithContextPath(HttpServletRequest request) {
        return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    }

    public static String getURLWithoutContextPath(HttpServletRequest request) {
        return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
    }

    // TODO: 12/18/19 need some change (send email with url unsubscribe HARD_CODE)
    public static String getURLSiteWithoutContextPath(HttpServletRequest request) {
        return request.getScheme() + "://" + request.getServerName() + ":" +"8443";
    }
}