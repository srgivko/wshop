package by.lodochkina.wshop.security;

import by.lodochkina.wshop.entities.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long>
{
    Optional<Role> findByName(String name);
}