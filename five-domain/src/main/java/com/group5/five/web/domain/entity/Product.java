package com.group5.five.web.domain.entity;

import lombok.Data;

import java.io.Serializable;
@Data
public class Product implements Serializable {
    private Long productId;
    private String productName;
    private String productPicture;
    private Double originPrice;
    private Double discountPrice;
    private int commentNum;
    private int salesNum;
    private Long parentId;
    
}
