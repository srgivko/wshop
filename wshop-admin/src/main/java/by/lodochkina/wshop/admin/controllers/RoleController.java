package by.lodochkina.wshop.admin.controllers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.admin.validators.RoleValidator;
import by.lodochkina.wshop.entities.Permission;
import by.lodochkina.wshop.entities.Role;
import by.lodochkina.wshop.security.SecurityService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static by.lodochkina.wshop.admin.utils.SecurityUtils.MANAGE_ROLES;

@Slf4j
@Controller
@Secured(MANAGE_ROLES)
public class RoleController extends WShopAdminBaseController {

    private static final String VIEW_PREFIX = "roles/";

    private final SecurityService securityService;
    private final RoleValidator roleValidator;

    @ModelAttribute("permissionsList")
    public List<Permission> permissionsList() {
        return this.securityService.getAllPermissions();
    }

    @GetMapping(value = "/roles/new")
    public String createRoleForm(Model model) {
        Role role = new Role();
        model.addAttribute("role", role);
        return VIEW_PREFIX + "create_role";
    }

//    Note that BindingResult result argument should be next to @ModelAttribute property to have validation errors population working properly.
    @PostMapping(value = "/roles")
    public String createRole(@Valid @ModelAttribute("role") Role role, BindingResult result, RedirectAttributes redirectAttributes) {
        roleValidator.validate(role, result);
        if (result.hasErrors()) {
            return VIEW_PREFIX + "create_role";
        }
        Role persistedRole = this.securityService.createRole(role);
        log.debug("Created new role with id : {} and name : {}", persistedRole.getId(), persistedRole.getName());
        redirectAttributes.addFlashAttribute("info", "Role created successfully"); //TODO; i18n
        return "redirect:/roles";
    }

    @Autowired
    public RoleController(SecurityService securityService, RoleValidator roleValidator) {
        this.securityService = securityService;
        this.roleValidator = roleValidator;
    }

    @Override
    protected String getHeaderTitle() {
        return "Управление ролями";
    }

    @GetMapping(value = "/roles")
    public String listRoles(Model model) {
        List<Role> roleList = this.securityService.getAllRoles();
        model.addAttribute("roles", roleList);
        return VIEW_PREFIX + "roles";
    }

    @GetMapping(value="/roles/{id}")
    public String editRoleForm(@PathVariable Long id, Model model) {
        Role role = this.securityService.findRoleById(id).orElseThrow(WShopException::new);
        Map<Long, Permission> assignedPermissionMap = new HashMap<>();
        List<Permission> permissions = role.getPermissions();
        for (Permission permission : permissions)
        {
            assignedPermissionMap.put(permission.getId(), permission);
        }
        List<Permission> rolePermissions = new ArrayList<>();
        List<Permission> allPermissions = securityService.getAllPermissions();
        for (Permission permission : allPermissions)
        {
            if(assignedPermissionMap.containsKey(permission.getId())){
                rolePermissions.add(permission);
            } else {
                rolePermissions.add(null);
            }
        }
        role.setPermissions(rolePermissions);
        model.addAttribute("role",role);
        return VIEW_PREFIX+"edit_role";
    }

    @PostMapping(value="/roles/{id}")
    public String updateRole(@ModelAttribute("role") Role role, RedirectAttributes redirectAttributes) {
        Role persistedRole = securityService.updateRole(role);
        log.debug("Updated role with id : {} and name : {}", persistedRole.getId(), persistedRole.getName());
        redirectAttributes.addFlashAttribute("info", "Role updated successfully");
        return "redirect:/roles";
    }
}
