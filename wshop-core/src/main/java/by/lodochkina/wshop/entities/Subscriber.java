package by.lodochkina.wshop.entities;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.Email;

@Data
@ToString
@Entity
@Table(name = "subscribers")
public class Subscriber {

    @Id
    @Email
    private String email;

    @Column
    private String removeCode;
}
