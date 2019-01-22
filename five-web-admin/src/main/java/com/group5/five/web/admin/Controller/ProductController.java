package com.group5.five.web.admin.Controller;

import com.group5.five.web.admin.service.ProductService;
import com.group5.five.web.admin.utils.PageInfo;
import com.group5.five.web.domain.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("product")
public class ProductController {
    @Autowired
    ProductService service;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list() {
        return "product_list";
    }


    @ResponseBody
    @RequestMapping(value = "page", method = RequestMethod.GET)
    public PageInfo<Product> page(int draw, int start, int length, Product product) {
        System.out.println(product);
        PageInfo<Product> pageInfo = service.page(draw, start, length, product);
        return pageInfo;
    }


}
