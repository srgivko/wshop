package by.lodochkina.wshop.entities;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

@Data
@NoArgsConstructor
@Entity
@Table(name = "categories")
@EqualsAndHashCode(exclude = {"products", "childCategories", "parentCategory", "tags"})
@ToString(exclude = {"products", "childCategories", "parentCategory"})
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    @NotEmpty(message = "Name cannot be empty")
    private String name;

    @Column(length = 1024)
    private String description;

    @Column(name = "disp_order")
    private Integer displayOrder;

    @Column
    private String imageUrl;

    private boolean disabled;

    @OneToMany(mappedBy = "category")
    private Set<Product> products;

    @ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinTable(
            name = "category_tag",
            joinColumns = {@JoinColumn(name = "CATEGORY_ID", referencedColumnName = "ID")},
            inverseJoinColumns = {@JoinColumn(name = "TAG_ID", referencedColumnName = "ID")})
    private Set<Tag> tags;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "parent_cat_id")
    private Category parentCategory;

    @OneToMany(mappedBy = "parentCategory", fetch = FetchType.EAGER)
    private Set<Category> childCategories = new HashSet<>();


    public Set<Product> getProductsNotDisable() {
        return this.getProducts().stream().filter(product -> !product.isDisabled()).collect(Collectors.toSet());
    }
}
