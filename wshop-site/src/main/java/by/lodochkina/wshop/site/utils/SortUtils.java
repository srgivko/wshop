package by.lodochkina.wshop.site.utils;

import by.lodochkina.wshop.entities.Product;

import java.math.BigDecimal;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;

public class SortUtils {

    private static final Map<String, Comparator<Product>> comparatorMap = new HashMap<>();

    static {
        Comparator<Product> comparingPrice = Comparator.comparing(product -> {
            BigDecimal discountPrice = product.getDiscountPrice();
            if (discountPrice != null) {
                return discountPrice;
            } else {
                return product.getPrice();
            }
        });
        SortUtils.comparatorMap.put("name", Comparator.comparing(Product::getName));
        SortUtils.comparatorMap.put("name_desc", Comparator.comparing(Product::getName).reversed());
        SortUtils.comparatorMap.put("price", comparingPrice);
        SortUtils.comparatorMap.put("price_desc", comparingPrice.reversed());
        SortUtils.comparatorMap.put("oldest", Comparator.comparing(Product::getId));
        SortUtils.comparatorMap.put("newest", Comparator.comparing(Product::getId).reversed());
    }

    public static Comparator<Product> getComparator(String sort) {
        return comparatorMap.get(sort);
    }

    private SortUtils(){

    }
}
