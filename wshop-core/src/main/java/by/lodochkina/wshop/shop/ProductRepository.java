package by.lodochkina.wshop.shop;

import by.lodochkina.wshop.entities.Product;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.support.JpaRepositoryImplementation;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface ProductRepository extends JpaRepositoryImplementation<Product, Long> {

    Optional<Product> findByName(String name);

    Optional<Product> findBySku(String sku);

    @Query("select p from Product p " +
            "left join p.tags t " +
            "where lower(p.name) like concat('%',lower(:query),'%') " +
            "or lower(p.sku) like concat('%',lower(:query),'%') " +
            "or lower(p.description) like concat('%',lower(:query),'%') " +
            "or lower(t.name) like concat('%',lower(:query),'%') ")
    List<Product> search(@Param("query") String query);

    List<Product> findTop5ByOrderByIdDesc();
}
