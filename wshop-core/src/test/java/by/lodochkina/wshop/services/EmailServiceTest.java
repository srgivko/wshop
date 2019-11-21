package by.lodochkina.wshop.services;

import by.lodochkina.wshop.WShopCoreApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = WShopCoreApplication.class)
@TestPropertySource("classpath:application.properties")
public class EmailServiceTest {

    @Autowired
    private EmailService emailService;

    @Test
    public void testSendEmail() {
        this.emailService.send("komocab395@tmail1.com", "WShop - Test Mail", "This is a test email from WShop");
    }

}