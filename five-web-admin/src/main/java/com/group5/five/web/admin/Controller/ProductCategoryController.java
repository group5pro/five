package com.group5.five.web.admin.Controller;

import com.group5.five.web.admin.service.ProductCategoryService;
import com.group5.five.web.domain.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("product")
public class ProductCategoryController {
    @Autowired
    ProductCategoryService service;

    @RequestMapping(value = "category", method = RequestMethod.GET)
    public String category(Model model) {
        List<Category> target = new ArrayList<>();
        List<Category> sources = service.select();
        sortList(sources, target, 0L);
        model.addAttribute("categorys", target);
        return "product_category";
    }

    private void sortList(List<Category> sources, List<Category> target, long parentId) {
        for (Category category : sources) {
            if (category.getParent().getCategoryId().equals(parentId)) {
                target.add(category);
                if (category.getIsParent()) {
                    for (Category source : sources) {
                        if (source.getParent().getCategoryId().equals(category.getCategoryId())) {
                            sortList(sources, target, category.getCategoryId());
                            break;
                        }
                    }
                }
            }
        }
    }


}
