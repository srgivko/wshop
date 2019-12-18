package by.lodochkina.wshop.subscribers;

import by.lodochkina.wshop.entities.Subscriber;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface SubscriberRepository extends JpaRepository<Subscriber, String> {
    Optional<Subscriber> findByRemoveCode(String code);
}
