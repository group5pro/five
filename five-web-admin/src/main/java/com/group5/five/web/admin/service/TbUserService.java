package com.group5.five.web.admin.service;

import com.group5.five.web.admin.utils.BaseResult;
import com.group5.five.web.admin.utils.PageInfo;
import com.group5.five.web.domain.entity.TbUser;

import java.util.List;

public interface TbUserService {

    BaseResult login(TbUser tbUser);

    TbUser getUserById(Long id);

    BaseResult save(TbUser tbUser);

    List<TbUser> searchTbUsers(TbUser tbUser);

    BaseResult deleteTbUsers(String ids);

    PageInfo<TbUser> page(int draw, int start, int length, TbUser tbUser);
}
