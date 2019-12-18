package by.lodochkina.wshop.entities.coupons;

import by.lodochkina.wshop.entities.Product;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@DiscriminatorValue("PRODUCT_COUPON")
public class ProductCoupon extends CouponItem {

    @OneToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @Column
    private BigDecimal discount;
}
