package com.hwl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hwl.pojo.Student;
import com.hwl.service.StudentService;

@SessionAttributes(value = { "studentid", "spage", "col", "id", "email", "staus" })
@Controller
public class QueryStudentController {

	@Autowired
	private StudentService studentService;

	// ByCol
	@RequestMapping("queryById")
	public String queryById(@RequestParam("studentid") String id, @RequestParam("spage") int page,
			@RequestParam("col") String col, ModelMap model) {
		Student student = studentService.queryById(id);
		model.clear();
		model.addAttribute("studentid", id);
		model.addAttribute("col", col);
		model.addAttribute("spage", page);
		model.addAttribute("student", student);
		model.addAttribute("email", student.getEmail());
		return "studentInfo";
	}

	@RequestMapping("queryAllStudent")
	public String queryAll(@RequestParam(required = true, defaultValue = "1") Integer page, HttpServletRequest request,
			ModelMap model) {
		String staus = request.getParameter("staus");
		PageHelper.startPage(page, 10);
		List<Student> students = null;
		model.clear();
		if ("yes".equals(staus)) {
			students = studentService.allSignUp();
			model.addAttribute("staus", staus);
			model.addAttribute("staus", request.getParameter("staus"));
		} else {
			model.addAttribute("staus", "no");
			students = studentService.queryAll();
		}
		PageInfo<Student> p = new PageInfo<Student>(students);
		model.addAttribute("page", p);
		model.addAttribute("students", students);
		return "showAll";
	}

	@RequestMapping("queryByCo")
	public String queryByCo(@RequestParam("col") String col,
			@RequestParam(required = true, defaultValue = "1") Integer page, ModelMap model) {
		PageHelper.startPage(page, 10);
		List<Student> students = studentService.queryByCo(col);
		model.clear();
		PageInfo<Student> p = new PageInfo<Student>(students);
		model.addAttribute("col", col);
		model.addAttribute("page", p);
		model.addAttribute("students", students);
		return "byCol";

	}
	
	@RequestMapping("queryById2")
	public String queryById2(@RequestParam("studentid") String id, @RequestParam("spage") int page,	HttpServletRequest request, ModelMap model) {
		String staus = request.getParameter("staus");
		Student student = studentService.queryById(id);
		model.clear();
		if ("yes".equals(staus)) {
			model.addAttribute("staus", staus);
		}
		model.addAttribute("studentid", id);
		model.addAttribute("spage", page);
		model.addAttribute("student", student);
		model.addAttribute("email", student.getEmail());
		return "studentInfo";
	}

}
