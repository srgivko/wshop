package by.lodochkina.wshop.admin.controllers;

import by.lodochkina.wshop.admin.validators.ProductImagesValidator;
import by.lodochkina.wshop.admin.validators.ProductValidator;
import by.lodochkina.wshop.entities.*;
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
import static by.lodochkina.wshop.admin.utils.SecurityUtils.MANAGE_PRODUCTS;

@Slf4j
@Controller
@Secured(MANAGE_PRODUCTS)
public class ProductController extends WShopAdminBaseController {

    private static final String VIEW_PREFIX = "products/";

    private final CatalogService catalogService;

    private final ProductValidator productValidator;

    private final ProductImagesValidator productImagesValidator;

    @Autowired
    public ProductController(CatalogService catalogService, ProductValidator productFormValidator, ProductImagesValidator productImagesValidator) {
        this.catalogService = catalogService;
        this.productValidator = productFormValidator;
        this.productImagesValidator = productImagesValidator;
    }

    @Override
    protected String getHeaderTitle() {
        return "Управление продуктами";
    }

    @ModelAttribute("categoriesList")
    public List<Category> categoriesList() {
        return this.catalogService.getAllCategories();
    }

    @ModelAttribute("unitList")
    public List<Unit> unitList() {
        return this.catalogService.getAllUnits();
    }

    @ModelAttribute("tagList")
    public List<Tag> tagList() {
        return this.catalogService.getAllTags();
    }

    @ModelAttribute("producerList")
    public List<Producer> producerList() {
        return this.catalogService.getAllProducers();
    }

    @GetMapping("/products")
    public String listProducts(Model model) {
        model.addAttribute("products", this.catalogService.getAllProducts());
        return VIEW_PREFIX + "products";
    }

    @GetMapping("/products/new")
    public String createProductForm(Model model) {
        Product product = new Product();
        model.addAttribute("product", product);
        return VIEW_PREFIX + "create_product";
    }

    @PostMapping("/products")
    public String createProduct(
            @Valid Product product,
            BindingResult result,
            RedirectAttributes redirectAttributes,
            Locale locale
    ) {
        this.productValidator.validate(product, result);
        this.productImagesValidator.validate(product, result);

        if (result.hasErrors()) {
            return VIEW_PREFIX + "create_product";
        }
        Product persistedProduct = this.catalogService.createProduct(product);
        log.debug("Created new product with id : {} and name : {}", persistedProduct.getId(), persistedProduct.getName());
        redirectAttributes.addFlashAttribute("info", getMessage(INFO_CREATE_SUCCESS, locale, LABEL_PRODUCT));
        return "redirect:/products";
    }

    @GetMapping("/products/{id}")
    public String editProduct(@PathVariable("id") Product product, Model model) {
        model.addAttribute("product", product);
        return VIEW_PREFIX + "edit_product";
    }

    @PostMapping("/products/{id}")
    public String updateProduct(
            @Valid Product product,
            BindingResult result,
            RedirectAttributes redirectAttributes,
            Locale locale
    ) {
        this.productImagesValidator.validate(product, result);

        if (result.hasErrors()) {
            return VIEW_PREFIX + "edit_product";
        }
        Product persistedProduct = this.catalogService.updateProduct(product);
        log.debug("Updated product with id : {} and name : {}", persistedProduct.getId(), persistedProduct.getName());
        redirectAttributes.addFlashAttribute("info", getMessage(INFO_UPDATE_SUCCESS, locale, LABEL_PRODUCT));
        return "redirect:/products";
    }

}
