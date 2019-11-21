package by.lodochkina.wshop.admin.controllers;

import static by.lodochkina.wshop.admin.utils.SecurityUtils.*;

import by.lodochkina.wshop.entities.Permission;
import by.lodochkina.wshop.security.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@Secured(MANAGE_PERMISSIONS)
public class PermissionController extends WShopAdminBaseController{

    private static final String VIEW_PREFIX = "permissions/";

    private final SecurityService securityService;

    @Autowired
    public PermissionController(SecurityService securityService) {
        this.securityService = securityService;
    }

    @Override
    protected String getHeaderTitle()
    {
        return "Управление разрешениями";
    }

    @GetMapping(value="/permissions")
    public String listPermissions(Model model) {
        List<Permission> permissionList = this.securityService.getAllPermissions();
        model.addAttribute("permissions",permissionList);
        return VIEW_PREFIX+"permissions";
    }

}
