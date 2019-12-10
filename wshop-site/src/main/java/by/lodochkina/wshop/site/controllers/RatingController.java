package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.entities.Rating;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class RatingController extends WShopSiteBaseController {


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
