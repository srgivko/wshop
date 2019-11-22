package by.lodochkina.wshop.admin.validators;

import by.lodochkina.wshop.entities.Category;
import by.lodochkina.wshop.services.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class CategoryValidator implements Validator {

    private final CatalogService catalogService;

    @Autowired
    public CategoryValidator(CatalogService securityService) {
        this.catalogService = securityService;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return Category.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Category category = (Category) o;
        String name = category.getName();
        if(this.catalogService.findCategoryByName(name).isPresent()){
            errors.rejectValue("name", "error.exists", new Object[]{name}, "Category " + name + " already exists");
        }
    }
}
