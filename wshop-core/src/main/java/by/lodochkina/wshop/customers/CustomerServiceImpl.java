package by.lodochkina.wshop.customers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.entities.Customer;
import by.lodochkina.wshop.entities.Order;
import by.lodochkina.wshop.entities.Product;
import by.lodochkina.wshop.orders.OrderRepository;
import by.lodochkina.wshop.shop.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
public class CustomerServiceImpl implements CustomerService {

    private final CustomerRepository customerRepository;

    private final OrderRepository orderRepository;

    private final ProductRepository productRepository;

    @Autowired
    public CustomerServiceImpl(CustomerRepository customerRepository, OrderRepository orderRepository, ProductRepository productRepository) {
        this.customerRepository = customerRepository;
        this.orderRepository = orderRepository;
        this.productRepository = productRepository;
    }

    @Override
    public Optional<Customer> findCustomerByEmail(String email) {
        return customerRepository.findByEmail(email);
    }

    @Transactional
    @Override
    public Customer createCustomer(Customer customer) {
        return customerRepository.save(customer);
    }

    @Override
    public List<Customer> getAllCustomers() {
        return this.customerRepository.findAll();
    }

    @Override
    public Optional<Customer> findCustomerById(Long id) {
        return this.customerRepository.findById(id);
    }

    @Override
    public List<Order> getCustomerOrders(Long customerId){
        return this.orderRepository.findByCustomerId(customerId);
    }

    @Transactional
    @Override
    public Set<Product> addProductToWishList(Long customerId, Long productId) {
        Customer customer = this.findCustomerById(customerId).orElseThrow(WShopException::new);
        Product product = this.productRepository.findById(productId).orElseThrow(WShopException::new);
        customer.addProductToWishList(product);
        return customer.getWishList();
    }

    @Transactional
    @Override
    public Set<Product> removeProductFromWishList(Long customerId, Long productId) {
        Customer customer = this.findCustomerById(customerId).orElseThrow(WShopException::new);
        Product product = this.productRepository.findById(productId).orElseThrow(WShopException::new);
        customer.removeProductToWishList(product);
        return customer.getWishList();
    }
}
