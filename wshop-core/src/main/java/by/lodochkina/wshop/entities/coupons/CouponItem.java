package by.lodochkina.wshop.entities.coupons;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "coupon_items")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "COUPON_ITEM_TYPE")
public abstract class CouponItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "coupon_id")
    private Coupon coupon;
}
