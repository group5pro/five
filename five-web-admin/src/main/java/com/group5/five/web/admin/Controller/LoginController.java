package com.group5.five.web.admin.Controller;

import com.group5.five.web.admin.service.TbUserService;
import com.group5.five.web.admin.utils.BaseResult;
import com.group5.five.web.domain.entity.TbUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {
    @Autowired
    TbUserService tbUserService;

    //get请求到登录
    @RequestMapping(value = {"","login"}, method = RequestMethod.GET)
    public String login(){
        return "login";
    }

    //进行登录验证返回用户登录时的状态信息
    //登录成功返回user来到首页
    //登录失败返回BaseResult回到登录页
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(TbUser tbUser, HttpServletRequest request, Model model){
        BaseResult result = tbUserService.login(tbUser);
        if (result.getStatus()==200){
            request.getSession().setAttribute("user",result.getData());
            return "redirect:/index";
        }else{
            model.addAttribute("BaseResult",result);
            return "login";
        }
    }


    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "login";
    }

    //get请求到首页
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String index(){
        return "index";
    }

}
