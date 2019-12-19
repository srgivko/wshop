package by.lodochkina.wshop.cart;

import by.lodochkina.wshop.entities.Product;
import by.lodochkina.wshop.entities.coupons.Coupon;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.data.annotation.Transient;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = "product")
public class LineItem {

    private Product product;
    private int quantity;

    @Transient
    private BigDecimal discountCoupon = BigDecimal.ZERO;

    public BigDecimal getSubTotal(Coupon coupon) {
        discountCoupon = null;
        BigDecimal price;
        if (product.getDiscountPrice() != null) {
            price = product.getDiscountPrice().multiply(new BigDecimal(quantity));
        } else {
            price = product.getPrice().multiply(new BigDecimal(quantity));
        }
        if (coupon != null) {
            discountCoupon = coupon.calculateDiscount(this);
            price = price.subtract(discountCoupon);
        }
        return price;
    }
}