package by.lodochkina.wshop.site.dto;

import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import java.io.Serializable;

@Data
public class OrderDTO implements Serializable {

    private static final long serialVersionUID = -122761727403506118L;

    @NotEmpty(message = "{errors.firstname.required}")
    private String firstName;
    @NotEmpty(message = "{errors.lastname.required}")
    private String lastName;
    @NotEmpty(message = "{errors.email.required}")
    @Email
    private String email;
    @NotEmpty(message = "{errors.phone.required}")
    private String phone;

    @NotEmpty(message = "{errors.address.required}")
    private String addressLine1;
    private String addressLine2;
    @NotEmpty(message = "{errors.city.required}")
    private String city;
    @NotEmpty(message = "{errors.state.required}")
    private String state;
    @NotEmpty(message = "{errors.zipCode.required}")
    private String zipCode;
    @NotEmpty(message = "{errors.country.required}")
    private String country;
}
