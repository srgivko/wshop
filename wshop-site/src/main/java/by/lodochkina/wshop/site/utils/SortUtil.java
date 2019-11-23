package by.lodochkina.wshop.site.utils;

import by.lodochkina.wshop.entities.Product;

import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;

public class SortUtil {

    private static final Map<String, Comparator<Product>> comparatorMap = new HashMap<>();

    static {
        SortUtil.comparatorMap.put("name", Comparator.comparing(Product::getName));
        SortUtil.comparatorMap.put("name_desc", Comparator.comparing(Product::getName).reversed());
        SortUtil.comparatorMap.put("price", Comparator.comparing(Product::getPrice));
        SortUtil.comparatorMap.put("price_desc", Comparator.comparing(Product::getPrice).reversed());
        SortUtil.comparatorMap.put("oldest", Comparator.comparing(Product::getId));
        SortUtil.comparatorMap.put("newest", Comparator.comparing(Product::getId).reversed());
    }

    public static Comparator<Product> getComparator(String sort) {
        return comparatorMap.get(sort);
    }
}
