package by.lodochkina.wshop.entities;

import lombok.Data;
import lombok.ToString;
import org.hibernate.exception.DataException;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Email;
import java.util.Date;

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

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'hh:mm:ss")
    private Date subscribedOn = new Date();
}
