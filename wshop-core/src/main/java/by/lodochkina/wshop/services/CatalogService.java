package by.lodochkina.wshop.services;

import by.lodochkina.wshop.entities.*;
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

    List<Producer> getAllProducers();

    Optional<Tag> findTagByName(String name);

    Optional<Unit> findUnitByName(String name);

    Optional<Producer> findProducerByName(String name);

    Tag createTag(Tag tag);

    Unit createUnit(Unit unit);

    Tag updateTag(Tag tag);

    Unit updateUnit(Unit unit);

    Producer createProducer(Producer producer);

    Producer updateProducer(Producer producer);

    Optional<Tag> findTagById(Long id);

    Optional<Unit> findUnitById(Long id);

    Optional<Producer> findProducerById(Long id);

    List<Category> getRootCategories();


}
