package by.lodochkina.wshop.subscribers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.entities.Subscriber;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
public class SubscriberServiceImpl implements SubscriberService {

    private final SubscriberRepository subscriberRepository;

    @Autowired
    public SubscriberServiceImpl(SubscriberRepository subscriberRepository) {
        this.subscriberRepository = subscriberRepository;
    }

    @Override
    public List<Subscriber> getAllSubscribers() {
        return this.subscriberRepository.findAll();
    }

    @Transactional
    @Override
    public void subscribe(String email) {
        Subscriber subscriber = new Subscriber();
        subscriber.setEmail(email);
        subscriber.setRemoveCode(UUID.randomUUID().toString());
        this.subscriberRepository.save(subscriber);
    }

    @Transactional
    @Override
    public Subscriber unsubscribe(String code) {
        Subscriber subscriber= this.subscriberRepository.findByRemoveCode(code).orElseThrow(WShopException::new);
        this.subscriberRepository.delete(subscriber);
        return subscriber;
    }

    @Transactional
    @Override
    public void removeSubscriberById(String email) {
        this.subscriberRepository.deleteById(email);
    }
}
