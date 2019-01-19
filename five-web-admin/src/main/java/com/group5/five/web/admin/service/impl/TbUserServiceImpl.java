package com.group5.five.web.admin.service.impl;

import com.group5.five.web.admin.TbUser;
import com.group5.five.web.admin.dao.TbUserDao;
import com.group5.five.web.admin.service.TbUserService;
import com.group5.five.web.admin.utils.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TbUserServiceImpl implements TbUserService {
    @Autowired
    TbUserDao dao;


    @Override
    public BaseResult login(TbUser tbUser) {
        BaseResult baseResult;
        TbUser user = dao.cheakUserName(tbUser);
        if(user!=null){
            if(tbUser.getPassword().equals(user.getPassword())){
                baseResult = BaseResult.success("登录成功",user);
            }else {
                baseResult = BaseResult.fail("输入的密码错误!");
            }
        }
        baseResult = BaseResult.fail("登录失败");
        return baseResult;
    }
}
