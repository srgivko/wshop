package by.lodochkina.wshop.admin.controllers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.admin.validators.TagValidator;
import by.lodochkina.wshop.entities.Tag;
import by.lodochkina.wshop.services.CatalogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.Locale;

import static by.lodochkina.wshop.admin.utils.MessageCodes.*;
import static by.lodochkina.wshop.admin.utils.SecurityUtils.MANAGE_PRODUCTS;

@Slf4j
@Controller
@Secured(MANAGE_PRODUCTS)
public class TagController extends WShopAdminBaseController {

    private static final String VIEW_PREFIX = "tags/";
    private final CatalogService catalogService;
    private final TagValidator tagValidator;

    @Autowired
    public TagController(CatalogService catalogService, TagValidator tagValidator) {
        this.catalogService = catalogService;
        this.tagValidator = tagValidator;
    }

    @Override
    protected String getHeaderTitle() {
        return "Управление тегами";
    }

    @GetMapping("/tags")
    public String listTags(Model model) {
        model.addAttribute("tags", this.catalogService.getAllTags());
        return VIEW_PREFIX + "tags";
    }

    @GetMapping({"/tags/new", "/tags/{id}"})
    public String createAndUpdateTagForm(@PathVariable(value = "id", required = false) Long id, Model model) {
        Tag tag;
        if (id == null) {
            tag = new Tag();
        } else {
            tag = this.catalogService.findTagById(id).orElseThrow(WShopException::new);
        }
        model.addAttribute("tag", tag);
        return VIEW_PREFIX + "create_edit_tag";
    }

    @PostMapping({"/tags", "/tags/{id}"})
    public String createAndUpdateTag(
            @PathVariable(required = false) Long id,
            @Valid Tag tag,
            BindingResult result,
            RedirectAttributes redirectAttributes,
            Locale locale
    ) {
        this.tagValidator.validate(tag, result);
        if (result.hasErrors()) {
            return VIEW_PREFIX + "create_edit_tag";
        }
        Tag persistedTag;
        if (id == null) {
            persistedTag = this.catalogService.createTag(tag);
            log.debug("Created new tag with id : {} and name : {}", persistedTag.getId(), persistedTag.getName());
            redirectAttributes.addFlashAttribute("info", getMessage(INFO_CREATE_SUCCESS, locale, LABEL_TAG));
        } else {
            persistedTag = this.catalogService.updateTag(tag);
            log.debug("Updated new tag with id : {} and name : {}", persistedTag.getId(), persistedTag.getName());
            redirectAttributes.addFlashAttribute("info", getMessage(INFO_UPDATE_SUCCESS, locale, LABEL_TAG));
        }
        return "redirect:/tags";
    }
}
