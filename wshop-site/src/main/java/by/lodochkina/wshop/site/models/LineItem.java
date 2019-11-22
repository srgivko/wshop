package by.lodochkina.wshop.site.models;

import by.lodochkina.wshop.entities.Product;
import lombok.*;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = "product")
public class LineItem {
    private Product product;
    private int quantity;

    public BigDecimal getSubTotal() {
        return product.getPrice().multiply(new BigDecimal(quantity));
    }
}