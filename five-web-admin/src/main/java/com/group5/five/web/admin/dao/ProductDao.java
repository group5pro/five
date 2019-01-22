package com.group5.five.web.admin.dao;

import com.group5.five.web.domain.entity.Product;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ProductDao {

    int count(Product product);

    List<Product> selectByPage(Map<String, Object> map);
}