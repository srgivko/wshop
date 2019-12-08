package by.lodochkina.wshop.entities;

import by.lodochkina.wshop.WShopException;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Data
@NoArgsConstructor
@Entity
@Table(name="customers")
public class Customer implements Serializable {

    private static final long serialVersionUID = -1799900288576015397L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "firstname", nullable = false)
    @NotEmpty
    private String firstName;

    @NotEmpty
    @Column(name = "lastname")
    private String lastName;

    @NotEmpty
    @Email
    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @NotEmpty
    @Column(name = "password", nullable = false)
    private String password;

    @NotEmpty
    private String phone;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_on")
    private Date createdOn = new Date();

    @Column
    private String activationCode;

    @Column
    private Boolean enabled = false;

    @Column
    private Boolean subscribe;

    @ManyToMany(cascade = CascadeType.MERGE)
    @JoinTable(
            name = "customer_product_wishlist",
            joinColumns = {@JoinColumn(name = "CUSTOMER_ID", referencedColumnName = "ID")},
            inverseJoinColumns = {@JoinColumn(name = "PRODUCT_ID", referencedColumnName = "ID")})
    private Set<Product> wishList;

    public void addProductToWishList(Product product) {
        if (this.wishList == null) {
            this.wishList = new HashSet<>();
        }
        this.wishList.add(product);
    }

    public void removeProductToWishList(Product product) {
        if (this.wishList == null) {
            throw new WShopException("You try remove product in empty wishlist");
        }
        this.wishList.remove(product);
    }
}
