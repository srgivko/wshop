package by.lodochkina.wshop.shop;

import by.lodochkina.wshop.entities.Category;
import org.springframework.data.jpa.repository.support.JpaRepositoryImplementation;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CategoryRepository extends JpaRepositoryImplementation<Category, Long> {
    Optional<Category> findByName(String name);
}