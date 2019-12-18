package by.lodochkina.wshop.entities.coupons;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

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
public class PriceCoupon extends CouponItem {

    @Column
    private BigDecimal limitTotalPrice;

    @Column
    private BigDecimal discount;
}
