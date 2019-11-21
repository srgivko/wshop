package by.lodochkina.wshop.security;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.entities.Permission;
import by.lodochkina.wshop.entities.Role;
import by.lodochkina.wshop.entities.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@Slf4j
public class SecurityServiceImpl implements SecurityService {

    private final UserRepository userRepository;

    private final PermissionRepository permissionRepository;

    private final RoleRepository roleRepository;

    @Autowired
    public SecurityServiceImpl(UserRepository userRepository, PermissionRepository permissionRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.permissionRepository = permissionRepository;
        this.roleRepository = roleRepository;
    }

    public Optional<User> findUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Transactional
    @Override
    public String resetPassword(String email) {
        Optional<User> user = this.findUserByEmail(email);
        if (!user.isPresent()) {
            throw new WShopException("Invalid email address");
        }
        String uuid = UUID.randomUUID().toString();
        user.get().setPasswordResetToken(uuid);
        return uuid;
    }

    @Transactional
    @Override
    public void updatePassword(String email, String token, String password) {
        Optional<User> user = findUserByEmail(email);
        if (!user.isPresent()) {
            throw new WShopException("Invalid email address");
        }
        if (!StringUtils.hasText(token) || !token.equals(user.get().getPasswordResetToken())) {
            throw new WShopException("Invalid password reset token");
        }
        user.get().setPassword(password);
        user.get().setPasswordResetToken(null);
    }

    public List<Permission> getAllPermissions() {
        return permissionRepository.findAll();
    }

    @Override
    public boolean verifyPasswordResetToken(String email, String token) {
        User user = this.userRepository.findByEmail(email).orElseThrow(WShopException::new);
        if (token == null || token.isEmpty() || token.equals(user.getPasswordResetToken())) {
            return false;
        }
        return true;
    }

    @Override
    public List<Role> getAllRoles() {
        return this.roleRepository.findAll();
    }

    @Override
    public Optional<Role> findRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    @Override
    public Optional<Role> findRoleById(Long id) {
        return roleRepository.findById(id);
    }

    @Transactional
    @Override
    public Role createRole(Role role) {
        Optional<Role> roleByName = findRoleByName(role.getName());
        if (roleByName.isPresent()) {
            throw new WShopException("Role " + role.getName() + " already exist"); //TODO; i18n
        }
        return saveRole(role);
    }

    @Transactional
    @Override
    public Role updateRole(Role role) {
        Optional<Role> persistedRole = this.roleRepository.findById(role.getId());
        if (!persistedRole.isPresent()) {
            throw new WShopException("Role " + role.getId() + " doesn't exist");
        }
        return saveRole(persistedRole.get());
    }

    private Role saveRole(Role role) {
        List<Permission> persistedPermissions = new ArrayList<>();
        List<Permission> permissions = role.getPermissions();
        if (permissions != null) {
            for (Permission permission : permissions) {
                if (permission.getId() != null) {
                    persistedPermissions.add(this.permissionRepository.findById(permission.getId()).orElseThrow(WShopException::new));
                }
            }
        }
        role.setPermissions(persistedPermissions);
        return roleRepository.save(role);
    }
}
