package by.lodochkina.wshop.admin.controllers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.admin.validators.ProducerValidator;
import by.lodochkina.wshop.entities.Producer;
import by.lodochkina.wshop.services.CatalogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

import java.util.Locale;

import static by.lodochkina.wshop.admin.utils.MessageCodes.*;
import static by.lodochkina.wshop.admin.utils.SecurityUtils.MANAGE_PRODUCTS;

@Slf4j
@Controller
@Secured(MANAGE_PRODUCTS)
public class    ProducerController extends WShopAdminBaseController {

    private static final String VIEW_PREFIX = "producers/";
    private final CatalogService catalogService;
    private final ProducerValidator producerValidator;

    @Autowired
    public ProducerController(CatalogService catalogService, ProducerValidator producerValidator) {
        this.catalogService = catalogService;
        this.producerValidator = producerValidator;
    }

    @Override
    protected String getHeaderTitle() {
        return "Управление тегами";
    }

    @GetMapping("/producers")
    public String listProducers(Model model) {
        model.addAttribute("producers", this.catalogService.getAllProducers());
        return VIEW_PREFIX + "producers";
    }

    @GetMapping({"/producers/new", "/producers/{id}"})
    public String createAndUpdateProducerForm(@PathVariable(value = "id", required = false) Long id, Model model) {
        Producer producer;
        if (id == null) {
            producer = new Producer();
        } else {
            producer = this.catalogService.findProducerById(id).orElseThrow(WShopException::new);
        }
        model.addAttribute("producer", producer);
        return VIEW_PREFIX + "create_edit_producer";
    }

    @PostMapping({"/producers", "/producers/{id}"})
    public String createAndUpdateProducer(
            @PathVariable(required = false) Long id,
            @Valid Producer producer,
            BindingResult result,
            RedirectAttributes redirectAttributes,
            Locale locale
    ) {
        this.producerValidator.validate(producer, result);
        if (result.hasErrors()) {
            return VIEW_PREFIX + "create_edit_producer";
        }
        Producer persistedProducer;
        if (id == null) {
            persistedProducer = this.catalogService.createProducer(producer);
            log.debug("Created new producer with id : {} and name : {}", persistedProducer.getId(), persistedProducer.getName());
            redirectAttributes.addFlashAttribute("info", getMessage(INFO_CREATE_SUCCESS, locale, LABEL_PRODUCER));
        } else {
            persistedProducer = this.catalogService.updateProducer(producer);
            log.debug("Updated new producer with id : {} and name : {}", persistedProducer.getId(), persistedProducer.getName());
            redirectAttributes.addFlashAttribute("info", getMessage(INFO_UPDATE_SUCCESS, locale, LABEL_PRODUCER));
        }
        return "redirect:/producers";
    }
}