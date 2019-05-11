package com.hwl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hwl.pojo.Student;
import com.hwl.service.StudentService;

@Controller
public class SignUpController {
	@Autowired
	private StudentService studentService;
	
	
	@RequestMapping("signUp")
	public String signUp(Student student,Model model) {
		studentService.signUp(student);
		Student s = studentService.queryById(student.getId());
		model.addAttribute("student", s);
		model.addAttribute("siup", "success");
		return "compl";
	}
	
}
