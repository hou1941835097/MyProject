package com.hwl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hwl.pojo.Admin;
import com.hwl.pojo.Face;
import com.hwl.pojo.Student;
import com.hwl.pojo.TestInfo;
import com.hwl.service.AdminService;
import com.hwl.service.StudentService;
import com.hwl.util.TimeCompare;

@SessionAttributes(value= {"ac","staus"})
@Controller
public class TransferController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private StudentService studentService;
	
	@RequestMapping("transfer")
	public String transfer(@RequestParam("adminid") String id,ModelMap model) {
		Admin admin = adminService.queryAdminById(id);
		model.addAttribute("admin", admin);
		return "saupdate";
	}
	
	@RequestMapping("stransfer")
	public String stransfer(HttpServletRequest request ,ModelMap model) {
		String id = (String) request.getSession().getAttribute("id");
		Student student = studentService.queryById(id);
		model.addAttribute("student", student);
		return "compl";
	}
	
	@RequestMapping("etransfer")
	public String etransfer(HttpServletRequest request ,ModelMap model) throws Exception {
		new TimeCompare();
		String id = (String) request.getSession().getAttribute("id");
		Student student = studentService.queryById(id);
		if(student.getTextid()!=null) {
			TestInfo ti = adminService.selectInfoById(student.getTextid());
			String[] ts = ti.getTime().split("-");
			boolean flag1 = TimeCompare.compareDate(TimeCompare.getCurTime(),ti.getDate()+" "+ ts[0]);
			boolean flag2 = TimeCompare.compareDate(TimeCompare.getCurTime(),ti.getDate()+" "+ ts[1]);
			model.addAttribute("flag1", flag1);
			model.addAttribute("flag2", flag2);
			model.addAttribute("testInfo", adminService.selectInfoById(student.getTextid()));
		}
		if(request.getParameter("sta")!=null) {
			model.addAttribute("sta", request.getParameter("sta"));
		}
		if(request.getParameter("statu")!=null) {
			model.addAttribute("statu", request.getParameter("statu"));
		}
		
		if(student.getFaceid()!=null) {
			model.addAttribute("face", adminService.selectFaceById(student.getFaceid()));
		}
		model.addAttribute("student", student);
		return "examInfo";
	}
	
	@RequestMapping("showFace")
	public String showFace(HttpServletRequest request,ModelMap model) {
		model.addAttribute("sta", request.getParameter("sta"));
		List<Face> faces = adminService.showFace();
		model.addAttribute("faces", faces);
		return "allfaces";
	}
	
	@RequestMapping("showMessage")
	public String showMessage(HttpServletRequest request,ModelMap model) {
		String id = (String)request.getSession().getAttribute("id");
		Student student = studentService.queryById(id);
		model.addAttribute("student", student);
		return "message";
	}
	
	@RequestMapping("showWrite")
	public String showWrite(HttpServletRequest request,ModelMap model) {
		model.addAttribute("statu", request.getParameter("statu"));
		List<TestInfo> tests = adminService.showWrite();
		model.addAttribute("tests", tests);
		return "alltests";
	}
	
	@RequestMapping("ashowTest")
	public String ashowTest(HttpServletRequest request,ModelMap model) {
		String ye = request.getParameter("yes");
		if("yes".equals(ye)) {
			model.addAttribute("yes", ye);
		}
		List<TestInfo> tests = adminService.showWrite();
		model.addAttribute("tests", tests);
		return "atext";
	}
	
	@RequestMapping("toshowAll")
	public String toshowAll(ModelMap model) {
		model.addAttribute("staus", "no");
		return "redirect:/queryAllStudent";
	}
	
}
