package by.lodochkina.wshop.customers;

import by.lodochkina.wshop.entities.Customer;

import java.util.Optional;

public interface CustomerService {
    Optional<Customer> findCustomerByEmail(String email);

    Customer createCustomer(Customer customer);
}
