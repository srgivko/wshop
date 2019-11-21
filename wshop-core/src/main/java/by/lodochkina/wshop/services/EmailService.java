package by.lodochkina.wshop.services;


public interface EmailService {
    void send(String emailTo, String subject, String message);
}
