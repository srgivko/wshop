package by.lodochkina.wshop.validators;

import by.lodochkina.wshop.customers.CustomerService;
import by.lodochkina.wshop.entities.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.util.Optional;

@Component
public class CustomerValidator implements Validator {

    private final CustomerService customerService;

    @Autowired
    public CustomerValidator(CustomerService customerService) {
        this.customerService = customerService;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return Customer.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Customer customer = (Customer) o;
        Optional<Customer> customerByEmail = this.customerService.findCustomerByEmail(customer.getEmail());
        if(customerByEmail.isPresent()){
            errors.rejectValue("email", "error.exists", new Object[]{customer.getEmail()}, "Customer email " + customer.getEmail() + " already exists");
        }

    }
}
