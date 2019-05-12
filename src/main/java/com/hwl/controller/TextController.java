package com.hwl.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hwl.pojo.Text;

@Controller
public class TextController {

	@RequestMapping("addText")
	public String addText(Text text, HttpServletRequest request, ModelMap model) throws IOException {
		String[] d = request.getSession().getServletContext().getRealPath("\\").replace("\\", "/").split("/");
		StringBuilder sb = new StringBuilder("");
		for(int x=0; x<d.length-2;x++) {
			sb.append(d[x]).append("/");
		}
		String realPath = sb.toString()+"paper/";
		File f = new File(realPath);
		if (!f.exists()) {
			f.mkdir();
		}
		if (text.getTextid() == "") {
			text.setTextid("1");
		}
		String textid = text.getTextid();
		BufferedWriter bw = new BufferedWriter(
				new OutputStreamWriter(new FileOutputStream(realPath + "question.txt", true), "utf-8"));
		BufferedWriter bw2 = new BufferedWriter(
				new OutputStreamWriter(new FileOutputStream(realPath + "option.txt", true), "utf-8"));
		bw.write(textid + "-" + text.getQuestion() + "\r\n");
		bw2.write(textid + "-" + "A:" + text.getOption1() + "-B:" + text.getOption2() + "-C:" + text.getOption3()
				+ "-Right:" + text.getRightAnswer() + "\r\n");
		bw.close();
		bw2.close();
		if (!textid.equals("5")) {
			model.addAttribute("textid", String.valueOf(Integer.parseInt(textid) + 1));
			return "Text";
		} else {
			return "schedule";
		}
	}

}
