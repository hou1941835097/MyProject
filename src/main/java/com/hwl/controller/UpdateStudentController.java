package com.hwl.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hwl.pojo.Face;
import com.hwl.pojo.Student;
import com.hwl.pojo.TestInfo;
import com.hwl.service.AdminService;
import com.hwl.service.StudentService;
import com.hwl.util.Encoding;
import com.hwl.util.TimeCompare;

@Controller
public class UpdateStudentController {

	@Autowired
	private StudentService studentService;

	@Autowired
	private AdminService adminService;

	@RequestMapping("updateStudent")
	public String update(Student student, HttpServletRequest request, Model model) {
		student.setId((String) request.getSession().getAttribute("id"));
		studentService.uspdate(student);
		Student s = studentService.queryById((String) request.getSession().getAttribute("id"));
		model.addAttribute("student", s);
		return "compl";
	}

	@RequestMapping("aupdateStudent")
	public String aupdateStudent(Student student,HttpServletRequest request, ModelMap model) {
		String staus = request.getParameter("staus");
		if("yes".equals(staus)) {
			model.addAttribute("staus", "yes");
		}
		studentService.update(student);
		Student s = studentService.queryById(student.getId());
		model.addAttribute("student", s);
		model.addAttribute("su", "su");
		return "studentInfo";
	}

	@RequestMapping("asupdatePwd")
	public String asupdatePwd(Student student,HttpServletRequest request, ModelMap model) {
		String staus = request.getParameter("staus");
		if (student.getPassword().matches("^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,}$")) {
			studentService.supdatePwd(student);
			model.addAttribute("success", "success");
			if("yes".equals(staus)) {
				model.addAttribute("staus", "yes");
			}
			return "asupwd";
		} else {
			model.addAttribute("failure", "yes");
			if("yes".equals(staus)) {
				model.addAttribute("staus", "yes");
			}
			return "asupwd";
		}
	}

	@RequestMapping("suppwd")
	public String suppwd(@RequestParam("opwd") String opwd, @RequestParam("npwd") String npwd,
			@RequestParam("tpwd") String tpwd, HttpServletRequest request, ModelMap model) {
		String tel = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,}$";
		Student student = new Student();
		Encoding encode = new Encoding();
		String id = (String) request.getSession().getAttribute("id");
		String pwd = studentService.queryById(id).getPassword();
		student.setId(id);
		student.setPassword(npwd);
		boolean flag1 = pwd.equals(encode.md5Encoding(opwd));
		boolean flag2 = npwd.equals(tpwd);
		boolean flag3 = npwd.matches(tel);
		if (flag1) {
			if (flag2) {
				if (flag3) {
					studentService.supdatePwd(student);
					model.addAttribute("flag", "4");
				} else {
					model.addAttribute("flag", "3");
				}
			} else {
				model.addAttribute("flag", "2");
			}
		} else {
			model.addAttribute("flag", "1");
		}
		return "supdatePwd";
	}

	@RequestMapping("joinFace")
	public String joinFace(HttpServletRequest request, ModelMap model) throws Exception {
		new TimeCompare();
		String faceid = request.getParameter("faceid");
		Face face = adminService.selectFaceById(faceid);
		String[] s = face.getTime().split("-");
		Student student = studentService.queryById((String) request.getSession().getAttribute("id"));
		if (TimeCompare.compareDate(TimeCompare.getCurTime(), face.getDate() + " " + s[1])) {
			if (Integer.parseInt(face.getTotalNo()) > face.getCurNo()) {
				face.setCurNo(face.getCurNo() + 1);
				adminService.increaseNo(face);
				student.setFaceid(faceid);
				studentService.joinFace(student);
				return "redirect:/etransfer?sta=yes";
			} else {
				return "redirect:/showFace?sta=full";
			}
		} else {
			return "redirect:/showFace?sta=end";
		}
	}

	@RequestMapping("selectTest")
	public String selectTest(HttpServletRequest request, ModelMap model) throws Exception {
		new TimeCompare();
		String textid = request.getParameter("textid");
		TestInfo test = adminService.selectInfoById(textid);
		String[] s = test.getTime().split("-");
		Student student = studentService.queryById((String) request.getSession().getAttribute("id"));
		if (TimeCompare.compareDate(TimeCompare.getCurTime(), test.getDate() + " " + s[0])) {
			if (Integer.parseInt(test.getTotalNo()) > test.getCurNo()) {
				test.setCurNo(test.getCurNo() + 1);
				adminService.increaseWriteNo(test);
				student.setTextid(textid);
				studentService.selectWrite(student);
				return "redirect:/etransfer?statu=success";
			} else {
				return "redirect:/showWrite?statu=full";
			}
		} else {
			return "redirect:/showWrite?statu=end";
		}
	}
}
