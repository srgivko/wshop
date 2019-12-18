package by.lodochkina.wshop.services;

import by.lodochkina.wshop.entities.Customer;

public interface EmailService {
    void send(String emailTo, String subject, String message);

    void sendRegistrationMessage(Customer customer, String urlHostname);

    void sendRestorePassword(Customer customer, String urlHostname);
}
