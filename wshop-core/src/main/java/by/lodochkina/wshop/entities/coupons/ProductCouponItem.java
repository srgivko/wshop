package by.lodochkina.wshop.entities.coupons;

import by.lodochkina.wshop.cart.LineItem;
import by.lodochkina.wshop.entities.Product;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@DiscriminatorValue("PRODUCT_COUPON")
@EqualsAndHashCode(callSuper = true, onlyExplicitlyIncluded = true)
@ToString
public class ProductCouponItem extends CouponItem {

    @OneToOne
    @JoinColumn(name = "product_id")
    @NotNull
    private Product product;

    @Column
    @NotNull
    private BigDecimal discount;

    @Override
    public BigDecimal calculateDiscount(BigDecimal cartAmount) {
        return BigDecimal.ZERO;
    }

    @Override
    public BigDecimal calculateDiscount(LineItem lineItem) {
        if (product.equals(lineItem.getProduct())) {
            return discount.multiply(new BigDecimal(lineItem.getQuantity()));
        }
        return BigDecimal.ZERO;
    }

}
