package com.group5.five.web.admin.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
    //get请求到首页
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String index(){
        return "index";
    }
}
