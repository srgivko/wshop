package by.lodochkina.wshop.entities;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "permissions")
@Data
@ToString(exclude = "roles")
@NoArgsConstructor
public class Permission {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String name;

    @Column(length = 1024)
    private String description;

    @ManyToMany(mappedBy = "permissions")
    private List<Role> roles;
}
