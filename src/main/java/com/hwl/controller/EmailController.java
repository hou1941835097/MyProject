package com.hwl.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hwl.pojo.Student;
import com.hwl.service.StudentService;

@Controller
public class EmailController {

	@Autowired
	private StudentService studentService;

	@Autowired
	private JavaMailSender javaMailSender;

	@Value("${mail.smtp.username}")
	private String emailFrom;

	@RequestMapping("sendEmail")
	public String sendEmail(@RequestParam("email") String email, @RequestParam("detail") String info,
			@RequestParam("subject") String subject, HttpServletRequest request, ModelMap model) {
		SimpleMailMessage message = new SimpleMailMessage();
		// 发件人的邮箱地址
		message.setFrom(emailFrom);
		// 收件人的邮箱地址
		message.setTo(email);
		// 邮件主题
		message.setSubject(subject);
		// 邮件内容
		message.setText(info);
		// 发送邮件
		javaMailSender.send(message);
		String staus = request.getParameter("staus");
		if("yes".equals(staus)) {
			model.addAttribute("staus", "yes");
		}
		String id = (String)request.getSession().getAttribute("studentid");
		Student student = studentService.queryById(id);
		student.setMessage("Subject:"+subject+"     "+"Detail:"+info+"    From: IT 灵魂公司");
		studentService.sendMessage(student);
		model.addAttribute("success", "yes");

		return "email";
	}
}
