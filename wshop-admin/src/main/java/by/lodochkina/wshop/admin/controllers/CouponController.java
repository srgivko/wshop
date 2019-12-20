package by.lodochkina.wshop.admin.controllers;

import by.lodochkina.wshop.coupons.CouponService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import static by.lodochkina.wshop.admin.utils.SecurityUtils.MANAGE_PROMOTIONS;

@Controller
@Secured(MANAGE_PROMOTIONS)
public class CouponController extends WShopAdminBaseController {

    private static final String VIEW_PREFIX = "coupons/";

    private final CouponService couponService;

    @Autowired
    public CouponController(CouponService couponService) {
        this.couponService = couponService;
    }

    @Override
    protected String getHeaderTitle() {
        return "Manage coupon";
    }

    @GetMapping("/coupons")
    public String getAllCoupons(Model model) {
        model.addAttribute("coupons", this.couponService.getAllCoupons());
        return VIEW_PREFIX.concat("coupons");
    }


}
