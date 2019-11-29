package by.lodochkina.wshop.services;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.entities.Customer;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service
@Slf4j
public class EmailServiceImpl implements EmailService {

    private static final String REGISTER_MESSAGE_FORMAT = "%s/activate/%s";
    private static final String FORGET_MESSAGE_FORMAT = "%s/login/forget/%s";
    private static final String REGISTER_SUBJECT = "Activation code for registration";
    private static final String FORGET_SUBJECT = "Activation code for restore password";

    @Value("${spring.mail.username}")
    private String username;

    private final JavaMailSender javaMailSender;

    @Autowired
    public EmailServiceImpl(@Qualifier("myMailSender") JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    @Override
    public void send(String to, String subject, String content) {
        try {
            final MimeMessage mimeMessage = this.javaMailSender.createMimeMessage();
            final MimeMessageHelper message = new MimeMessageHelper(mimeMessage, "UTF-8");
            message.setSubject(subject);
            message.setFrom(username);
            message.setTo(to);
            message.setText(content, true);
            javaMailSender.send(message.getMimeMessage());
            log.info(String.format("Success send message to user with email [%s]", to));
        } catch (MailException | MessagingException ex) {
            log.error("mailError", ex);
            throw new WShopException("Unable to send email");
        }
    }

    @Override
    public void sendRegistrationMessage(Customer customer, String urlHostname) {
        String message = String.format(REGISTER_MESSAGE_FORMAT, urlHostname, customer.getActivationCode());
        this.send(customer.getEmail(), REGISTER_SUBJECT, message);
    }

    @Override
    public void sendRestorePassword(Customer customer, String urlHostname) {
        String message = String.format(FORGET_MESSAGE_FORMAT, urlHostname, customer.getActivationCode());
        this.send(customer.getEmail(), FORGET_SUBJECT, message);
    }
}