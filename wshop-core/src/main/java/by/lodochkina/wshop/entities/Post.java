package by.lodochkina.wshop.entities;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Date;

@Data
@EqualsAndHashCode
@Entity
@NoArgsConstructor
@Builder
@AllArgsConstructor
@Table(name = "posts")
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    @NotBlank(message = "Title cannot be empty")
    private String title;

    @Column
    @NotBlank(message = "Description cannot be empty")
    private String description;

    @Column
    @NotBlank(message = "imgTitle cannot be empty")
    private String imgTitle;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_on")
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'hh:mm:ss")
    private Date createOn = new Date();

    @Column(columnDefinition="text")
    private String content;
}
