package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.entities.Subscriber;
import by.lodochkina.wshop.site.dto.EmailDto;
import by.lodochkina.wshop.subscribers.SubscriberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@Slf4j
public class SubscriberController {

    private final SubscriberService subscriberService;

    @Autowired
    public SubscriberController(SubscriberService subscriberService) {
        this.subscriberService = subscriberService;
    }

    @PostMapping("/subscribe")
    @ResponseBody
    public EmailDto subscribe(@RequestBody @Valid EmailDto email) {
        this.subscriberService.subscribe(email.getEmail());
        return email;
    }

    @GetMapping("/subscribe/{code}")
    public String unsubscribe(@PathVariable String code, RedirectAttributes redirectAttributes) {
        Subscriber unsubscriber = this.subscriberService.unsubscribe(code);
        redirectAttributes.addFlashAttribute("info", String.format("you are successful unsubscribe (%s)", unsubscriber.getEmail()));
        return "redirect:/home";
    }

}
