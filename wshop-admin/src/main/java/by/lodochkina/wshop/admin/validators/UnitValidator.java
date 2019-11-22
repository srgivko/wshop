package by.lodochkina.wshop.admin.validators;

import by.lodochkina.wshop.entities.Unit;
import by.lodochkina.wshop.services.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class UnitValidator implements Validator {

    private final CatalogService catalogService;

    @Autowired
    public UnitValidator(CatalogService catalogService) {
        this.catalogService = catalogService;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return Unit.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Unit unit = (Unit) o;
        if (this.catalogService.findUnitByName(unit.getName()).isPresent()) {
            errors.rejectValue("name", "error.exists", new Object[]{unit.getName()}, "Unit name " + unit.getName() + " already exists");
        }
    }
}
