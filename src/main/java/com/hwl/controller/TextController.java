package com.hwl.controller;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hwl.pojo.Text;

@Controller
public class TextController {
	
	
	@RequestMapping("addText")
	public String addText(Text text,ModelMap model) throws IOException {
		if(text.getTextid()=="") {
			text.setTextid("1");
		}
		String textid = text.getTextid();
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("D://question.txt",true),"utf-8"));
		BufferedWriter bw2= new BufferedWriter(new OutputStreamWriter(new FileOutputStream("D://option.txt",true),"utf-8"));
		bw.write(textid+"-"+text.getQuestion()+"\r\n");
		bw2.write(textid+"-"+"A:"+text.getOption1()+"-B:"+text.getOption2()+"-C:"+text.getOption3()+"-Right:"+text.getRightAnswer()+"\r\n");
		bw.close();
		bw2.close();
		if(!textid.equals("5")) {
			model.addAttribute("textid",String.valueOf(Integer.parseInt(textid)+1));
			return "Text";
		}else {
			return "schedule";
		}
	}
	
}
