package by.lodochkina.wshop.entities;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Data
@EqualsAndHashCode
@Entity
@Table(name = "promotions")
public class Promotion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_on")
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'hh:mm:ss")
    private Date createdOn = new Date();

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "send_on")
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'hh:mm:ss")
    private Date sendOn;

    @Column
    private String subject;

    @Column(columnDefinition="text")
    private String content;
}
