package com.hwl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hwl.pojo.Admin;
import com.hwl.service.AdminService;

@Controller
public class SAupdateController {

	@Autowired
	private AdminService adminService;

	@RequestMapping("saUpdate")
	public String saUpdate(Admin admin, ModelMap model) {
		if (admin.getPassword() == null) {
			adminService.updateLevel(admin);
			model.addAttribute("succ", "success");
		} else {
			if(admin.getPassword().matches("^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,}$")) {
				adminService.updateAdmin(admin);
				model.addAttribute("succ", "success");
			}else {
				model.addAttribute("fal", "false");
			}
		}
		Admin a = adminService.queryAdminById(admin.getId());
		model.addAttribute("admin", a);
		return "saupdate";
	}
}
