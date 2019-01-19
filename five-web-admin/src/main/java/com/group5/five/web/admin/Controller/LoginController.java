package com.group5.five.web.admin.Controller;

import com.group5.five.web.admin.TbUser;
import com.group5.five.web.admin.service.TbUserService;
import com.group5.five.web.admin.utils.BaseResult;
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
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login(){
        return "login";
    }


    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(TbUser tbUser, HttpServletRequest request, Model model){
        BaseResult result = tbUserService.login(tbUser);
        if (result.getStatus()==200){
            request.getSession().setAttribute("user",result.getData());
            return "redirect:/index";
        }else{
            model.addAttribute("BaseResult",result.getMessage());
            return "login";
        }
    }
}
