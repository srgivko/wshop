package by.lodochkina.wshop.entities;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

@Data
@NoArgsConstructor
@Entity
@Table(name = "order_items")
@ToString(exclude = {"order"})
@EqualsAndHashCode(exclude = {"order"})
public class OrderItem implements Serializable {

    private static final long serialVersionUID = 8364702588264579499L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    private BigDecimal totalPrice;

    private int quantity;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;

}