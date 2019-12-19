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
@DiscriminatorValue("PRODUCT_COUPON")
@EqualsAndHashCode(callSuper = true, onlyExplicitlyIncluded = true)
public class ProductCoupon extends CouponItem {

    @OneToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @Column
    private BigDecimal discount;

    @Override
    public BigDecimal calculateDiscount(BigDecimal cartAmount) {
        return BigDecimal.ZERO;
    }

    @Override
    public BigDecimal calculateDiscount(LineItem lineItem) {
        if (product.equals(lineItem.getProduct())) {
            return discount.multiply(new BigDecimal(lineItem.getQuantity())); // TODO: 12/19/19 discount for every quantity product or only for one?
        }
        return BigDecimal.ZERO;
    }

}
