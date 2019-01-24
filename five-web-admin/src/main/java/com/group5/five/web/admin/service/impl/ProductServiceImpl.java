package com.group5.five.web.admin.service.impl;

import com.group5.five.commons.validator.utils.BeanValidator;
import com.group5.five.web.admin.dao.ProductDao;
import com.group5.five.web.admin.service.ProductService;
import com.group5.five.web.admin.utils.BaseResult;
import com.group5.five.web.admin.utils.PageInfo;
import com.group5.five.web.domain.entity.Product;
import org.apache.commons.lang3.StringUtils;
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
        Map<String, Object> map = new HashMap<>();
        map.put("start", start);
        map.put("length", length);
        map.put("product", product);
        pageInfo.setData(dao.selectByPage(map));
        return pageInfo;
    }

    @Override
    public BaseResult save(Product product) {
        String validator = BeanValidator.validator(product);
        BaseResult baseResult = null;
        if (validator == null) {
            //验证通过
            //新增内容
            if (product.getProductId() == null) {
                dao.insertProduct(product);

            } else {
                //编辑内容
                dao.updateProduct(product);

            }
            baseResult = BaseResult.success("保存内容成功");
        } else {
            //验证不通过
            baseResult = BaseResult.fail(validator);
        }


        return baseResult;
    }


    @Override
    public BaseResult deleteProduct(String ids) {
        BaseResult baseResult = null;
        //验证ids不为空
        if (StringUtils.isNotBlank(ids)) {
            String[] ids_arr = ids.split(",");
            dao.deleteProduct(ids_arr);
            baseResult = BaseResult.success("删除成功");
        } else {
            baseResult = BaseResult.fail("删除失败");
        }
        return baseResult;
    }

    public int count(Product product) {
        return dao.count(product);
    }

    @Override
    public Product getTbProductById(Long productId) {

        return dao.selectById(productId);
    }


}
