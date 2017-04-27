package com.springdemo.controller.mutil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/demo/formbean")
public class FormBeanController {
	
    @RequestMapping("/edit12")
    public String index(){
        return "edit12";
    }	

	@InitBinder("formBean1")
    public void initBinderFormBean1(WebDataBinder binder) {  
		binder.setFieldDefaultPrefix("formBean1.");  
    }
	@InitBinder("formBean2")
    public void initBinderFormBean2(WebDataBinder binder) {  
		binder.setFieldDefaultPrefix("formBean2.");  
    }
	@RequestMapping("/save12")
	@ResponseBody
	public ModelAndView save12(FormBean1 formBean1, FormBean2 formBean2){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/demo/formbean/edit12/"+formBean2.getId());
		return mav;
	}
	
}