package com.hwl.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hwl.pojo.Face;
import com.hwl.pojo.TestInfo;
import com.hwl.service.AdminService;
import com.hwl.util.TimeCompare;

@Controller
public class ScheduleController {

	@Autowired
	private AdminService adminService;

	@RequestMapping("ScheduleFace")
	public String ScheduleFace(Face face,ModelMap model) {
		int count = adminService.FaceExist(face.getFaceid());
		List<Face> fas = adminService.selectByDate(face.getDate());
		if (count > 0) {
			model.addAttribute("ok", "no");
		} else {
			if(adminService.selectByDate(face.getDate())!=null) {
				for (Face face2 : fas) {
					if(face2.getTime().equals(face.getTime())) {
						model.addAttribute("ok", "exist");
						return "face";
					}else {
						model.addAttribute("ok", "ok");
						adminService.ScheduleFace(face);
						return "face";
					}
				}
				
			}else {
				model.addAttribute("ok", "ok");
				adminService.ScheduleFace(face);
			}
		}
		return "face";
	}

	@RequestMapping("ScheduleWrite")
	public String ScheduleWrite(TestInfo testInfo, ModelMap model) throws Exception {
		List<TestInfo> tsi=adminService.selectInfoByDate(testInfo.getDate());
		new TimeCompare();
		String td = testInfo.getDate()+" "+testInfo.getTime();
		
		if(adminService.selectInfoById(testInfo.getTextid())!=null) {
			model.addAttribute("ex", "ex");
			return "schedule";
		}else if(TimeCompare.compareDate(td, TimeCompare.getCurTime())) {
			model.addAttribute("bef", "bef");
			return "schedule";
		}else if(tsi!=null) {
			for (TestInfo testInfo2 : tsi) {
				if(testInfo2.getTime().equals(testInfo.getTime())) {
					model.addAttribute("exi", "exi");
					return "schedule";
				}
			}
		}
		adminService.addTest(testInfo);
		File file = new File("D://question.txt");
		File file2 = new File("D://option.txt");
		file.renameTo(new File("D://"+testInfo.getTextid()+"q.txt"));
		file2.renameTo(new File("D://"+testInfo.getTextid()+"o.txt"));
		return "redirect:/ashowTest?yes=yes";
	}
}
