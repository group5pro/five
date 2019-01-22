package com.group5.five.web.admin.dao;
import com.group5.five.web.domain.entity.Category;

import java.util.List;

public interface ProductCategoryDao {
    List<Category> select();
}
