package by.lodochkina.wshop.admin.security;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class MenuConfiguration {

    private static final  Map<String, String> MENU_URL_PATTERN_MAP = new HashMap<>();

    static {
        MENU_URL_PATTERN_MAP.put("/home", "Home");
        MENU_URL_PATTERN_MAP.put("/categories", "Categories");
        MENU_URL_PATTERN_MAP.put("/products", "Products");
        MENU_URL_PATTERN_MAP.put("/orders", "Orders");
        MENU_URL_PATTERN_MAP.put("/customers", "Customers");
        MENU_URL_PATTERN_MAP.put("/users", "Users");
        MENU_URL_PATTERN_MAP.put("/roles", "Roles");
        MENU_URL_PATTERN_MAP.put("/permissions", "Permissions");
        MENU_URL_PATTERN_MAP.put("/units", "Units");
        MENU_URL_PATTERN_MAP.put("/tags", "Tags");
        MENU_URL_PATTERN_MAP.put("/producers", "Producers");
        MENU_URL_PATTERN_MAP.put("/dashboard", "Dashboard");
        MENU_URL_PATTERN_MAP.put("/posts", "Posts");
    }

    private MenuConfiguration() {}

    public static Map<String, String> getMenuUrlPatternMap() {
        return Collections.unmodifiableMap(MENU_URL_PATTERN_MAP);
    }

    public static String getMatchingMenu(String uri) {
        Set<String> keySet = MENU_URL_PATTERN_MAP.keySet();
        for (String key : keySet) {
            if (uri.startsWith(key)) {
                return MENU_URL_PATTERN_MAP.get(key);
            }
        }
        return "";
    }
}
