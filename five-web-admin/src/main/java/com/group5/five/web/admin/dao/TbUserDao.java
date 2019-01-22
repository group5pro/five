package com.group5.five.web.admin.dao;

import com.group5.five.web.domain.entity.TbUser;

import java.util.List;
import java.util.Map;

public interface TbUserDao {
   TbUser cheakUserName(TbUser tbUser);

   void deleteTbUsers(String[] ids_arr);


   void insertTbUser(TbUser tbUser);

   void updateTbUser(TbUser tbUser);

   List<TbUser> selectBySearch(TbUser tbUser);

   int count(TbUser tbUser);

   List<TbUser> selectByPage(Map<String, Object> map);

   TbUser selectByid(Long id);
}
