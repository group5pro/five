package com.group5.five.web.admin.service.impl;

import com.group5.five.web.admin.dao.ProductDao;
import com.group5.five.web.admin.service.ProductService;
import com.group5.five.web.admin.utils.PageInfo;
import com.group5.five.web.domain.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductDao dao;

    @Override
    public PageInfo<Product> page(int draw, int start, int length, Product product) {
        PageInfo<Product> pageInfo = new PageInfo<>();
        int count = dao.count(product);
        pageInfo.setDraw(draw);
        pageInfo.setRecordsTotal(count);
        pageInfo.setRecordsFiltered(count);
        Map<String,Object> map = new HashMap<>();
        map.put("start",start);
        map.put("length",length);
        map.put("product",product);
        pageInfo.setData(dao.selectByPage(map));
        return pageInfo;
    }
}
