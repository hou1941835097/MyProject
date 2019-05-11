package com.hwl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hwl.pojo.Admin;
import com.hwl.service.AdminService;

@Controller
public class AddAdminController {
	
	@Autowired
	private AdminService adminService;
	
	
	@RequestMapping("addAdmin")
	public String addAdmin(Admin admin,ModelMap model) {
		Admin a = adminService.queryAdminById(admin.getId());
		if(a==null) {
			if(admin.getId().matches("^\\d{8}")) {
				if(admin.getPassword().matches("^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,}$")) {
					model.addAttribute("succe", "success");
					adminService.addAdmin(admin);
					return "addAdmin";
				}else {
					model.addAttribute("pafault", "fault");
					return "addAdmin";
				}
			}else {
				model.addAttribute("idfault", "fault");
				return "addAdmin";
			}
		}else {
			model.addAttribute("exist", "yes");
			return "addAdmin";
		}
		
	}
	
}
