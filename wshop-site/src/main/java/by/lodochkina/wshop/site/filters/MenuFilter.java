package by.lodochkina.wshop.site.filters;

import by.lodochkina.wshop.site.utils.MenuConfiguration;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
@Order(2)
public class MenuFilter implements Filter {

    private static final String[] IGNORE_URIS = {"/assets/", "/categories", "/products"};

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse res = (HttpServletResponse) servletResponse;
        String uri = req.getRequestURI();
        if(!isIgnorableURI(uri)){
            String menu = MenuConfiguration.getMatchingMenu(uri);
            req.setAttribute("CURRENT_MENU", menu);
        }
        filterChain.doFilter(req, res);
    }

    private boolean isIgnorableURI(String uri) {
        for (String u : IGNORE_URIS) {
            if(uri.startsWith(u)) {
                return true;
            }
        }
        return false;
    }
}