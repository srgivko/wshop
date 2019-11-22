package by.lodochkina.wshop.admin.validators;

import by.lodochkina.wshop.entities.Tag;
import by.lodochkina.wshop.services.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class TagValidator implements Validator {

    private final CatalogService catalogService;

    @Autowired
    public TagValidator(CatalogService catalogService) {
        this.catalogService = catalogService;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return Tag.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Tag tag = (Tag) o;
        if (this.catalogService.findTagByName(tag.getName()).isPresent()) {
            errors.rejectValue("name", "error.exists", new Object[]{tag.getName()}, "Tag name " + tag.getName() + " already exists");
        }
    }
}
