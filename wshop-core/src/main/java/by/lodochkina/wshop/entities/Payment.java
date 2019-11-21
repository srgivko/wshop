package by.lodochkina.wshop.entities;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

@Data
@NoArgsConstructor
@Entity
@Table(name = "payments")
public class Payment implements Serializable {

    private static final long serialVersionUID = 2961220314804031361L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "cc_number")
    private String ccNumber;

    private String cvv;

    private BigDecimal amount;

}
