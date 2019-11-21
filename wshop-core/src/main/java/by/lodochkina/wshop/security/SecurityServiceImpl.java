package by.lodochkina.wshop.security;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.entities.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Optional;
import java.util.UUID;

@Service
@Slf4j
public class SecurityServiceImpl implements SecurityService {

    @Autowired
    private final UserRepository userRepository;

    public SecurityServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
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
}
