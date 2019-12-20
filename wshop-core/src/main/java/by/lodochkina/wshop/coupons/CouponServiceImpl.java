package by.lodochkina.wshop.coupons;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.entities.coupons.Coupon;
import by.lodochkina.wshop.entities.coupons.CouponItem;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class CouponServiceImpl implements CouponService {

    private final CouponRepository couponRepository;

    private final CouponItemRepository couponItemRepository;

    @Autowired
    public CouponServiceImpl(CouponRepository couponRepository, CouponItemRepository couponItemRepository) {
        this.couponRepository = couponRepository;
        this.couponItemRepository = couponItemRepository;
    }

    @Transactional
    @Override
    public Coupon createCoupon(Coupon coupon) {
        return this.couponRepository.save(coupon);
    }

    @Transactional
    @Override
    public Coupon updateCoupon(Coupon coupon) {
        Coupon persistedCoupon = this.couponRepository.findById(coupon.getId()).orElseThrow(WShopException::new);
        BeanUtils.copyProperties(coupon, persistedCoupon, "id", "couponItems");
        return persistedCoupon;
    }

    @Transactional
    @Override
    public Coupon removeCoupon(Long couponId) {
        Coupon coupon = this.couponRepository.findById(couponId).orElseThrow(WShopException::new);
        this.couponRepository.delete(coupon);
        return coupon;
    }

    @Override
    public Optional<Coupon> findCouponByCode(String code) {
        return this.couponRepository.findByCode(code);
    }

    @Override
    public List<Coupon> getAllCoupons() {
        return this.couponRepository.findAll();
    }

    @SuppressWarnings("unchecked")
    @Override
    public <T extends CouponItem> Optional<T> findCouponItemById(Long couponItemId) {
        return (Optional<T>) this.couponItemRepository.findById(couponItemId);
    }

    @Transactional
    @Override
    public CouponItem addCouponItem(Long couponId, CouponItem couponItem) {
        Coupon coupon = this.couponRepository.findById(couponId).orElseThrow(WShopException::new);
        coupon.addCouponItem(couponItem);
        this.couponRepository.save(coupon);
        return couponItem;
    }

    @Transactional
    @Override
    public CouponItem removeCouponItem(Long couponId, Long couponItemId) {
        Coupon coupon = this.couponRepository.findById(couponId).orElseThrow(WShopException::new);
        CouponItem couponItem = coupon.getCouponItems().stream()
                .filter(ci -> ci.getId().equals(couponItemId))
                .findFirst()
                .orElseThrow(WShopException::new);
        coupon.removeCouponItem(couponItem);
        this.couponRepository.save(coupon);
        return couponItem;
    }

}
