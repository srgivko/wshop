package by.lodochkina.wshop.admin.controllers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.admin.validators.CategoryValidator;
import by.lodochkina.wshop.entities.Category;
import by.lodochkina.wshop.services.CatalogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;
import java.util.Locale;

import static by.lodochkina.wshop.admin.utils.MessageCodes.*;
import static by.lodochkina.wshop.admin.utils.SecurityUtils.MANAGE_CATEGORIES;

@Slf4j
@Controller
@Secured(MANAGE_CATEGORIES)
public class CategoryController extends WShopAdminBaseController {
    private static final String VIEW_PREFIX = "categories/";

    private final CatalogService catalogService;
    private final CategoryValidator categoryValidator;

    @Autowired
    public CategoryController(CatalogService catalogService, CategoryValidator categoryValidator) {
        this.catalogService = catalogService;
        this.categoryValidator = categoryValidator;
    }

    @Override
    protected String getHeaderTitle() {
        return "Управление категориями";
    }

    @ModelAttribute("categoriesList")
    public List<Category> getAllCategories() {
        return this.catalogService.getAllCategories();
    }

    @GetMapping("/categories")
    public String listCategories(Model model) {
        List<Category> list = this.catalogService.getAllCategories();
        model.addAttribute("categories", list);
        return VIEW_PREFIX + "categories";
    }

    @GetMapping("/categories/new")
    public String createCategoryForm(Model model) {
        Category category = new Category();
        model.addAttribute("category", category);
        return VIEW_PREFIX + "create_category";
    }

    @PostMapping("/categories")
    public String createCategory(
            @Valid @ModelAttribute("category") Category category,
            BindingResult result,
            RedirectAttributes redirectAttributes,
            Locale locale
    ) {
        this.categoryValidator.validate(category, result);
        if (result.hasErrors()) {
            return VIEW_PREFIX + "create_category";
        }
        Category persistedCategory = catalogService.createCategory(category);
        log.debug("Created new category with id : {} and name : {}", persistedCategory.getId(), persistedCategory.getName());
        redirectAttributes.addFlashAttribute("info", getMessage(INFO_CREATE_SUCCESS, locale, LABEL_CATEGORY));
        return "redirect:/categories";
    }

    @GetMapping("/categories/{id}")
    public String editCategoryForm(@PathVariable Long id, Model model) {
        Category category = this.catalogService.findCategoryById(id).orElseThrow(WShopException::new);
        model.addAttribute("category", category);
        return VIEW_PREFIX + "edit_category";
    }

    @PostMapping("/categories/{id}")
    public String updateCategory(
            @Valid Category category,
            BindingResult result,
            RedirectAttributes redirectAttributes,
            Locale locale
    ) {
        Category persistedCategory = this.catalogService.updateCategory(category);
        log.debug("Updated category with id : {} and name : {}", persistedCategory.getId(), persistedCategory.getName());
        redirectAttributes.addFlashAttribute("info", getMessage(INFO_UPDATE_SUCCESS, locale, LABEL_CATEGORY));
        return "redirect:/categories";
    }
}
