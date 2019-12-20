package by.lodochkina.wshop.entities.coupons;

import by.lodochkina.wshop.cart.LineItem;
import by.lodochkina.wshop.entities.Category;
import by.lodochkina.wshop.entities.Product;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@DiscriminatorValue("CATEGORY_COUPON")
@EqualsAndHashCode(callSuper = true, onlyExplicitlyIncluded = true)
@ToString
public class CategoryCouponItem extends CouponItem {

    @OneToOne
    @JoinColumn(name = "category_id")
    @NotNull
    private Category category;

    @Max(100)
    @Min(0)
    @Column
    private Long discountPercent;

    @Override
    public BigDecimal calculateDiscount(BigDecimal cartAmount) {
        return BigDecimal.ZERO;
    }

    @Override
    public BigDecimal calculateDiscount(LineItem lineItem) {
        Product product = lineItem.getProduct();
        if (category.equals(product.getCategory())) {
            BigDecimal currentPrice = product.getDiscountPrice() != null ? product.getDiscountPrice() : product.getPrice();
            return currentPrice.multiply(new BigDecimal(discountPercent / 100)).multiply(new BigDecimal(lineItem.getQuantity()));
        }
        return BigDecimal.ZERO;
    }

}
