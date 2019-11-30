package by.lodochkina.wshop.site.security;

import by.lodochkina.wshop.entities.Customer;
import lombok.EqualsAndHashCode;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;

import java.util.Collection;

@EqualsAndHashCode(callSuper = false)
public class AuthenticatedUser extends org.springframework.security.core.userdetails.User {

    private static final long serialVersionUID = -2958119023444212887L;

    private Customer customer;

    public AuthenticatedUser(Customer customer) {
        super(customer.getEmail(), customer.getPassword(), getAuthorities(customer));
        this.customer = customer;
    }

    public Customer getCustomer() {
        return customer;
    }

    private static Collection<? extends GrantedAuthority> getAuthorities(Customer customer) {
        Collection<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList("ROLE_USER");
        return authorities;
    }

    @Override
    public boolean isEnabled() {
        return customer.getEnabled();
    }
}