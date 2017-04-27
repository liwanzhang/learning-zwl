package com.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.domain.AnotherVO;
import com.test.domain.SingleVO;
import com.test.domain.TestVO;

@Controller
@RequestMapping("test")
public class TestController {
	
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(ModelMap model) {
        
        return "/test/create";
    }
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(ModelMap model, TestVO t, AnotherVO a) {
    	t.setId(111);
    	a.setAge("120");
    	model.addAttribute("t", t);
    	model.addAttribute("a", a);
    	
        return "/test/create";
    }
    @RequestMapping(value = "/single", method = RequestMethod.GET)
    public String single() {
        return "/test/single";
    }
    @RequestMapping(value = "/single", method = RequestMethod.POST)
    public String single(SingleVO s) {
    	
        return "/test/single";
    }    

}
