package by.lodochkina.wshop.site.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RestorePasswordDto {

    private String code;

    private String password;

    private String password2;
}
