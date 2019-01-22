package com.group5.five.web.domain.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class Category implements Serializable {

    private Long categoryId;
    private Category parent;
    private String categoryName;
    private Long parentId;
    private Boolean isParent;
}
