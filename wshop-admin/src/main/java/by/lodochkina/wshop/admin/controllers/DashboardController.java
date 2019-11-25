package by.lodochkina.wshop.admin.controllers;

import by.lodochkina.wshop.admin.services.DashboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    private final DashboardService dashBoardService;

    @Autowired
    public DashboardController(DashboardService dashBoardService) {
        this.dashBoardService = dashBoardService;
    }

    @GetMapping("/dashboard")
    public String showDashboardPage(Model model){
        model.addAttribute("latestOrders", this.dashBoardService.get10LatestOrders());
        model.addAttribute("latestProducts", this.dashBoardService.get5LatestProducts());
        model.addAttribute("latestCustomers", this.dashBoardService.get8LatestCustomers());
        model.addAttribute("userCount", this.dashBoardService.getTotalCountOfUsers());
        model.addAttribute("customerCount", this.dashBoardService.getTotalCountOfCustomers());
        model.addAttribute("orderCount", this.dashBoardService.getTotalCountOfOrders());
        model.addAttribute("productCount", this.dashBoardService.getTotalCountOfProducts());
        return "dashboard";
    }
}
