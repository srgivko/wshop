package by.lodochkina.wshop.sales;

import by.lodochkina.wshop.entities.Sale;
import by.lodochkina.wshop.entities.SaleProduct;

import java.util.List;
import java.util.Optional;

public interface SaleService {

    List<Sale> getAllSales();

    Optional<Sale> findSaleById(Long id);

    Sale createSale(Sale Sale);

    Sale updateSale(Sale Sale);

    SaleProduct addSaleProduct(Long saleId, SaleProduct saleProduct);
}
