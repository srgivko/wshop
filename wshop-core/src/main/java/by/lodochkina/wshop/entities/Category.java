package by.lodochkina.wshop.entities;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.util.Set;

@Data
@NoArgsConstructor
@Entity
@Table(name = "categories")
@EqualsAndHashCode(exclude = {"products"})
@ToString(exclude = {"products"})
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

    private boolean disabled;

    @OneToMany(mappedBy = "category")
    private Set<Product> products;

    @ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinTable(
            name = "category_tag",
            joinColumns = {@JoinColumn(name = "CATEGORY_ID", referencedColumnName = "ID")},
            inverseJoinColumns = {@JoinColumn(name = "TAG_ID", referencedColumnName = "ID")})
    private Set<Tag> tags;
}
