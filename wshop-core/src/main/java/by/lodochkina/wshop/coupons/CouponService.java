package by.lodochkina.wshop.coupons;

import by.lodochkina.wshop.entities.coupons.Coupon;

import java.util.List;
import java.util.Optional;

public interface CouponService {
    Coupon createCoupon(Coupon coupon1);

    Optional<Coupon> findCouponByCode(String code);

    List<Coupon> getAllCoupons();
}
