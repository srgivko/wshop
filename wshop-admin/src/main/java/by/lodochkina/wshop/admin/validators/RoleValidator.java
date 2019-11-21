package by.lodochkina.wshop.admin.validators;

import by.lodochkina.wshop.entities.Role;
import by.lodochkina.wshop.security.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.util.Optional;

@Component
public class RoleValidator implements Validator {

    private final SecurityService securityService;

    @Autowired
    public RoleValidator(SecurityService securityService) {
        this.securityService = securityService;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return Role.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Role role = (Role) target;
        String name = role.getName();
        Optional<Role> roleByName = this.securityService.findRoleByName(name);
        if (roleByName.isPresent()) {
            errors.rejectValue("name", "error.exists", new Object[]{name}, "Role " + name + " already exists");
        }
    }
}