package by.lodochkina.wshop.site.models;

import by.lodochkina.wshop.entities.Address;
import by.lodochkina.wshop.entities.Customer;
import by.lodochkina.wshop.entities.Payment;
import by.lodochkina.wshop.entities.Product;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
public class Cart {
    private List<LineItem> items = new ArrayList<LineItem>();
    private Customer customer = new Customer();
    private Address deliveryAddress = new Address();
    private Payment payment = new Payment();

    public void addItem(Product product) {
        for (LineItem lineItem : items) {
            if (lineItem.getProduct().getSku().equals(product.getSku())) {
                lineItem.setQuantity(lineItem.getQuantity() + 1);
                return;
            }
        }
        LineItem item = new LineItem(product, 1);
        this.items.add(item);
    }

    public void updateItemQuantity(Product product, int quantity) {
        for (LineItem lineItem : items) {
            if (lineItem.getProduct().getSku().equals(product.getSku())) {
                lineItem.setQuantity(quantity);
            }
        }
    }

    public void removeItem(Long id) {
        LineItem item = null;
        for (LineItem lineItem : items) {
            if (lineItem.getProduct().getId().equals(id)) {
                item = lineItem;
                break;
            }
        }
        if (item != null) {
            items.remove(item);
        }
    }

    public void clearItems() {
        items = new ArrayList<LineItem>();
    }

    public int getItemCount() {
        int count = 0;
        for (LineItem lineItem : items) {
            count += lineItem.getQuantity();
        }
        return count;
    }

    public BigDecimal getTotalAmount() {
        BigDecimal amount = new BigDecimal("0.0");
        for (LineItem lineItem : items) {
            amount = amount.add(lineItem.getSubTotal());
        }
        return amount;
    }

}
