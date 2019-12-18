package by.lodochkina.wshop.admin.controllers;

import by.lodochkina.wshop.subscribers.SubscriberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import static by.lodochkina.wshop.admin.utils.SecurityUtils.MANAGE_PROMOTIONS;

@Controller
@Secured(MANAGE_PROMOTIONS)
public class SubscriberController extends WShopAdminBaseController {

    private static final String VIEW_PREFIX = "subscribers/";

    private final SubscriberService subscriberService;

    @Autowired
    public SubscriberController(SubscriberService subscriberService) {
        this.subscriberService = subscriberService;
    }

    @Override
    protected String getHeaderTitle() {
        return "Manage subscribers";
    }

    @GetMapping("/subscribers")
    public String showAllSubscribers(Model model) {
        model.addAttribute("subscribers", this.subscriberService.getAllSubscribers());
        return VIEW_PREFIX.concat("subscribers");
    }

    @DeleteMapping("/subscribers/{email}")
    @ResponseBody
    public void removeSubscriber(@PathVariable String email) {
        this.subscriberService.removeSubscriberById(email);
    }

}
