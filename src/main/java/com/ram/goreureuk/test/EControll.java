package com.ram.goreureuk.test;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employee")
public class EControll {
	
	@Inject
	private EService service;
	
	@RequestMapping("list")
	public String empLCon(Model model) {
		model.addAttribute("empList",service.getEmployeeList());
		return "list";
	}
	
}
