package by.lodochkina.wshop.coupons;

import by.lodochkina.wshop.entities.coupons.Coupon;
import by.lodochkina.wshop.entities.coupons.CouponItem;

import java.util.List;
import java.util.Optional;

public interface CouponService {
    Coupon createCoupon(Coupon coupon);

    Optional<Coupon> findCouponByCode(String code);

    List<Coupon> getAllCoupons();

    <T extends CouponItem> Optional<T> findCouponItemById(Long couponItemId);

    CouponItem addCouponItem(Long couponId, CouponItem couponItem);

    CouponItem removeCouponItem(Long couponId, Long couponItemId);

    Coupon removeCoupon(Long couponId);

    Coupon updateCoupon(Coupon coupon);
}
