package by.lodochkina.wshop.admin.security;

import by.lodochkina.wshop.entities.Permission;
import by.lodochkina.wshop.entities.Role;
import by.lodochkina.wshop.entities.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;

import java.util.*;

public class AuthenticatedUser extends org.springframework.security.core.userdetails.User {

    private static final long serialVersionUID = 3953275838457016803L;

    private transient User user;

    public AuthenticatedUser(User user) {
        super(user.getEmail(), user.getPassword(), getAuthorities(user));
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    private static Collection<? extends GrantedAuthority> getAuthorities(User user) {
        Set<String> roleAndPermissions = new HashSet<>();
        List<Role> roles = user.getRoles();

        for (Role role : roles) {
            roleAndPermissions.add(role.getName());
            List<Permission> permissions = role.getPermissions();
            for (Permission permission : permissions) {
                roleAndPermissions.add("ROLE_" + permission.getName());
            }
        }

        String[] roleNames = new String[roleAndPermissions.size()];
        return AuthorityUtils.createAuthorityList(roleAndPermissions.toArray(roleNames));
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        AuthenticatedUser that = (AuthenticatedUser) o;
        return Objects.equals(user, that.user);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), user);
    }
}
