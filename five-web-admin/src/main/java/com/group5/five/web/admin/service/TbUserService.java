package com.group5.five.web.admin.service;

import com.group5.five.web.admin.utils.BaseResult;
import com.group5.five.web.domain.entity.TbUser;

public interface TbUserService {

    BaseResult login(TbUser tbUser);
}
