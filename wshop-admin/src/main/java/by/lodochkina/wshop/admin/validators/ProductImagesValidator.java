package by.lodochkina.wshop.admin.validators;

import by.lodochkina.wshop.entities.Product;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class ProductImagesValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return Product.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Product product = (Product) o;
        product.getImagesUrl().removeIf(String::isEmpty);
        if (product.getImagesUrl().isEmpty()) {
            errors.rejectValue("imagesUrl", "error.required", "Product must have less one IMAGE");
        }
    }
}
