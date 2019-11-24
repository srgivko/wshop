package by.lodochkina.wshop.shop;

import by.lodochkina.wshop.entities.Category;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.support.JpaRepositoryImplementation;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.Set;

@Repository
public interface CategoryRepository extends JpaRepositoryImplementation<Category, Long> {
    Optional<Category> findByName(String name);
    @Query("from Category c where c.parentCategory is null")
    List<Category> getRootCategories();
}