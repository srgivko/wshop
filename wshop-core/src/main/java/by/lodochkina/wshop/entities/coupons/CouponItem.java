package by.lodochkina.wshop.entities.coupons;

import by.lodochkina.wshop.cart.LineItem;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;
import java.math.BigDecimal;

@Data
@Entity
@Table(name = "coupon_items")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "COUPON_ITEM_TYPE")
@EqualsAndHashCode(exclude = {"coupon"})
@ToString(exclude = {"coupon"})
public abstract class CouponItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "coupon_id")
    private Coupon coupon;

    public abstract BigDecimal calculateDiscount(BigDecimal cartAmount);

    public abstract BigDecimal calculateDiscount(LineItem lineItem);

}
