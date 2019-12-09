package by.lodochkina.wshop.promotions;

import by.lodochkina.wshop.entities.Promotion;

import java.util.List;
import java.util.Optional;

public interface PromotionService {
    List<Promotion> getAllPromotions();

    Optional<Promotion> findPromotionById(Long id);

    Promotion createPromotion(Promotion promotion);

    Promotion updatePromotion(Promotion promotion);

    void sendPromotion(Long id);
}
