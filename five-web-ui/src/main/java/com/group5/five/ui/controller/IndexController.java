package com.group5.five.ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class IndexController {

    @RequestMapping(value={"","index"},method = RequestMethod.GET)
    public String index(Model model){
        return "index";
    }
}
