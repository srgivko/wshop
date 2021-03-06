package by.lodochkina.wshop.entities;

import by.lodochkina.wshop.entities.coupons.Coupon;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

@Data
@NoArgsConstructor
@Entity
@Table(name = "orders")
public class Order implements Serializable {

    private static final long serialVersionUID = 5844322797714323404L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String orderNumber;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "order")
    private Set<OrderItem> items;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "cust_id")
    private Customer customer;

    @OneToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "delivery_addr_id")
    private Address deliveryAddress;

    @OneToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "billing_addr_id")
    private Address billingAddress;

    @OneToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "payment_id")
    private Payment payment;

    @Enumerated(EnumType.STRING)
    private OrderStatus status;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_on")
    private Date createdOn;

    @OneToOne
    @JoinColumn(name = "coupon_id")
    private Coupon coupon;

    @Column
    private BigDecimal priceDiscountCoupon;

    public BigDecimal getTotalAmount() {
        BigDecimal amount = new BigDecimal("0.0");
        for (OrderItem item : items) {
            amount = amount.add(item.getTotalPrice());
        }
        if (priceDiscountCoupon != null) {
            amount = amount.subtract(priceDiscountCoupon);
        }
        return amount;
    }
}