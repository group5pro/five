package com.group5.five.web.admin.service.impl;

import com.group5.five.commons.validator.utils.BeanValidator;
import com.group5.five.web.admin.dao.TbUserDao;
import com.group5.five.web.admin.service.TbUserService;
import com.group5.five.web.admin.utils.BaseResult;
import com.group5.five.web.admin.utils.PageInfo;
import com.group5.five.web.domain.entity.TbUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TbUserServiceImpl implements TbUserService {
    @Autowired
    TbUserDao dao;


    @Override
    public BaseResult login(TbUser tbUser) {
        BaseResult baseResult;
        TbUser user = dao.cheakUserName(tbUser);
        if (user != null) {
            if (DigestUtils.md5DigestAsHex(tbUser.getPassword().getBytes()).equals(user.getPassword())) {
                baseResult = BaseResult.success("登录成功", user);
                return baseResult;
            } else {
                baseResult = BaseResult.fail("输入的密码错误!");
                return baseResult;
            }
        }
        baseResult = BaseResult.fail("登录失败");
        return baseResult;
    }


    @Override
    public BaseResult save(TbUser tbUser) {
        String validator = BeanValidator.validator(tbUser);
        BaseResult baseResult = null;
        if (validator == null) {
            //新增用户
            if (tbUser.getId() == null) {
                tbUser.setPassword(DigestUtils.md5DigestAsHex(tbUser.getPassword().getBytes()));
                tbUser.setCreated(new Date());
                tbUser.setUpdated(new Date());
                dao.insertTbUser(tbUser);
                baseResult = BaseResult.success("新增用户成功");

            } else {
                //编辑用户
                dao.updateTbUser(tbUser);
                baseResult = BaseResult.success("编辑用户成功");

            }

        } else {
            baseResult = BaseResult.fail(validator);
        }
        return baseResult;
    }

    @Override
    public List<TbUser> searchTbUsers(TbUser tbUser) {

        List<TbUser> tbUsers = dao.selectBySearch(tbUser);
        return tbUsers;
    }

    @Override
    public BaseResult deleteTbUsers(String ids) {
        BaseResult baseResult = null;
        //验证ids不为空
        if (StringUtils.isNotBlank(ids)) {
            String[] ids_arr = ids.split(",");
            dao.deleteTbUsers(ids_arr);
            baseResult = BaseResult.success("删除成功");
        } else {
            baseResult = BaseResult.fail("删除失败");
        }
        return baseResult;

    }

    @Override
    public PageInfo<TbUser> page(int draw, int start, int length, TbUser tbUser) {
        PageInfo<TbUser> pageInfo = new PageInfo<>();
        int count = dao.count(tbUser);
        pageInfo.setDraw(draw);
        pageInfo.setRecordsTotal(count);
        pageInfo.setRecordsFiltered(count);
        Map<String, Object> map = new HashMap<>();
        map.put("start", start);
        map.put("length", length);
        //搜索条件是在tbUser内，把tbUser封装在map中
        map.put("tbUser", tbUser);
        pageInfo.setData(dao.selectByPage(map));
        return pageInfo;
    }

    public int count(TbUser tbUser) {
        return dao.count(tbUser);
    }

    @Override
    public TbUser getUserById(Long id) {
        return dao.selectByid(id);
    }


    /**
     * 验证表单数据
     *
     * @param tbUser
     * @return BaseResult对象
     */
    public BaseResult checkUser(TbUser tbUser) {
        BaseResult baseResult = BaseResult.success();
        if (StringUtils.isBlank(tbUser.getUsername())) {
            baseResult = BaseResult.fail("用户名不能为空，请重写填写");
        } else if (StringUtils.isBlank(tbUser.getPassword())) {
            baseResult = BaseResult.fail("密码不能为空，请重写填写");
        } else if (StringUtils.isBlank(tbUser.getPhone())) {
            baseResult = BaseResult.fail("电话不能为空，请重写填写");
        } else if (StringUtils.isBlank(tbUser.getEmail())) {
            baseResult = BaseResult.fail("邮箱不能为空，请重写填写");
        }

        return baseResult;
    }
}
