package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.entities.Rating;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RatingController extends WShopSiteBaseController {

    // TODO: 12/12/19 add reload? when click on rating
    @PostMapping("/products/{id}/rating")
    @ResponseBody
    public int setRating(@PathVariable(name = "id") Long productId, @RequestBody Rating rating) {
        rating = this.customerService.setRate(productId, getCurrentUser().getCustomer().getId(), rating.getRate());
        return rating.getRate();
    }

    @Override
    protected String getHeaderTitle() {
        return "Manage rating";
    }
}
