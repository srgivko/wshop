package by.lodochkina.wshop.security;

import by.lodochkina.wshop.entities.Permission;
import by.lodochkina.wshop.entities.Role;
import by.lodochkina.wshop.entities.User;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

public interface SecurityService {
    Optional<User> findUserByEmail(String email);

    String resetPassword(String email);

    void updatePassword(String email, String token, String encodedPwd);

    List<Permission> getAllPermissions();

    boolean verifyPasswordResetToken(String email, String token);

    List<Role> getAllRoles();

    Optional<Role> findRoleByName(String name);

    Optional<Role> findRoleById(Long id);

    @Transactional
    Role createRole(Role role);

    @Transactional
    Role updateRole(Role role);

    List<User> getAllUsers();

    User createUser(User user);

    @Transactional
    User updateUser(User user);
}
