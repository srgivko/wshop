package by.lodochkina.wshop.promotions;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.customers.CustomerService;
import by.lodochkina.wshop.entities.Customer;
import by.lodochkina.wshop.entities.Promotion;
import by.lodochkina.wshop.services.EmailService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class PromotionServiceImpl implements PromotionService {

    private final PromotionRepository promotionRepository;

    private final EmailService emailService;

    private final CustomerService customerService;

    @Autowired
    public PromotionServiceImpl(PromotionRepository promotionRepository, EmailService emailService, CustomerService customerService) {
        this.promotionRepository = promotionRepository;
        this.emailService = emailService;
        this.customerService = customerService;
    }

    @Override
    public List<Promotion> getAllPromotions() {
        return this.promotionRepository.findAll();
    }

    @Override
    public Optional<Promotion> findPromotionById(Long id) {
        return this.promotionRepository.findById(id);
    }

    @Transactional
    @Override
    public Promotion createPromotion(Promotion promotion) {
        return this.promotionRepository.save(promotion);
    }

    @Transactional
    @Override
    public Promotion updatePromotion(Promotion promotion) {
        Optional<Promotion> persistedPromotion = this.promotionRepository.findById(promotion.getId());
        if (!persistedPromotion.isPresent()) {
            throw new WShopException("Promotion " + promotion.getId() + " doesn't exist");
        }
        BeanUtils.copyProperties(promotion, persistedPromotion.get(), "id", "createdOn", "sendOn");
        return this.promotionRepository.save(persistedPromotion.get());
    }

    @Transactional
    @Override
    public void sendPromotion(Long id) {
        List<Customer> subscribers = this.customerService.getAllSubscribers();
        Promotion promotion = this.promotionRepository.findById(id).orElseThrow(WShopException::new);
        subscribers.forEach(subscriber -> this.emailService.send(subscriber.getEmail(), promotion.getSubject(), promotion.getContent()));
        promotion.setSendOn(new Date());
    }
}
