package by.lodochkina.wshop.shop;

import by.lodochkina.wshop.entities.Customer;
import by.lodochkina.wshop.entities.Product;
import by.lodochkina.wshop.entities.Rating;
import org.springframework.data.jpa.repository.support.JpaRepositoryImplementation;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RatingRepository extends JpaRepositoryImplementation<Rating, Long> {
    Optional<Rating> findByCustomerAndProduct(Customer customer, Product product);
}
