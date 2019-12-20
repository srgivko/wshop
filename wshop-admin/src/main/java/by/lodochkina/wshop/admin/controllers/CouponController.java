package by.lodochkina.wshop.admin.controllers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.coupons.CouponService;
import by.lodochkina.wshop.entities.coupons.*;
import by.lodochkina.wshop.services.CatalogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

import static by.lodochkina.wshop.admin.utils.SecurityUtils.MANAGE_PROMOTIONS;

@Slf4j
@Controller
@Secured(MANAGE_PROMOTIONS)
public class CouponController extends WShopAdminBaseController {

    private static final String VIEW_PREFIX = "coupons/";

    private final CouponService couponService;

    private final CatalogService catalogService;

    @Autowired
    public CouponController(CouponService couponService, CatalogService catalogService) {
        this.couponService = couponService;
        this.catalogService = catalogService;
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

    @GetMapping({"/coupons/{id}", "/coupons/new"})
    public String showSale(@PathVariable(value = "id", required = false) Coupon coupon, Model model) {
        if (coupon == null) {
            coupon = new Coupon();
        }
        model.addAttribute("coupon", coupon);
        return VIEW_PREFIX.concat("create_edit_coupon");
    }

    @PostMapping({"/coupons"})
    public String saveOrUpdateSale(@Valid Coupon coupon, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return VIEW_PREFIX.concat("create_edit_coupon");
        }
        if (coupon.getId() == null) {
            this.couponService.createCoupon(coupon);
            log.debug("Created new coupon with id : {} and name : {}", coupon.getId(), coupon.getName());
            redirectAttributes.addFlashAttribute("info", "Coupon created successfully");
        } else {
            this.couponService.updateCoupon(coupon);
            log.debug("Updated coupon with id : {} and name : {}", coupon.getId(), coupon.getName());
            redirectAttributes.addFlashAttribute("info", "Coupon updated successfully");
        }
        return "redirect:/coupons";
    }

    @GetMapping({"/coupons/{couponId}/addCategoryCouponItem", "/coupons/{couponId}/categoryCouponItem/{couponItemId}"})
    public String showCategoryCouponItem(
            @PathVariable("couponId") Long couponId,
            @PathVariable(value = "couponItemId", required = false) Long couponItemId,
            Model model
    ) {
        CategoryCouponItem categoryCouponItem;
        if (couponItemId != null) {
            categoryCouponItem = this.couponService.<CategoryCouponItem>findCouponItemById(couponItemId).orElseThrow(WShopException::new);
        } else {
            categoryCouponItem = new CategoryCouponItem();
        }
        model.addAttribute("categoryCouponItem", categoryCouponItem);
        model.addAttribute("categories", this.catalogService.getAllCategories());
        model.addAttribute("couponId", couponId);
        return VIEW_PREFIX.concat("create_edit_category_coupon_item");
    }

    @DeleteMapping({"/coupons/{couponId}"})
    @ResponseBody
    public void removeCoupon(@PathVariable Long couponId) {
        this.couponService.removeCoupon(couponId);
    }

    @PostMapping({"/coupons/{couponId}/addCategoryCouponItem"})
    public String addCategoryCouponItem(@PathVariable Long couponId, @Valid CategoryCouponItem categoryCouponItem, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return VIEW_PREFIX.concat("create_edit_category_coupon_item");
        }
        this.couponService.addCouponItem(couponId, categoryCouponItem);
        return String.format("redirect:/coupons/%d", couponId);
    }


    @GetMapping({"/coupons/{couponId}/addPriceCouponItem", "/coupons/{couponId}/priceCouponItem/{couponItemId}"})
    public String showPriceCouponItem(
            @PathVariable("couponId") Long couponId,
            @PathVariable(value = "couponItemId", required = false) Long couponItemId,
            Model model
    ) {
        PriceCouponItem priceCouponItem;
        if (couponItemId != null) {
            priceCouponItem = this.couponService.<PriceCouponItem>findCouponItemById(couponItemId).orElseThrow(WShopException::new);
        } else {
            priceCouponItem = new PriceCouponItem();
        }
        model.addAttribute("priceCouponItem", priceCouponItem);
        return VIEW_PREFIX.concat("create_edit_price_coupon_item");
    }

    @PostMapping({"/coupons/{couponId}/addPriceCouponItem"})
    public String addCategoryCouponItem(@PathVariable Long couponId, @Valid PriceCouponItem priceCouponItem, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return VIEW_PREFIX.concat("create_edit_price_coupon_item");
        }
        this.couponService.addCouponItem(couponId, priceCouponItem);
        return String.format("redirect:/coupons/%d", couponId);
    }

    @GetMapping({"/coupons/{couponId}/addProductCouponItem", "/coupons/{couponId}/productCouponItem/{couponItemId}"})
    public String showProductCouponItem(
            @PathVariable("couponId") Long couponId,
            @PathVariable(value = "couponItemId", required = false) Long couponItemId,
            Model model
    ) {
        ProductCouponItem productCouponItem;
        if (couponItemId != null) {
            productCouponItem = this.couponService.<ProductCouponItem>findCouponItemById(couponItemId).orElseThrow(WShopException::new);
        } else {
            productCouponItem = new ProductCouponItem();
        }
        model.addAttribute("products", this.catalogService.getAllProducts());
        model.addAttribute("productCouponItem", productCouponItem);
        return VIEW_PREFIX.concat("create_edit_product_coupon_item");
    }

    @PostMapping({"/coupons/{couponId}/addProductCouponItem"})
    public String addProductCouponItem(@PathVariable Long couponId, @Valid ProductCouponItem productCouponItem, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return VIEW_PREFIX.concat("create_edit_product_coupon_item");
        }
        this.couponService.addCouponItem(couponId, productCouponItem);
        return String.format("redirect:/coupons/%d", couponId);
    }

    @GetMapping({"/coupons/{couponId}/addQuantityCouponItem", "/coupons/{couponId}/quantityCouponItem/{couponItemId}"})
    public String showQuantityCouponItem(
            @PathVariable("couponId") Long couponId,
            @PathVariable(value = "couponItemId", required = false) Long couponItemId,
            Model model
    ) {
        QuantityCouponItem quantityCouponItem;
        if (couponItemId != null) {
            quantityCouponItem = this.couponService.<QuantityCouponItem>findCouponItemById(couponItemId).orElseThrow(WShopException::new);
        } else {
            quantityCouponItem = new QuantityCouponItem();
        }
        model.addAttribute("quantityCouponItem", quantityCouponItem);
        model.addAttribute("products", this.catalogService.getAllProducts());
        return VIEW_PREFIX.concat("create_edit_quantity_coupon_item.html");
    }

    @PostMapping({"/coupons/{couponId}/addQuantityCouponItem"})
    public String addQuantityCouponItem(@PathVariable Long couponId, @Valid QuantityCouponItem quantityCouponItem, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return VIEW_PREFIX.concat("create_edit_quantity_coupon_item");
        }
        this.couponService.addCouponItem(couponId, quantityCouponItem);
        return String.format("redirect:/coupons/%d", couponId);
    }

    @DeleteMapping({"/coupons/{couponId}/couponItems/{couponItemId}"})
    @ResponseBody
    public void removeCouponItem(@PathVariable Long couponId, @PathVariable Long couponItemId) {
        this.couponService.removeCouponItem(couponId, couponItemId);
    }

}
