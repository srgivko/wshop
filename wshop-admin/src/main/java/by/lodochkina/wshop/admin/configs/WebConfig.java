package by.lodochkina.wshop.admin.configs;

import by.lodochkina.wshop.admin.security.PostAuthorizationFilter;
import nz.net.ultraq.thymeleaf.LayoutDialect;
import org.apache.catalina.Context;
import org.apache.catalina.connector.Connector;
import org.apache.tomcat.util.descriptor.web.SecurityCollection;
import org.apache.tomcat.util.descriptor.web.SecurityConstraint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.server.ServletWebServerFactory;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.thymeleaf.extras.springsecurity5.dialect.SpringSecurityDialect;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;

import javax.servlet.Filter;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Value("${server.port}")
    private int serverPort;

    private final MessageSource messageSource;

    @Autowired
    public WebConfig(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    @Override
    public Validator getValidator() {
        LocalValidatorFactoryBean factory = new LocalValidatorFactoryBean();
        factory.setValidationMessageSource(messageSource);
        return factory;
    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/login").setViewName("public/login");
        registry.addRedirectViewController("/", "/home");
    }

    @Bean
    public LayoutDialect layoutDialect() {
        return new LayoutDialect();
    }

    @Bean
    public SpringSecurityDialect securityDialect() {
        return new SpringSecurityDialect();
    }

    //solve this http://stackoverflow.com/questions/25957879/filter-order-in-spring-boot
    @Bean
    public FilterRegistrationBean securityFilterChain(@Qualifier(AbstractSecurityWebApplicationInitializer.DEFAULT_FILTER_NAME) Filter securityFilter) {
        FilterRegistrationBean registration = new FilterRegistrationBean(securityFilter);
        registration.setOrder(Integer.MAX_VALUE - 1);
        registration.setName(AbstractSecurityWebApplicationInitializer.DEFAULT_FILTER_NAME);
        return registration;
    }

    @Bean
    public FilterRegistrationBean postAuthorizationFilterRegistrationBean(PostAuthorizationFilter postAuthorizationFilter) {
        FilterRegistrationBean registrationBean = new FilterRegistrationBean();
        registrationBean.setFilter(postAuthorizationFilter);
        registrationBean.setOrder(Integer.MAX_VALUE);
        return registrationBean;
    }

    @Bean
    public ClassLoaderTemplateResolver templateResolver() {
        ClassLoaderTemplateResolver resolver = new ClassLoaderTemplateResolver();
        resolver.setPrefix("templates/");
        resolver.setSuffix(".html");
        resolver.setTemplateMode("HTML");
        resolver.setCharacterEncoding("UTF-8");
        resolver.setOrder(1);
        resolver.setCacheable(false);
        return resolver;
    }

    @Bean
    public ClassLoaderTemplateResolver emailTemplateResolver(){
        ClassLoaderTemplateResolver emailTemplateResolver = new ClassLoaderTemplateResolver();
        emailTemplateResolver.setPrefix("email-templates/");
        emailTemplateResolver.setSuffix(".html");
        emailTemplateResolver.setTemplateMode("HTML");
        emailTemplateResolver.setCharacterEncoding("UTF-8");
        emailTemplateResolver.setOrder(3);
        return emailTemplateResolver;
    }

//    https://stackoverflow.com/questions/47700115/tomcatembeddedservletcontainerfactory-is-missing-in-spring-boot-2
    @Bean
    public ServletWebServerFactory servletContainer() {
        TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory() {
            @Override
            protected void postProcessContext(Context context) {
                SecurityConstraint securityConstraint = new SecurityConstraint();
                securityConstraint.setUserConstraint("CONFIDENTIAL");
                SecurityCollection collection = new SecurityCollection();
                collection.addPattern("/*");
                securityConstraint.addCollection(collection);
                context.addConstraint(securityConstraint);
            }
        };
        tomcat.addAdditionalTomcatConnectors(redirectConnector());
        return tomcat;
    }

    private Connector redirectConnector() {
        Connector connector = new Connector("org.apache.coyote.http11.Http11NioProtocol");
        connector.setScheme("http");
        connector.setPort(9090);
        connector.setSecure(false);
        connector.setRedirectPort(serverPort);
        return connector;
    }

    @Value("${upload.path}")
    private String uploadPath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/img/**")
                .addResourceLocations("file://" + uploadPath + "/");
    }
}