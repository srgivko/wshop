package by.lodochkina.wshop.orders;

import by.lodochkina.wshop.entities.Order;
import by.lodochkina.wshop.entities.OrderStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface OrderRepository extends JpaRepository<Order, Long> {
    Optional<Order> findByOrderNumber(String orderNumber);

    List<Order> findByCustomerId(Long customerID);

    List<Order> findTop10ByStatusIsNotOrderByIdDesc(OrderStatus status);
}
