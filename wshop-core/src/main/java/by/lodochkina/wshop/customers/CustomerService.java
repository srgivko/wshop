package by.lodochkina.wshop.customers;

import by.lodochkina.wshop.entities.Customer;
import by.lodochkina.wshop.entities.Order;

import java.util.List;
import java.util.Optional;

public interface CustomerService {
    Optional<Customer> findCustomerByEmail(String email);

    Customer createCustomer(Customer customer);

    List<Customer> getAllCustomers();

    Optional<Customer> findCustomerById(Long id);

    List<Order> getCustomerOrders(Long customerId);
}
