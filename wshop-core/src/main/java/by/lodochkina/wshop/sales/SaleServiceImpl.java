package by.lodochkina.wshop.sales;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.entities.Sale;
import by.lodochkina.wshop.entities.SaleProduct;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

// TODO: 12/12/19 add delete sale
@Service
public class SaleServiceImpl implements SaleService {

    private final SaleRepository saleRepository;

    public SaleServiceImpl(SaleRepository saleRepository) {
        this.saleRepository = saleRepository;
    }

    @Override
    public List<Sale> getAllSales() {
        return this.saleRepository.findAll();
    }

    @Override
    public Optional<Sale> findSaleById(Long id) {
        return this.saleRepository.findById(id);
    }

    @Transactional
    @Override
    public Sale createSale(Sale sale) {
        return this.saleRepository.save(sale);
    }

    // TODO: 12/12/19 all add update saleProductList
    @Transactional
    @Override
    public Sale updateSale(Sale sale) {
        Optional<Sale> persistedSale = this.findSaleById(sale.getId());
        if (!persistedSale.isPresent()) {
            throw new WShopException("Sale " + sale.getId() + " doesn't exist");
        }
        BeanUtils.copyProperties(sale, persistedSale, "id", "saleProductList");
        return persistedSale.get();
    }

    @Transactional
    @Override
    public SaleProduct addSaleProduct(Long saleId, SaleProduct saleProduct) {
        Sale sale = this.findSaleById(saleId).orElseThrow(WShopException::new);
        sale.addSaleProduct(saleProduct);
        this.saleRepository.save(sale);
        return saleProduct;
    }

    @Transactional
    @Override
    public SaleProduct removeSaleProduct(Long saleId, Long saleProductId) {
        Sale sale = this.findSaleById(saleId).orElseThrow(WShopException::new);
        SaleProduct saleProduct = sale.getSaleProductList().stream().filter(sp -> sp.getId().equals(saleProductId)).findFirst().orElseThrow(WShopException::new);
        sale.getSaleProductList().remove(saleProduct);
        this.saleRepository.save(sale);
        return saleProduct;
    }

    @Transactional
    @Override
    public void removeSale(Sale sale) {
        this.saleRepository.delete(sale);
    }
}
