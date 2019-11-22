package by.lodochkina.wshop.site.security;

import by.lodochkina.wshop.customers.CustomerService;
import by.lodochkina.wshop.entities.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CustomUserDetailsService implements UserDetailsService {
    private final CustomerService customerService;

    @Autowired
    public CustomUserDetailsService(CustomerService customerService) {
        this.customerService = customerService;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Optional<Customer> customer = this.customerService.findCustomerByEmail(email);
        if (!customer.isPresent()) {
            throw new UsernameNotFoundException("Email " + email + " not found");
        }
        return new AuthenticatedUser(customer.get());
    }

}
