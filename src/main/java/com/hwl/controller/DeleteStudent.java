package com.hwl.controller;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hwl.service.StudentService;

@Controller
@ResponseBody
public class DeleteStudent {

	@Autowired
	private StudentService studentService;
	
	@RequestMapping("deleteStudent")
	public JSONObject deleteStudent(@RequestParam("ids") String[] ids) {
		JSONObject json = new JSONObject();
//		String[] ids =(String[])json.get("ids");
		for(String id: ids) {
			studentService.deleteStudent(id);
		}
		json.put("msg", "yes");
		return json;
	}
}
