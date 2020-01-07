package by.lodochkina.wshop.orders;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.entities.Order;
import by.lodochkina.wshop.services.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository;

    @Autowired
    public OrderServiceImpl(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    @Transactional
    @Override
    public Order createOrder(Order order) {
        order.setOrderNumber(String.valueOf(System.currentTimeMillis()));
        return this.orderRepository.save(order);
    }

    @Override
    public Optional<Order> findOrderByOrderNumber(String orderNumber) {
        return this.orderRepository.findByOrderNumber(orderNumber);
    }

    @Override
    public List<Order> getAllOrders() {
        Sort sort = Sort.by(Sort.Direction.DESC, "createdOn");
        return this.orderRepository.findAll(sort);
    }

    @Transactional
    @Override
    public Order updateOrder(Order order) {
        Order o = this.orderRepository.findById(order.getId()).orElseThrow(WShopException::new);
        o.setStatus(order.getStatus());
        return this.orderRepository.save(o);
    }

}
