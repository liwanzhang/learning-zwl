package com.tanceng.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping("tanceng")
public class TanCengController {
    //抢购信息列表页
    @RequestMapping(value = "facebox",method = {RequestMethod.GET, RequestMethod.POST})
    public String tc() {
        
        return "/tanceng/facebox";
    }

    @RequestMapping(value = "/facebox/tanchu", method = RequestMethod.GET)
    public String create(ModelMap model) {
        
        return "/tanceng/tanchu";
    }
    @RequestMapping(value = "tc",method = {RequestMethod.GET, RequestMethod.POST})
    public String tc1() {
        
        return "/tc/tc";
    }
}
