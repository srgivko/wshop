package by.lodochkina.wshop.sales;

import by.lodochkina.wshop.entities.Product;
import by.lodochkina.wshop.entities.Sale;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SaleRepository extends JpaRepository<Sale, Long> {

    @Query("select distinct pr from Sale s " +
            "join s.saleProductList slpr " +
            "join slpr.product pr " +
            "where s.beginDate < current_timestamp " +
            "and s.endDate > current_timestamp")
    List<Product> getAllProductsWithActiveSale();
}
