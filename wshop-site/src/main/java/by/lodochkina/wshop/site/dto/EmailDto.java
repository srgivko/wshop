package by.lodochkina.wshop.site.dto;

import lombok.Data;

import javax.validation.constraints.Email;

@Data
public class EmailDto {
    @Email(message = "{errors.invalid_email}")
    private String email;
    private String message;
}
