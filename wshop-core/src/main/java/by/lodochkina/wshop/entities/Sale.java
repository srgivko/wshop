package by.lodochkina.wshop.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@Data
@Entity
@Table(name = "sales")
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class Sale {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String name;

    @Column
    private String promoCode;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'hh:mm:ss")
    private Date beginDate = new Date();

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'hh:mm:ss")
    private Date endDate = new Date();

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "sale" , orphanRemoval = true)
    private Set<SaleProduct> saleProductList;

    public boolean isActive() {
        Date now = new Date();
        return now.after(beginDate) && now.before(endDate);
    }

    public void addSaleProduct(SaleProduct saleProduct) {
        if (this.saleProductList == null) {
            this.saleProductList = new HashSet<>();
        }
        Optional<SaleProduct> ifExistSaveProduct = this.saleProductList.stream()
                .filter(sp -> sp.getProduct().getId().equals(saleProduct.getProduct().getId())).findFirst();
        ifExistSaveProduct.ifPresent(sp -> this.saleProductList.remove(sp));
        this.getSaleProductList().add(saleProduct);
        saleProduct.setSale(this);
    }

}
