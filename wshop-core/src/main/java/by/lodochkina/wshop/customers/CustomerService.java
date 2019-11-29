package by.lodochkina.wshop.customers;

import by.lodochkina.wshop.entities.Customer;
import by.lodochkina.wshop.entities.Order;
import by.lodochkina.wshop.entities.Product;

import java.util.List;
import java.util.Optional;
import java.util.Set;

public interface CustomerService {
    Optional<Customer> findCustomerByEmail(String email);

    Customer createCustomer(Customer customer, String urlHostname);

    List<Customer> getAllCustomers();

    Optional<Customer> findCustomerById(Long id);

    List<Order> getCustomerOrders(Long customerId);

    Set<Product> addProductToWishList(Long customerId, Long productId);

    Set<Product> removeProductFromWishList(Long customerId, Long productId);

    void activateCustomer(String code);

    Customer restorePassword(String email, String urlHostname);

    Optional<Customer> findCustomerByActivationCode(String code);

    void newPassword(String code, String password);
}
