package by.lodochkina.wshop.admin.validators;

import by.lodochkina.wshop.entities.User;
import by.lodochkina.wshop.security.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.util.Optional;

@Component
public class UserValidator implements Validator {

    private final SecurityService securityService;

    @Autowired
    public UserValidator(SecurityService securityService) {
        this.securityService = securityService;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;
        String email = user.getEmail();
        Optional<User> userByEmail = this.securityService.findUserByEmail(email);
        if (userByEmail.isPresent()) {
            errors.rejectValue("email", "error.exists", new Object[]{email}, "User " + email + " already exists");
        }
    }
}
