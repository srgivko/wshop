package by.lodochkina.wshop.coupons;

import by.lodochkina.wshop.entities.coupons.Coupon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CouponRepository extends JpaRepository<Coupon, Long> {
}
