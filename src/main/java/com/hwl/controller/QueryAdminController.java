package com.hwl.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hwl.pojo.Admin;
import com.hwl.service.AdminService;
@Controller
public class QueryAdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("queryAllAdmin")
	public String queryAll(@RequestParam(required=true,defaultValue="1") Integer page,Model model) {
		PageHelper.startPage(page,6);
		List<Admin>	admins = adminService.queryAllAdmin();
		PageInfo<Admin> p=new PageInfo<Admin>(admins);
		model.addAttribute("page", p);
		model.addAttribute("admins", admins);
		return "showAllAdmin";
	}
	
}
