package by.lodochkina.wshop.admin.validators;

import by.lodochkina.wshop.entities.Promotion;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import static by.lodochkina.wshop.promotions.PromotionService.UNSUBSCRIBE_URL_PLACE;

@Component
public class PromotionValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return Promotion.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Promotion promotion = (Promotion) target;
        if (!promotion.getContent().contains(UNSUBSCRIBE_URL_PLACE)) {
            errors.rejectValue("content", "error.required", new Object[]{UNSUBSCRIBE_URL_PLACE}, "Content doesn't contain " + UNSUBSCRIBE_URL_PLACE + " for unsubscribe");
        }
    }
}
