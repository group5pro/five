package com.group5.five.web.admin.service.impl;

import com.group5.five.web.admin.dao.ProductCategoryDao;
import com.group5.five.web.admin.service.ProductCategoryService;
import com.group5.five.web.domain.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductCategoryImpl implements ProductCategoryService {
    @Autowired
    ProductCategoryDao dao;


    @Override
    public List<Category> select() {
        return dao.select();
    }
}
