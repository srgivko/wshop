package by.lodochkina.wshop.entities.coupons;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Data
@EqualsAndHashCode(exclude = {"couponItems"})
@Entity
@Table(name = "coupons")
public class Coupon {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String name;

    @Column
    private String code;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'hh:mm:ss")
    private Date beginDate = new Date();

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'hh:mm:ss")
    private Date endDate = new Date();

    @OneToMany(mappedBy = "coupon", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<CouponItem> couponItems;

    public boolean isActive() {
        Date now = new Date();
        return now.after(beginDate) && now.before(endDate);
    }

    public void addCouponItem(CouponItem couponItem) {
        if (this.couponItems == null) {
            this.couponItems = new HashSet<>();
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
