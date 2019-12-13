package by.lodochkina.wshop.sales;

import by.lodochkina.wshop.entities.SaleProduct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SaleProductRepository extends JpaRepository<SaleProduct, Long> {
}
