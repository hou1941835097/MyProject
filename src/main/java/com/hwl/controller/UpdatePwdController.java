package com.hwl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hwl.pojo.Admin;
import com.hwl.service.AdminService;

@Controller
public class UpdatePwdController {

	@Autowired
	private AdminService adminService;

	@RequestMapping("AupdatePwd")
	public String updatePwd(Admin admin, ModelMap model) {
		if (admin.getPassword().matches("^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,}$")) {
			adminService.updatePwd(admin);
			model.addAttribute("suc", "success");
			return "aupwd";
		} else {
			model.addAttribute("false", "false");
			return "aupwd";
		}
	}

}
