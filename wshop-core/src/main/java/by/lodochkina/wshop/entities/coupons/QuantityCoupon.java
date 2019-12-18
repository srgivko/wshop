package by.lodochkina.wshop.entities.coupons;

import by.lodochkina.wshop.entities.Product;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@DiscriminatorValue("QUANTITY_COUPON")
public class QuantityCoupon extends CouponItem {

    @OneToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @Column
    private Long quantity;
}
