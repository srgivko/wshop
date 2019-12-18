package by.lodochkina.wshop.promotions;

import by.lodochkina.wshop.entities.Promotion;

import java.util.List;
import java.util.Optional;

public interface PromotionService {

    String UNSUBSCRIBE_URL_PLACE = "[UNSUBSCRIBE_URL]";
    String UNSUBSCRIBE_AHREF = "<a href=\"%s\">Unsubscribe</a>";
    String UNSUBSCRIBE_URL_FORMAT = "%s/subscribe/%s";

    List<Promotion> getAllPromotions();

    Optional<Promotion> findPromotionById(Long id);

    Promotion createPromotion(Promotion promotion);

    Promotion updatePromotion(Promotion promotion);

    void sendPromotion(Long id, String urlHostname);
}
