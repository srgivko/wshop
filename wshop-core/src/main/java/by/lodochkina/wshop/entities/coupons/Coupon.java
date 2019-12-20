package by.lodochkina.wshop.entities.coupons;

import by.lodochkina.wshop.cart.LineItem;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@Data
@EqualsAndHashCode(exclude = {"couponItems"})
@ToString(exclude = {"couponItems"})
@Entity
@Table(name = "coupons")
public class
Coupon {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    @NotBlank
    private String name;

    @Column
    @NotBlank
    private String code;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'hh:mm:ss")
    @NotNull
    private Date beginDate = new Date();

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'hh:mm:ss")
    @NotNull
    private Date endDate = new Date();

    @OneToMany(mappedBy = "coupon", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    private Set<CouponItem> couponItems;

    public boolean isActive() {
        Date now = new Date();
        return now.after(beginDate) && now.before(endDate);
    }

    public BigDecimal calculateDiscount(LineItem lineItem) {
        return couponItems.stream()
                .map(couponItem -> couponItem.calculateDiscount(lineItem))
                .max(BigDecimal::compareTo).orElse(BigDecimal.ZERO);
    }

    public void addCouponItem(CouponItem couponItem) {
        if (this.couponItems == null) {
            this.couponItems = new HashSet<>();
        }
        if (couponItem.getId() != null) {
            Optional<CouponItem> ifExistCouponItem = this.couponItems.stream()
                    .filter(ci -> ci.getId().equals(couponItem.getId()))
                    .findFirst();
            ifExistCouponItem.ifPresent(ci -> this.couponItems.remove(ci));
        }
        this.couponItems.add(couponItem);
        couponItem.setCoupon(this);
    }

    public void removeCouponItem(CouponItem couponItem) {
        if (this.couponItems == null) {
            return;
        }
        this.couponItems.remove(couponItem);
        couponItem.setCoupon(null);
    }
}
