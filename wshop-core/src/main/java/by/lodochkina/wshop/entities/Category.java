package by.lodochkina.wshop.entities;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.util.Set;

@Data
@NoArgsConstructor
@Entity
@Table(name = "categories")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(nullable = false, unique = true)
    @NotEmpty
    private String name;

    @Column(length = 1024)
    private String description;

    @Column(name = "disp_order")
    private Integer displayOrder;

    private boolean disabled;

    @OneToMany(mappedBy = "category")
    private Set<Product> products;
}
