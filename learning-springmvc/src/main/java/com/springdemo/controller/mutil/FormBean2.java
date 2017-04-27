package com.springdemo.controller.mutil;

public class FormBean2 {
	
	private FormBean1 formBean1;
	
	private Integer id;
	
	private String code;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public FormBean1 getFormBean1() {
		return formBean1;
	}

	public void setFormBean1(FormBean1 formBean1) {
		this.formBean1 = formBean1;
	}

}
