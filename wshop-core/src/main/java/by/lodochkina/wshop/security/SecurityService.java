package by.lodochkina.wshop.security;

import by.lodochkina.wshop.entities.User;

import java.util.Optional;

public interface SecurityService {
    Optional<User> findUserByEmail(String email);
}
