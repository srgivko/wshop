package by.lodochkina.wshop.customers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.entities.Customer;
import by.lodochkina.wshop.entities.Order;
import by.lodochkina.wshop.entities.Product;
import by.lodochkina.wshop.entities.Rating;
import by.lodochkina.wshop.orders.OrderRepository;
import by.lodochkina.wshop.services.EmailService;
import by.lodochkina.wshop.shop.ProductRepository;
import by.lodochkina.wshop.shop.RatingRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;

@Service
public class CustomerServiceImpl implements CustomerService {

    private final CustomerRepository customerRepository;

    private final OrderRepository orderRepository;

    private final ProductRepository productRepository;

    private final RatingRepository ratingRepostory;

    private final EmailService emailService;

    @Autowired
    public CustomerServiceImpl(CustomerRepository customerRepository, OrderRepository orderRepository, ProductRepository productRepository, RatingRepository ratingRepostory, EmailService emailService) {
        this.customerRepository = customerRepository;
        this.orderRepository = orderRepository;
        this.productRepository = productRepository;
        this.ratingRepostory = ratingRepostory;
        this.emailService = emailService;
    }

    @Override
    public Optional<Customer> findCustomerByEmail(String email) {
        return customerRepository.findByEmail(email);
    }

    @Transactional
    @Override
    public Customer createCustomer(Customer customer, String urlHostname) {
        customer.setActivationCode(UUID.randomUUID().toString());
        customerRepository.save(customer);
        this.emailService.sendRegistrationMessage(customer, urlHostname);
        return customer;
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

    @Transactional
    @Override
    public void activateCustomer(String code) {
        Customer customer = this.customerRepository.findByActivationCode(code).orElseThrow(WShopException::new);
        customer.setActivationCode(null);
        customer.setEnabled(true);
    }

    @Transactional
    @Override
    public Customer restorePassword(String email, String urlHostname) {
        Customer customer = this.findCustomerByEmail(email).orElseThrow(WShopException::new);
        customer.setActivationCode(UUID.randomUUID().toString());
        this.emailService.sendRestorePassword(customer, urlHostname);
        return customer;
    }

    @Override
    public Optional<Customer> findCustomerByActivationCode(String code) {
        return this.customerRepository.findByActivationCode(code);
    }

    @Transactional
    @Override
    public void newPassword(String code, String password) {
        Customer customer = this.customerRepository.findByActivationCode(code).orElseThrow(WShopException::new);
        customer.setPassword(password);
        customer.setActivationCode(null);
    }

    @Transactional
    @Override
    public void subscribe(Long id, Boolean subscribe) {
        Customer customer = this.customerRepository.findById(id).orElseThrow(WShopException::new);
        customer.setSubscribe(subscribe);
    }

    @Override
    public List<Customer> getAllSubscribers() {
        return this.customerRepository.findAllBySubscribeIsTrue();
    }

    @Transactional
    @Override
    public Rating setRate(Long productId, Long customerId, int rate) {
        Rating rating;
        Customer customer = this.customerRepository.findById(customerId).orElseThrow(WShopException::new);
        Product product = this.productRepository.findById(productId).orElseThrow(WShopException::new);
        Optional<Rating> optionalRating = this.ratingRepostory.findByCustomerAndProduct(customer, product);
        if (optionalRating.isPresent()) {
            rating = optionalRating.get();
            rating.setRate(rate);
            this.ratingRepostory.save(rating);
        } else {
            rating = new Rating();

            rating.setRate(rate);
            rating.setCustomer(customer);
            rating.setProduct(product);
            this.ratingRepostory.save(rating);
        }
        return rating;
    }
}
