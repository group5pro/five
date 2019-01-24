package com.group5.five.web.admin.service;

import com.group5.five.web.admin.utils.BaseResult;
import com.group5.five.web.admin.utils.PageInfo;
import com.group5.five.web.domain.entity.Product;

public interface ProductService {
    PageInfo<Product> page(int draw, int start, int length, Product product);

    Product getTbProductById(Long productId);

    BaseResult save(Product product);

    BaseResult deleteProduct(String ids);
}
