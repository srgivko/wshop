package by.lodochkina.wshop.services;

import by.lodochkina.wshop.entities.Category;
import by.lodochkina.wshop.entities.Product;
import by.lodochkina.wshop.entities.Tag;
import by.lodochkina.wshop.entities.Unit;
import org.springframework.transaction.annotation.Transactional;

import javax.swing.text.html.Option;
import java.util.List;
import java.util.Optional;

public interface CatalogService {
    List<Category> getAllCategories();

    List<Product> getAllProducts();

    Optional<Category> findCategoryByName(String name);

    Optional<Category> findCategoryById(Long id);

    Category createCategory(Category category);

    Category updateCategory(Category category);

    Optional<Product> findProductById(Long id);

    Optional<Product> findProductBySku(String sku);

    Product createProduct(Product product);

    Product updateProduct(Product product);

    List<Product> searchProducts(String query);

    List<Tag> getAllTags();

    List<Unit> getAllUnits();

    Optional<Tag> findTagByName(String name);

    Optional<Unit> findUnitByName(String name);

    Tag createTag(Tag tag);

    Unit createUnit(Unit unit);

    Tag updateTag(Tag tag);

    Unit updateUnit(Unit unit);

    Optional<Tag> findTagById(Long id);

    Optional<Unit> findUnitById(Long id);
}
