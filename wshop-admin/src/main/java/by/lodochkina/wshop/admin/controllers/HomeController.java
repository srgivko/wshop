package by.lodochkina.wshop.admin.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;

@Slf4j
@Controller
public class HomeController extends WShopAdminBaseController {

    @GetMapping("/home")
    public String home(Model model) {
        return "home";
    }

    @Override
    protected String getHeaderTitle() {
        return "Домашняя страница";
    }

    @RequestMapping("/ckfinder_ex")
    public void index(HttpServletResponse response) {
        // Redirect to CKFinder's samples.
        response.setHeader("Location", "/ckfinder/static/ckfinder.html");
        response.setStatus(302);
    }
}