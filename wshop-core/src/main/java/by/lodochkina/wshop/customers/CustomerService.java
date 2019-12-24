package by.lodochkina.wshop.customers;

import by.lodochkina.wshop.entities.Customer;
import by.lodochkina.wshop.entities.Order;
import by.lodochkina.wshop.entities.Product;
import by.lodochkina.wshop.entities.Rating;

import java.util.List;
import java.util.Optional;

public interface CustomerService {
    Optional<Customer> findCustomerByEmail(String email);

    Customer createCustomer(Customer customer, String urlHostname);

    List<Customer> getAllCustomers();

    Optional<Customer> findCustomerById(Long id);

    List<Order> getCustomerOrders(Long customerId);

    Product addProductToWishList(Long customerId, Long productId);

    Product removeProductFromWishList(Long customerId, Long productId);

    void activateCustomer(String code);

    Customer restorePassword(String email, String urlHostname);

    Optional<Customer> findCustomerByActivationCode(String code);

    void newPassword(String code, String password);

    Rating setRate(Long productId, Long customerId, int rate);
}
