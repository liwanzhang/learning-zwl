package com.letv.shop.activity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping("tc")
public class TcController {
    //抢购信息列表页
    @RequestMapping(value = "",method = {RequestMethod.GET, RequestMethod.POST})
    public String tc() {
        
        return "/tc/list";
    }

    @RequestMapping(value = "/create/{rushType}", method = RequestMethod.GET)
    public String create(ModelMap model,@PathVariable("rushType") Byte rushType) {
        
        return "/tc/create"+rushType;
    }
    //抢购信息列表页
    @RequestMapping(value = "tc",method = {RequestMethod.GET, RequestMethod.POST})
    public String tc1() {
        
        return "/tc/tc";
    }
}
