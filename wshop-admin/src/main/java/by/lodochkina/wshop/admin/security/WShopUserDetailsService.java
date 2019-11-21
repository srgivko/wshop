package by.lodochkina.wshop.admin.security;

import by.lodochkina.wshop.entities.User;
import by.lodochkina.wshop.security.SecurityService;
import groovy.util.logging.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class WShopUserDetailsService implements UserDetailsService {

    private final SecurityService securityService;

    @Autowired
    public WShopUserDetailsService(SecurityService securityService) {
        this.securityService = securityService;
    }

    @Override
    public UserDetails loadUserByUsername(String userName) {
        Optional<User> user = this.securityService.findUserByEmail(userName);
        if (!user.isPresent()) {
            throw new UsernameNotFoundException("Email " + userName + " not found");
        }
        return new AuthenticatedUser(user.get());
    }
}
