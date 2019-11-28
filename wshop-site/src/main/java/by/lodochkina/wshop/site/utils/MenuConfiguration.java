package by.lodochkina.wshop.site.utils;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class MenuConfiguration {

    private static final Map<String, String> MENU_URL_PATTERN_MAP = new HashMap<>();

    static {
        MENU_URL_PATTERN_MAP.put("/home", "Home");
        MENU_URL_PATTERN_MAP.put("/wishlist", "Wishlist");
        MENU_URL_PATTERN_MAP.put("/posts", "Posts");
    }

    private MenuConfiguration() {

    }

    private static Map<String, String> getMenuUrlPatternMap() {
        return Collections.unmodifiableMap(MENU_URL_PATTERN_MAP);
    }

    public static String getMatchingMenu(String uri) {
        Set<String> keySet = getMenuUrlPatternMap().keySet();
        for (String key : keySet) {
            if (uri.startsWith(key)) {
                return getMenuUrlPatternMap().get(key);
            }
        }
        return "";
    }
}
