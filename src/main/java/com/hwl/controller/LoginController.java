package com.hwl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hwl.pojo.Admin;
import com.hwl.pojo.Student;
import com.hwl.service.AdminService;
import com.hwl.service.StudentService;
import com.hwl.util.Encoding;

@SessionAttributes(value= {"id","level"})
@Controller
public class LoginController {
	@Autowired
	private StudentService studentService;

	@Autowired
	private AdminService adminService;

	@RequestMapping("isLogin")
	public String isLogin(Student student, Model model) {
		model.addAttribute("id", student.getId());
		String id = student.getId();
		String password = student.getPassword();
		Encoding encode = new Encoding();
		Admin admin = adminService.queryAdminById(id);
		if (admin != null) {
			if (encode.md5Encoding(password).equals(admin.getPassword())) {
				model.addAttribute("level", admin.getLevel());
				return "amain";
			} else {
				model.addAttribute("fault", "exist");
				return "login";
			}
		} else {
			int count = studentService.isStudent(student);
			student = studentService.queryById(student.getId());
			model.addAttribute("student", student);
			if (count > 0) {
				return "smain";
			} else {
				model.addAttribute("fault", "exist");
				return "login";
			}
		}
	}
}
