package by.lodochkina.wshop.admin.validators;

import by.lodochkina.wshop.entities.Product;
import by.lodochkina.wshop.services.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class ProductValidator implements Validator {
    private final CatalogService catalogService;

    @Autowired
    public ProductValidator(CatalogService catalogService) {
        this.catalogService = catalogService;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return Product.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Product product = (Product) o;
        product.getImagesUrl().removeIf(String::isEmpty);
        if (this.catalogService.findProductBySku(product.getSku()).isPresent()) {
            errors.rejectValue("sku", "error.exists", new Object[]{product.getSku()}, "Product SKU " + product.getSku() + " already exists");
        }
    }
}
