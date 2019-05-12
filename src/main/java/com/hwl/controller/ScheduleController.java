package com.hwl.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hwl.pojo.Face;
import com.hwl.pojo.TestInfo;
import com.hwl.service.AdminService;
import com.hwl.util.TimeCompare;

@Controller
public class ScheduleController {

	@Autowired
	private AdminService adminService;

	@RequestMapping("ScheduleFace")
	public String ScheduleFace(Face face, ModelMap model) throws Exception {
		int count = adminService.FaceExist(face.getFaceid());
		new TimeCompare();
		List<Face> fas = adminService.selectByDate(face.getDate());
		if (count > 0) {
			model.addAttribute("ok", "no");
		} else {
			if (TimeCompare.compareDate(face.getDate() + " " + face.getTime(), TimeCompare.getCurTime())) {
				model.addAttribute("old", "old");
				return "face";
			}
			if (adminService.selectByDate(face.getDate()) != null) {
				for (Face face2 : fas) {
					if (face2.getTime().equals(face.getTime())) {
						model.addAttribute("ok", "exist");
						return "face";
					}
				}
				model.addAttribute("ok", "ok");
				adminService.ScheduleFace(face);
				return "face";
			} else {
				model.addAttribute("ok", "ok");
				adminService.ScheduleFace(face);
			}
		}
		return "face";

	}

	@RequestMapping("ScheduleWrite")
	public String ScheduleWrite(TestInfo testInfo, HttpServletRequest request, ModelMap model) throws Exception {
		String[] d = request.getSession().getServletContext().getRealPath("\\").replace("\\", "/").split("/");
		StringBuilder sb = new StringBuilder("");
		for (int x = 0; x < d.length - 2; x++) {
			sb.append(d[x]).append("/");
		}
		String realPath = sb.toString() + "paper/";
		List<TestInfo> tsi = adminService.selectInfoByDate(testInfo.getDate());
		new TimeCompare();
		String td = testInfo.getDate() + " " + testInfo.getTime();

		if (adminService.selectInfoById(testInfo.getTextid()) != null) {
			model.addAttribute("ex", "ex");
			return "schedule";
		} else if (TimeCompare.compareDate(td, TimeCompare.getCurTime())) {
			model.addAttribute("bef", "bef");
			return "schedule";
		} else if (tsi != null) {
			for (TestInfo testInfo2 : tsi) {
				if (testInfo2.getTime().equals(testInfo.getTime())) {
					model.addAttribute("exi", "exi");
					return "schedule";
				}
			}
		}
		adminService.addTest(testInfo);
		File file = new File(realPath + "question.txt");
		File file2 = new File(realPath + "option.txt");
		file.renameTo(new File(realPath + testInfo.getTextid() + "q.txt"));
		file2.renameTo(new File(realPath + testInfo.getTextid() + "o.txt"));
		return "redirect:/ashowTest?yes=yes";
	}
}
