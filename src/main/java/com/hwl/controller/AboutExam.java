package com.hwl.controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hwl.pojo.Student;
import com.hwl.pojo.Text;
import com.hwl.service.AdminService;
import com.hwl.service.StudentService;

@Controller
public class AboutExam {

	@Autowired
	private StudentService studentService;

	@Autowired
	private AdminService adminService;

	@RequestMapping("startExam")
	public String startExam(HttpServletRequest request, ModelMap model) throws IOException {
		String[] d = request.getSession().getServletContext().getRealPath("\\").replace("\\", "/").split("/");
		StringBuilder sbu = new StringBuilder("");
		for(int x=0; x<d.length-2;x++) {
			sbu.append(d[x]).append("/");
		}
		String realPath = sbu.toString()+"paper/";
		List<Text> texts = new ArrayList<Text>();
		String id = (String) request.getSession().getAttribute("id");
		Student s = studentService.queryById(id);
		BufferedReader br = new BufferedReader(
				new InputStreamReader(new FileInputStream(realPath+ s.getTextid() + "q.txt"), "UTF-8"));
		BufferedReader br2 = new BufferedReader(
				new InputStreamReader(new FileInputStream(realPath+ s.getTextid() + "o.txt"), "UTF-8"));
		String str = "";
		String str2 = "";
		while ((str = br.readLine()) != null && (str2 = br2.readLine()) != null) {
			String[] sts = str.split("-");
			String[] strs = str2.split("-");
			Text text = new Text();
			text.setOption1(strs[1]);
			text.setOption2(strs[2]);
			text.setOption3(strs[3]);
			text.setQuestion(sts[1]);
			text.setTextid(sts[0]);
			texts.add(text);
		}
		Collections.shuffle(texts);
		StringBuilder sb = new StringBuilder("");
		for (Text text : texts) {
			sb.append(text.getTextid()).append("-");
		}
		s.setOrders(sb.toString());
		studentService.addOrder(s);
		model.addAttribute("texts", texts);
		br.close();
		br2.close();
		return "test";
	}

	@RequestMapping("getScore")
	public String getScore(HttpServletRequest request, ModelMap model) throws IOException {
		String[] d = request.getSession().getServletContext().getRealPath("\\").replace("\\", "/").split("/");
		StringBuilder sb = new StringBuilder("");
		for(int x=0; x<d.length-2;x++) {
			sb.append(d[x]).append("/");
		}
		String realPath = sb.toString()+"paper/";
		String id = (String) request.getSession().getAttribute("id");
		Student s = studentService.queryById(id);
		int passSore = Integer.parseInt(adminService.selectInfoById(s.getTextid()).getPassScore());
		BufferedReader br = new BufferedReader(new FileReader(realPath + s.getTextid() + "o.txt"));
		String str = "";
		int score = 0;
		StringBuilder stb = new StringBuilder("");
		for (int x = 1; (str = br.readLine()) != null && x <= 5; x++) {
			String[] strs = str.split("-");
			String[] answers = request.getParameterValues((String.valueOf(x)));
			StringBuilder answer = new StringBuilder("");
			for (int j = 0; j < answers.length; j++) {
				answer.append(answers[j]);
				if (j != answers.length - 1) {
					answer.append(",");
				}
			}
			stb.append(x).append("-").append(answer).append(";");
			if (strs[4].equals("Right:" + answer.toString())) {
				score += 20;
			}
		}
		s.setMyasw(stb.toString());
		studentService.addAnswer(s);
		br.close();
		model.addAttribute("score", score);
		Student student = new Student();
		if (score >= passSore) {
			student.setIspass("Yes");
		} else {
			student.setIspass("No");
		}
		student.setWriteScore(String.valueOf(score));
		student.setId(id);
		studentService.passWrite(student);
		return "redirect:/etransfer";
	}

	@RequestMapping("showMyText")
	public String showMyText(HttpServletRequest request, ModelMap model) throws IOException {
		String[] d = request.getSession().getServletContext().getRealPath("\\").replace("\\", "/").split("/");
		StringBuilder sb = new StringBuilder("");
		for(int x=0; x<d.length-2;x++) {
			sb.append(d[x]).append("/");
		}
		String realPath = sb.toString()+"paper/";
		List<Text> texts = new ArrayList<Text>();
		String id = (String) request.getSession().getAttribute("id");
		Student s = studentService.queryById(id);
		String[] xh = s.getOrders().split("-");
		String[] asw= s.getMyasw().split(";");
		for (int x =0;x<5;x++) {
			String str = "";
			String str2 = "";
			BufferedReader br = new BufferedReader(
					new InputStreamReader(new FileInputStream(realPath  + s.getTextid() + "q.txt"), "UTF-8"));
			BufferedReader br2 = new BufferedReader(
					new InputStreamReader(new FileInputStream(realPath  + s.getTextid() + "o.txt"), "UTF-8"));
			while ((str = br.readLine()) != null&&(str2 = br2.readLine()) != null) {
				String[] qr = str.split("-");
				String[] or = str2.split("-");
				if(qr[0].equals(xh[x])) {
					Text text = new Text();
					text.setQuestion(qr[1]);
					text.setOption1(or[1]);
					text.setOption2(or[2]);
					text.setOption3(or[3]);
					text.setRightAnswer(or[4].split(":")[1]);
					text.setMine(asw[x].split("-")[1]);
					System.out.println(text);
					texts.add(text);
				}
			}
			br.close();
			br2.close();
		}
		model.addAttribute("texts", texts);
		return "showMine";
	}
	
	@RequestMapping("showTextById")
	public String showTextById(HttpServletRequest request,ModelMap model) throws IOException {
		String[] d = request.getSession().getServletContext().getRealPath("\\").replace("\\", "/").split("/");
		StringBuilder sb = new StringBuilder("");
		for(int x=0; x<d.length-2;x++) {
			sb.append(d[x]).append("/");
		}
		String realPath = sb.toString()+"paper/";
		List<Text> texts = new ArrayList<Text>();
		String textid = request.getParameter("textid");
		BufferedReader br = new BufferedReader(
				new InputStreamReader(new FileInputStream(realPath  +textid+ "q.txt"), "UTF-8"));
		BufferedReader br2 = new BufferedReader(
				new InputStreamReader(new FileInputStream(realPath +textid+ "o.txt"), "UTF-8")); 
		String str = "";
		String str2 = "";
		while ((str = br.readLine()) != null&&(str2 = br2.readLine()) != null) {
			String[] qr = str.split("-");
			String[] or = str2.split("-");
				Text text = new Text();
				text.setQuestion(qr[1]);
				text.setOption1(or[1]);
				text.setOption2(or[2]);
				text.setOption3(or[3]);
				text.setRightAnswer(or[4].split(":")[1]);
				texts.add(text);
			}
		br.close();
		br2.close();
		model.addAttribute("texts", texts);
		return "textById";
	}
}
