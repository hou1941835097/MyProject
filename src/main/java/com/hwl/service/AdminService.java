package com.hwl.service;

import java.util.List;

import com.hwl.pojo.Admin;
import com.hwl.pojo.Face;
import com.hwl.pojo.TestInfo;

public interface AdminService {
	void addAdmin(Admin admin);
	
	void updatePwd(Admin admin);
	
	List<Admin> queryAllAdmin();
	
	void deleteAdmin(String id);
	
	int isAdmin(Admin admin);
	
	Admin queryAdminById(String id);
	
	void updateAdmin(Admin admin);
	
	void updateLevel(Admin admin);
	
	void ScheduleFace(Face face);
	
	int FaceExist(String faceid);

	void addTest(TestInfo testInfo);
	
	List<Face> showFace();
	
	List<Face> selectByDate(String date);
	
	Face selectFaceById(String faceid);
	
	void increaseNo(Face face);

	TestInfo selectInfoById(String textid);
	
	List<TestInfo> selectInfoByDate(String date);
	
	List<TestInfo> showWrite();
	
	void increaseWriteNo(TestInfo test);
	
}
