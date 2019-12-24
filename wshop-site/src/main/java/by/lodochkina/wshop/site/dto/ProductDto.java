package by.lodochkina.wshop.site.dto;

import by.lodochkina.wshop.entities.Product;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
public class ProductDto {

    private Long id;
    private String name;
    private BigDecimal price;
    private String message;

    public static ProductDto createProductDto(Product product, String message) {
        ProductDto productDto = new ProductDto();
        productDto.id = product.getId();
        productDto.name = product.getName();
        productDto.price = product.getDiscountPrice()==null ? product.getPrice() : product.getDiscountPrice();
        productDto.message = message;
        return productDto;
    }
}
