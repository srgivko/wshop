package by.lodochkina.wshop.cart;

import by.lodochkina.wshop.entities.Address;
import by.lodochkina.wshop.entities.Customer;
import by.lodochkina.wshop.entities.Payment;
import by.lodochkina.wshop.entities.Product;
import by.lodochkina.wshop.entities.coupons.Coupon;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Transient;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
public class Cart {

    private List<LineItem> items = new ArrayList<>();
    private Customer customer = new Customer();
    private Address deliveryAddress = new Address();
    private Payment payment = new Payment();
    private Coupon coupon;

    @Transient
    private BigDecimal totalDiscountCoupon = BigDecimal.ZERO;
    @Transient
    private BigDecimal priceDiscountCoupon = BigDecimal.ZERO;

    public void addItem(Product product) {
        for (LineItem lineItem : items) {
            if (lineItem.getProduct().getSku().equals(product.getSku())) {
                lineItem.setQuantity(lineItem.getQuantity() + 1);
                return;
            }
        }
        LineItem item = new LineItem(product, 1, BigDecimal.ZERO);
        this.items.add(item);
    }

    public void updateItemQuantity(Product product, int quantity) {
        for (LineItem lineItem : items) {
            if (lineItem.getProduct().getId().equals(product.getId())) {
                lineItem.setQuantity(quantity);
            }
        }
    }

    public void removeItem(Long id) {
        LineItem item = null;
        for (LineItem lineItem : items) {
            if (lineItem.getProduct().getId().equals(id)) {
                item = lineItem;
                break;
            }
        }
        if (item != null) {
            items.remove(item);
        }
    }

    public void clearItems() {
        items = new ArrayList<>();
    }

    public int getItemCount() {
        int count = 0;
        for (LineItem lineItem : items) {
            count += lineItem.getQuantity();
        }
        return count;
    }

    public BigDecimal getTotalAmount() {
        totalDiscountCoupon = BigDecimal.ZERO;
        priceDiscountCoupon = BigDecimal.ZERO;
        BigDecimal amount = new BigDecimal("0.0");
        for (LineItem lineItem : items) {
            amount = amount.add(lineItem.getSubTotal(coupon));
            if (lineItem.getDiscountCoupon() != null) {
                totalDiscountCoupon = totalDiscountCoupon.add(lineItem.getDiscountCoupon());
            }
        }
        if (coupon != null) {
            BigDecimal amountWithoutPriceCoupon = amount;
            priceDiscountCoupon = coupon.getCouponItems().stream()
                    .map(couponItem -> couponItem.calculateDiscount(amountWithoutPriceCoupon))
                    .max(BigDecimal::compareTo).orElse(BigDecimal.ZERO);
            amount = amount.subtract(priceDiscountCoupon);
            totalDiscountCoupon = totalDiscountCoupon.add(priceDiscountCoupon);
        }
        return amount;
    }

    public void setCoupon(Coupon coupon) {
        this.coupon = coupon;
        getTotalAmount();
    }
}
