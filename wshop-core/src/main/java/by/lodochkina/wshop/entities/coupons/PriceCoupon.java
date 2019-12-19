package by.lodochkina.wshop.entities.coupons;

import by.lodochkina.wshop.cart.LineItem;
import lombok.*;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@DiscriminatorValue("PRICE_COUPON")
@EqualsAndHashCode(callSuper = true, onlyExplicitlyIncluded = true)
public class PriceCoupon extends CouponItem {

    @Column
    private BigDecimal limitTotalPrice;

    @Column
    private BigDecimal discount;

    @Override
    public BigDecimal calculateDiscount(BigDecimal cartAmount) {
        if (cartAmount.compareTo(limitTotalPrice) > 0) {
            return discount;
        }
        return BigDecimal.ZERO;
    }

    @Override
    public BigDecimal calculateDiscount(LineItem lineItem) {
        return BigDecimal.ZERO;
    }
}
