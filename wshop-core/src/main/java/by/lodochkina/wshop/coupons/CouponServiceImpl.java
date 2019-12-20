package by.lodochkina.wshop.coupons;

import by.lodochkina.wshop.entities.coupons.Coupon;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class CouponServiceImpl implements CouponService {

    private final CouponRepository couponRepository;

    @Autowired
    public CouponServiceImpl(CouponRepository couponRepository) {
        this.couponRepository = couponRepository;
    }

    @Transactional
    @Override
    public Coupon createCoupon(Coupon coupon1) {
        return this.couponRepository.save(coupon1);
    }

    @Override
    public Optional<Coupon> findCouponByCode(String code) {
        return this.couponRepository.findByCode(code);
    }

    @Override
    public List<Coupon> getAllCoupons() {
        return this.couponRepository.findAll();
    }
}
