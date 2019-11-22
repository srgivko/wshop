package by.lodochkina.wshop.admin.controllers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.admin.validators.UnitValidator;
import by.lodochkina.wshop.entities.Unit;
import by.lodochkina.wshop.entities.Unit;
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

import static by.lodochkina.wshop.admin.utils.SecurityUtils.MANAGE_PRODUCTS;

@Slf4j
@Controller
@Secured(MANAGE_PRODUCTS)
public class UnitController extends WShopAdminBaseController {

    private static final String VIEW_PREFIX = "units/";
    private final CatalogService catalogService;
    private final UnitValidator unitValidator;

    @Autowired
    public UnitController(CatalogService catalogService, UnitValidator unitValidator) {
        this.catalogService = catalogService;
        this.unitValidator = unitValidator;
    }

    @Override
    protected String getHeaderTitle() {
        return "Управление единицы измерения";
    }

    @GetMapping("/units")
    public String listUnits(Model model) {
        model.addAttribute("units", this.catalogService.getAllUnits());
        return VIEW_PREFIX + "units";
    }

    @GetMapping({"/units/new", "/units/{id}"})
    public String createAndUpdateUnitForm(@PathVariable(value = "id", required = false) Long id, Model model) {
        Unit unit;
        if (id == null) {
            unit = new Unit();
        } else {
            unit = this.catalogService.findUnitById(id).orElseThrow(WShopException::new);
        }
        model.addAttribute("unit", unit);
        return VIEW_PREFIX + "create_edit_unit";
    }

    @PostMapping({"/units", "/units/{id}"})
    public String createAndUpdateUnit(
            @PathVariable(required = false) Long id,
            @Valid Unit unit,
            BindingResult result,
            RedirectAttributes redirectAttributes
    ) {
        this.unitValidator.validate(unit, result);
        if (result.hasErrors()) {
            return VIEW_PREFIX + "create_edit_unit";
        }
        Unit persistedUnit;
        if (id == null) {
            persistedUnit = this.catalogService.createUnit(unit);
            log.debug("Created new unit with id : {} and name : {}", persistedUnit.getId(), persistedUnit.getName());
            redirectAttributes.addFlashAttribute("info", "Unit created successfully");
        } else {
            persistedUnit = this.catalogService.updateUnit(unit);
            log.debug("Unit new unit with id : {} and name : {}", persistedUnit.getId(), persistedUnit.getName());
            redirectAttributes.addFlashAttribute("info", "Unit updated successfully");
        }
        redirectAttributes.addFlashAttribute("info", "Unit created successfully");
        return "redirect:/units";
    }
}
