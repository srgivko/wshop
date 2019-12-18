package by.lodochkina.wshop.admin.services;

import by.lodochkina.wshop.customers.CustomerRepository;
import by.lodochkina.wshop.entities.Customer;
import by.lodochkina.wshop.entities.Order;
import by.lodochkina.wshop.entities.Product;
import by.lodochkina.wshop.entities.Subscriber;
import by.lodochkina.wshop.orders.OrderRepository;
import by.lodochkina.wshop.security.UserRepository;
import by.lodochkina.wshop.shop.ProductRepository;
import by.lodochkina.wshop.subscribers.SubscriberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static by.lodochkina.wshop.entities.OrderStatus.COMPLETED;

@Service
public class DashboardServiceImpl implements DashboardService {

    private final CustomerRepository customerRepository;
    private final OrderRepository orderRepository;
    private final UserRepository userRepository;
    private final ProductRepository productRepository;
    private final SubscriberRepository subscriberRepository;

    @Autowired
    public DashboardServiceImpl(CustomerRepository customerRepository, OrderRepository orderRepository,
                                UserRepository userRepository, ProductRepository productRepository,
                                SubscriberRepository subscriberRepository) {
        this.customerRepository = customerRepository;
        this.orderRepository = orderRepository;
        this.userRepository = userRepository;
        this.productRepository = productRepository;
        this.subscriberRepository = subscriberRepository;
    }

    @Override
    public Long getTotalCountOfSubscribers(){
        return this.subscriberRepository.count();
    }

    @Override
    public Long getTotalCountOfCustomers(){
        return this.customerRepository.count();
    }

    @Override
    public Long getTotalCountOfOrders(){
        return this.orderRepository.count();
    }

    @Override
    public Long getTotalCountOfUsers(){
        return this.userRepository.count();
    }

    @Override
    public Long getTotalCountOfProducts(){
        return this.productRepository.count();
    }

    @Override
    public List<Customer> get8LatestCustomers(){
        return this.customerRepository.findTop8ByOrderByIdDesc();
    }

    @Override
    public List<Product> get5LatestProducts(){
        return this.productRepository.findTop5ByOrderByIdDesc();
    }

    @Override
    public List<Order> get10LatestOrders(){
        return this.orderRepository.findTop10ByStatusIsNotOrderByIdDesc(COMPLETED);
    }

    @Override
    public List<Subscriber> get10LatestSubscribers() {
        return this.subscriberRepository.findTop10ByOrderBySubscribedOnDesc();
    }
}
