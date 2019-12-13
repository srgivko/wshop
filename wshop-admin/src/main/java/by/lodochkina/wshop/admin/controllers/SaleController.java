package by.lodochkina.wshop.admin.controllers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.entities.Sale;
import by.lodochkina.wshop.entities.SaleProduct;
import by.lodochkina.wshop.sales.SaleService;
import by.lodochkina.wshop.services.CatalogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Slf4j
@Controller
public class SaleController extends WShopAdminBaseController {

    private static final String VIEW_PREFIX = "sales/";

    private final SaleService saleService;

    private final CatalogService catalogService;

    @Autowired
    public SaleController(SaleService saleService, CatalogService catalogService) {
        this.saleService = saleService;
        this.catalogService = catalogService;
    }

    @Override
    protected String getHeaderTitle() {
        return "Manage sale";
    }

    @GetMapping("/sales")
    public String showAllSales(Model model) {
        model.addAttribute("sales", this.saleService.getAllSales());
        return VIEW_PREFIX.concat("sales");
    }

    @GetMapping({"/sales/{id}", "/sales/new"})
    public String showSale(@PathVariable(value = "id", required = false) Sale sale, Model model) {
        if (sale == null) {
            sale = new Sale();
        }
        model.addAttribute("sale", sale);
        return VIEW_PREFIX.concat("create_edit_sale");
    }

    @PostMapping({"/sales"})
    public String saveOrUpdateSale(@Valid Sale sale, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return VIEW_PREFIX.concat("create_edit_sale");
        }
        if (sale.getId() == null) {
            this.saleService.createSale(sale);
            log.debug("Created new sale with id : {} and name : {}", sale.getId(), sale.getName());
            redirectAttributes.addFlashAttribute("info", "Sale created successfully");
        } else {
            this.saleService.updateSale(sale);
            log.debug("Created update sale with id : {} and name : {}", sale.getId(), sale.getName());
            redirectAttributes.addFlashAttribute("info", "Sale updated successfully");
        }
        return "redirect:/sales";
    }

    @GetMapping({"/sales/{saleId}/addSaleProduct", "/sales/{saleId}/saleProduct/{saleProductId}"})
    public String showAddSaleProduct(
            @PathVariable Long saleId,
            @PathVariable(value = "saleProductId", required = false) SaleProduct saleProduct,
            Model model
    ) {
        if (saleProduct == null) {
            saleProduct = new SaleProduct();
        }
        model.addAttribute("products", this.catalogService.getAllProducts());
        model.addAttribute("saleProduct", saleProduct);
        model.addAttribute("saleId", saleId);
        return VIEW_PREFIX.concat("add_sale_product.html");
    }

    @GetMapping({"/sales/{id}/delete"})
    public String deleteSale(@PathVariable(name = "id") Sale sale) {
        this.saleService.removeSale(sale);
        return "redirect:/sales";
    }

    // TODO: 12/12/19 heck if exist another sale with this project between begin and end sale dates
    @PostMapping({"/sales/{saleId}/addSaleProduct"})
    public String addSaleProduct(@PathVariable Long saleId, @Valid SaleProduct saleProduct, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return VIEW_PREFIX.concat("add_sale_product.html");
        }
        this.saleService.addSaleProduct(saleId, saleProduct);
        return String.format("redirect:/sales/%d", saleId);
    }

    @DeleteMapping({"/sales/{saleId}/saleProduct/{saleProductId}"})
    @ResponseBody
    public void addSaleProduct(@PathVariable Long saleId, @PathVariable Long saleProductId) {
        this.saleService.removeSaleProduct(saleId, saleProductId);
    }

}
