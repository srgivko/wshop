package by.lodochkina.wshop.admin.controllers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.admin.utils.WebUtils;
import by.lodochkina.wshop.admin.validators.PromotionValidator;
import by.lodochkina.wshop.entities.Promotion;
import by.lodochkina.wshop.promotions.PromotionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import java.util.Locale;

import static by.lodochkina.wshop.admin.utils.MessageCodes.*;
import static by.lodochkina.wshop.admin.utils.SecurityUtils.MANAGE_PROMOTIONS;

@Slf4j
@Controller
@Secured(MANAGE_PROMOTIONS)
public class PromotionController extends WShopAdminBaseController {

    private static final String VIEW_PREFIX = "promotions/";

    private final PromotionService promotionService;

    private final PromotionValidator promotionValidator;

    @Value("${site.server.port}")
    private String siteServerPort;

    @Autowired
    public PromotionController(PromotionService promotionService, PromotionValidator promotionValidator) {
        this.promotionService = promotionService;
        this.promotionValidator = promotionValidator;
    }

    // TODO: 12/21/19 need replace port site(shop)
    @PostConstruct
    public void init() {
        if (siteServerPort != null && !siteServerPort.isEmpty()) {
            siteServerPort = ":".concat(siteServerPort);
        }
    }

    @Override
    protected String getHeaderTitle() {
        return "Mange promotions";
    }

    @GetMapping("/promotions")
    public String getAllPromotions(Model model) {
        model.addAttribute("promotions", this.promotionService.getAllPromotions());
        return VIEW_PREFIX.concat("promotions");
    }

    @GetMapping({"/promotions/new", "/promotions/{id}"})
    public String showPromotion(@PathVariable(value = "id", required = false) Long id, Model model) {
        Promotion promotion;
        if (id != null) {
            promotion = this.promotionService.findPromotionById(id).orElseThrow(WShopException::new);
        } else {
            promotion = new Promotion();
        }
        model.addAttribute("promotion", promotion);
        return VIEW_PREFIX.concat("create_edit_promotion.html");
    }

    @PostMapping({"/promotions", "/promotions/{id}"})
    public String createOrUpdatePromotion(
            @PathVariable(value = "id", required = false) Long id,
            @Valid Promotion promotion,
            BindingResult result,
            RedirectAttributes redirectAttributes,
            Locale locale
    ) {
        this.promotionValidator.validate(promotion, result);
        if (result.hasErrors()) {
            return VIEW_PREFIX.concat("create_edit_promotion");
        }
        Promotion persistedPromotion;
        if (id == null) {
            persistedPromotion = this.promotionService.createPromotion(promotion);
            log.debug("Created new promotion with id : {} and subject : {}", persistedPromotion.getId(), persistedPromotion.getSubject());
            redirectAttributes.addFlashAttribute("info", getMessage(INFO_CREATE_SUCCESS, locale, LABEL_PROMOTION));
        } else {
            persistedPromotion = this.promotionService.updatePromotion(promotion);
            log.debug("Updated new post with id : {} and subject : {}", persistedPromotion.getId(), persistedPromotion.getSubject());
            redirectAttributes.addFlashAttribute("info", getMessage(INFO_UPDATE_SUCCESS, locale, LABEL_PROMOTION));
        }
        return "redirect:/promotions";
    }

    @GetMapping("/promotions/{id}/send")
    public String sendPromotion(@PathVariable Long id, RedirectAttributes redirectAttributes, HttpServletRequest request, Locale locale) {
        this.promotionService.sendPromotion(id, WebUtils.getURLSiteWithoutContextPath(request).concat(siteServerPort));
        redirectAttributes.addFlashAttribute("info", getMessage(INFO_SEND_SUCCESS, locale, LABEL_PROMOTION));
        return "redirect:/promotions";
    }

}
