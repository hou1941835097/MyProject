package com.hwl.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hwl.pojo.Student;
import com.hwl.service.StudentService;

@Controller
public class AddStudentController {
	
	@Autowired
	private StudentService studentService;
	
	
	@ResponseBody
	@RequestMapping("registerStudent")
	public JSONObject register(HttpServletResponse response,Student student,ModelMap model) throws IOException {
		JSONObject json = new JSONObject();
		Student s = studentService.queryById(student.getId());
		if(s==null) {
			studentService.register(student);
			json.put("msg", "yes");
		}else {
			json.put("msg", "no");
		}
		return json;
	}
	
	
	//直接给数据库添加数据使用
	@RequestMapping("addStudent")
	public void addDatas(){
		for(int x=0;x<10;x++) {
			for(int y=0;y<10;y++) {
				for(int z=0;z<10;z++) {
					Student s = new Student();
					s.setId("3118006"+String.valueOf(x)+String.valueOf(y)+String.valueOf(z));
					s.setSchool("兴安中学");
					s.setPassword("12345a");
					s.setName("侯文"+String.valueOf(x)+String.valueOf(y)+String.valueOf(z));
					s.setGrade("2019");
					s.setPhone("13221306"+String.valueOf(x)+String.valueOf(y)+String.valueOf(z));
					
					studentService.register(s);
					System.out.println("true:"+String.valueOf(x)+String.valueOf(y)+String.valueOf(z));
				}
			}
		}
}
}
