package by.lodochkina.wshop.admin.utils;

import javax.servlet.http.HttpServletRequest;

public class WebUtils {

    private WebUtils() {
    }

    public static final String IMAGES_PREFIX = "/products/images/";
    public static final String IMAGES_DIR = "D:/jcart/products/";

    public static String getURLWithContextPath(HttpServletRequest request) {
        return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath();
    }

}