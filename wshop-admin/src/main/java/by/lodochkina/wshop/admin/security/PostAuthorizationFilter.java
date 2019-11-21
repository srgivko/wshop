package by.lodochkina.wshop.admin.security;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import by.lodochkina.wshop.security.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@Component
public class PostAuthorizationFilter extends OncePerRequestFilter
{
    @Autowired
    private final SecurityService securityService;

    protected String[] IGNORE_URIS = {"/assets/"};

    public PostAuthorizationFilter(SecurityService securityService) {
        this.securityService = securityService;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws ServletException, IOException
    {
        String uri = request.getRequestURI();
        if(!isIgnorableURI(uri)){
            String menu = MenuConfiguration.getMatchingMenu(uri);
            request.setAttribute("CURRENT_MENU", menu);
        }
        chain.doFilter(request, response);
    }

    private boolean isIgnorableURI(String uri)
    {
        for (String u : IGNORE_URIS)
        {
            if(uri.startsWith(u))
            {
                return true;
            }
        }
        return false;
    }
}