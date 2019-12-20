package by.lodochkina.wshop.entities.coupons;

import by.lodochkina.wshop.cart.LineItem;
import by.lodochkina.wshop.entities.Product;
import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@DiscriminatorValue("QUANTITY_COUPON")
@EqualsAndHashCode(callSuper = true, onlyExplicitlyIncluded = true)
public class QuantityCouponItem extends CouponItem {

    @OneToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @Column
    private Long quantity;

    @Override
    public BigDecimal calculateDiscount(BigDecimal cartAmount) {
        return BigDecimal.ZERO;
    }

    @Override
    public BigDecimal calculateDiscount(LineItem lineItem) {
        Product lineItemProduct = lineItem.getProduct();
        if (this.product.equals(lineItemProduct) && lineItem.getQuantity() >= quantity) {
            BigDecimal currentPrice = product.getDiscountPrice() != null ? product.getDiscountPrice() : product.getPrice();
            return currentPrice.multiply(new BigDecimal(lineItem.getQuantity() / quantity));
        }
        return BigDecimal.ZERO;
    }
}
