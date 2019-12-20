package by.lodochkina.wshop.coupons;

import by.lodochkina.wshop.entities.coupons.CouponItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CouponItemRepository extends JpaRepository<CouponItem, Long> {
}
