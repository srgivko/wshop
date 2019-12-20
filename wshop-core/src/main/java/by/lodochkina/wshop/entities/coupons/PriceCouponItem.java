package by.lodochkina.wshop.entities.coupons;

import by.lodochkina.wshop.cart.LineItem;
import lombok.*;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@DiscriminatorValue("PRICE_COUPON")
@EqualsAndHashCode(callSuper = true, onlyExplicitlyIncluded = true)
@ToString
public class PriceCouponItem extends CouponItem {

    @Column
    @NotNull
    private BigDecimal limitTotalPriceCart;

    @Column
    @NotNull
    private BigDecimal discount;

    @Override
    public BigDecimal calculateDiscount(BigDecimal cartAmount) {
        if (cartAmount.compareTo(limitTotalPriceCart) > 0) {
            return discount;
        }
        return BigDecimal.ZERO;
    }

    @Override
    public BigDecimal calculateDiscount(LineItem lineItem) {
        return BigDecimal.ZERO;
    }
}
