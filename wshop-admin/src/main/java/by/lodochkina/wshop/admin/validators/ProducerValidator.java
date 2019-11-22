package by.lodochkina.wshop.admin.validators;

import by.lodochkina.wshop.entities.Producer;
import by.lodochkina.wshop.services.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class ProducerValidator implements Validator {

    private final CatalogService catalogService;

    @Autowired
    public ProducerValidator(CatalogService catalogService) {
        this.catalogService = catalogService;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return Producer.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Producer producer = (Producer) o;
        if (this.catalogService.findProducerByName(producer.getName()).isPresent()) {
            errors.rejectValue("name", "error.exists", new Object[]{producer.getName()}, "Producer name " + producer.getName() + " already exists");
        }
    }
}
