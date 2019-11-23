package by.lodochkina.wshop.orders;

import by.lodochkina.wshop.entities.Order;

import java.util.List;
import java.util.Optional;

public interface OrderService {
    Order createOrder(Order order);

    Optional<Order> findOrderByOrderNumber(String orderNumber);

    List<Order> getAllOrders();

    Order updateOrder(Order order);
}
