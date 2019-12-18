package by.lodochkina.wshop.subscribers;

import by.lodochkina.wshop.entities.Subscriber;

import java.util.List;

public interface SubscriberService {
    List<Subscriber> getAllSubscribers();

    void subscribe(String email);

    Subscriber unsubscribe(String code);

    void removeSubscriberById(String email);
}
