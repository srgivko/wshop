package by.lodochkina.wshop.admin.services;

import by.lodochkina.wshop.entities.Customer;
import by.lodochkina.wshop.entities.Order;
import by.lodochkina.wshop.entities.Product;
import by.lodochkina.wshop.entities.Subscriber;

import java.util.List;

public interface DashboardService {
    Long getTotalCountOfCustomers();

    Long getTotalCountOfOrders();

    Long getTotalCountOfUsers();

    Long getTotalCountOfProducts();

    Long getTotalCountOfSubscribers();

    List<Customer> get8LatestCustomers();

    List<Product> get5LatestProducts();

    List<Order> get10LatestOrders();

    List<Subscriber> get10LatestSubscribers();
}
