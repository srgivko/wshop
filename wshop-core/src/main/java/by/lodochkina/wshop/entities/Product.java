package by.lodochkina.wshop.entities;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.*;

// TODO: 12/8/19 add quantity in stock and some types of products with different prices
@Data
@NoArgsConstructor
@Entity
@Table(name = "products")
@EqualsAndHashCode(exclude = {"imagesUrl", "tags", "unit", "rating", "saleProductSet"})
public class Product implements Serializable {

    private static final long serialVersionUID = -8954674651400832477L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(nullable = false, unique = true)
    @NotEmpty(message = "Model cannot be empty")
    private String sku;

    @Column(nullable = false)
    @NotEmpty(message = "Name cannot be empty")
    private String name;

    @Column(columnDefinition="TEXT")
    private String description;

    @Column(nullable = false)
    @NotNull(message = "price cannot be empty")
    private BigDecimal price = new BigDecimal("0.00");

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "product_image_urls", joinColumns = @JoinColumn(name = "product_id"))
    @Column(name = "image_url")
    private List<String> imagesUrl;

    private boolean disabled;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_on")
    private Date createdOn = new Date();

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "cat_id")
    private Category category;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "unit_id")
    private Unit unit;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "producer_id")
    private Producer producer;

    @ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinTable(
            name = "product_tag",
            joinColumns = {@JoinColumn(name = "PRODUCT_ID", referencedColumnName = "ID")},
            inverseJoinColumns = {@JoinColumn(name = "TAG_ID", referencedColumnName = "ID")})
    private Set<Tag> tags;

    @OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
    private Set<Rating> rating;

    @OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
    private Set<SaleProduct> saleProductSet;

    public long getTotalCountRate() {
        return this.rating.stream().count();
    }

    public double getAvgRating() {
        return this.rating.stream().mapToInt(Rating::getRate).summaryStatistics().getAverage();
    }

    public double getPositivePercentOfCustomers() {
        return this.getTotalCountRate() == 0 ? 100 : (double) this.rating.stream().mapToInt(Rating::getRate).filter(value -> value > 2).count() / this.getTotalCountRate() * 100;
    }

    public BigDecimal getDiscountPrice(){
        if (this.saleProductSet == null) {
            return null;
        }
        Optional<SaleProduct> saleProductOptional = this.saleProductSet.stream().filter(saleProduct -> saleProduct.getSale().isActive()).findFirst();
        return saleProductOptional.isPresent() ? saleProductOptional.get().getDiscountPrice() : null;
    }

    public String getImageUrl() {
        if (this.imagesUrl!=null && !this.imagesUrl.isEmpty()) {
            return this.imagesUrl.get(0);
        }
        return "";
    }
}
