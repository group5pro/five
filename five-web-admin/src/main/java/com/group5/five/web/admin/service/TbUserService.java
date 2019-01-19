package com.group5.five.web.admin.service;

import com.group5.five.web.admin.TbUser;
import com.group5.five.web.admin.utils.BaseResult;

public interface TbUserService {

    BaseResult login(TbUser tbUser);
}
