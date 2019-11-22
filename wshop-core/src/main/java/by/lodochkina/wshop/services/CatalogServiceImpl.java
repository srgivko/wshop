package by.lodochkina.wshop.services;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.entities.Category;
import by.lodochkina.wshop.entities.Product;
import by.lodochkina.wshop.entities.Tag;
import by.lodochkina.wshop.entities.Unit;
import by.lodochkina.wshop.shop.CategoryRepository;
import by.lodochkina.wshop.shop.ProductRepository;
import by.lodochkina.wshop.shop.TagRepository;
import by.lodochkina.wshop.shop.UnitRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class CatalogServiceImpl implements CatalogService {

    private final CategoryRepository categoryRepository;

    private final ProductRepository productRepository;

    private final TagRepository tagRepository;

    private final UnitRepository unitRepository;

    @Autowired
    public CatalogServiceImpl(CategoryRepository categoryRepository, ProductRepository productRepository, TagRepository tagRepository, UnitRepository unitRepository) {
        this.categoryRepository = categoryRepository;
        this.productRepository = productRepository;
        this.tagRepository = tagRepository;
        this.unitRepository = unitRepository;
    }

    @Override
    public List<Category> getAllCategories() {
        return this.categoryRepository.findAll();
    }

    @Override
    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }

    @Override
    public Optional<Category> findCategoryByName(String name) {
        return this.categoryRepository.findByName(name);
    }

    @Override
    public Optional<Category> findCategoryById(Long id) {
        return categoryRepository.findById(id);
    }

    @Transactional
    @Override
    public Category createCategory(Category category) {
        Optional<Category> persistedCategory = this.findCategoryByName(category.getName());
        if (persistedCategory.isPresent()) {
            throw new WShopException("Category " + category.getName() + " already exist");
        }
        return categoryRepository.save(category);
    }

    @Transactional
    @Override
    public Category updateCategory(Category category) {
        Optional<Category> persistedCategory = this.findCategoryById(category.getId());
        if (!persistedCategory.isPresent()) {
            throw new WShopException("Category " + category.getId() + " doesn't exist");
        }
        BeanUtils.copyProperties(category, persistedCategory.get(), "id", "name");
        return this.categoryRepository.save(persistedCategory.get());
    }

    @Override
    public Optional<Product> findProductById(Long id) {
        return this.productRepository.findById(id);
    }

    @Override
    public Optional<Product> findProductBySku(String sku) {
        return this.productRepository.findBySku(sku);
    }

    @Transactional
    @Override
    public Product createProduct(Product product) {
        Optional<Product> persistedProduct = this.findProductBySku(product.getName());
        if (persistedProduct.isPresent()) {
            throw new WShopException("Product SKU " + product.getSku() + " already exist");
        }
        return productRepository.save(product);
    }

    @Transactional
    @Override
    public Product updateProduct(Product product) {
        Optional<Product> persistedProduct = this.findProductById(product.getId());
        if (!persistedProduct.isPresent()) {
            throw new WShopException("Product " + product.getId() + " doesn't exist");
        }
        BeanUtils.copyProperties(product, persistedProduct.get(), "id", "sku", "name", "createdOn", "imageUrl");
        return this.productRepository.save(persistedProduct.get());
    }

    @Override
    public List<Product> searchProducts(String query) {
        return this.productRepository.search(query);
    }

    @Override
    public List<Tag> getAllTags() {
        return this.tagRepository.findAll();
    }

    @Override
    public List<Unit> getAllUnits() {
        return this.unitRepository.findAll();
    }

    @Override
    public Optional<Tag> findTagByName(String name) {
        return this.tagRepository.findByName(name);
    }

    @Override
    public Optional<Unit> findUnitByName(String name) {
        return this.unitRepository.findByName(name);
    }

    @Transactional
    @Override
    public Tag createTag(Tag tag) {
        Optional<Tag> tagByName = this.findTagByName(tag.getName());
        if (tagByName.isPresent()) {
            throw new WShopException("Tag name " + tag.getName() + " already exist");
        }
        return this.tagRepository.save(tag);
    }

    @Transactional
    @Override
    public Tag updateTag(Tag tag) {
        Optional<Tag> persistedTag = this.tagRepository.findById(tag.getId());
        if (!persistedTag.isPresent()) {
            throw new WShopException("Tag " + tag.getId() + " doesn't exist");
        }
        BeanUtils.copyProperties(tag, persistedTag.get(), "id");
        return this.tagRepository.save(persistedTag.get());
    }

    @Transactional
    @Override
    public Unit createUnit(Unit unit) {
        Optional<Unit> tagByName = this.findUnitByName(unit.getName());
        if (tagByName.isPresent()) {
            throw new WShopException("Unit name " + unit.getName() + " already exist");
        }
        return this.unitRepository.save(unit);
    }

    @Transactional
    @Override
    public Unit updateUnit(Unit unit) {
        Optional<Unit> persistedUnit = this.unitRepository.findById(unit.getId());
        if (!persistedUnit.isPresent()) {
            throw new WShopException("Unit " + unit.getId() + " doesn't exist");
        }
        BeanUtils.copyProperties(unit, persistedUnit.get(), "id");
        return this.unitRepository.save(persistedUnit.get());
    }

    @Override
    public Optional<Tag> findTagById(Long id) {
        return this.tagRepository.findById(id);
    }

    @Override
    public Optional<Unit> findUnitById(Long id) {
        return this.unitRepository.findById(id);
    }
}
