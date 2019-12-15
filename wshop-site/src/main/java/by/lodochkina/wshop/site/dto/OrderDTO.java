package by.lodochkina.wshop.site.dto;

import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import java.io.Serializable;

@Data
public class OrderDTO implements Serializable {

    private static final long serialVersionUID = -122761727403506118L;

    @NotEmpty(message = "FirstName is required")
    private String firstName;
    @NotEmpty(message = "LastName is required")
    private String lastName;
    @NotEmpty(message = "EmailId is required")
    @Email
    private String emailId;
    @NotEmpty(message = "Phone is required")
    private String phone;

    @NotEmpty(message = "Address Line1 is required")
    private String addressLine1;
    private String addressLine2;
    @NotEmpty(message = "City is required")
    private String city;
    @NotEmpty(message = "State is required")
    private String state;
    @NotEmpty(message = "ZipCode is required")
    private String zipCode;
    @NotEmpty(message = "Country is required")
    private String country;
}
