package com.hwl.mapper;

import java.util.List;

import com.hwl.pojo.Admin;
import com.hwl.pojo.Face;
import com.hwl.pojo.TestInfo;

public interface AdminMapper {
	void addAdmin(Admin admin);
	
	List<Admin>	queryAllAdmin();
	
	Admin queryAdminById(String id);
	
	int isAdmin(Admin admin);
	
	void deleteAdmin(String id);
	
	void updatePwd(Admin admin);
	
	void ScheduleFace(Face face);
	
	int FaceExist(String faceid);
	
	int WriteExist(int id);
	
	void updateAdmin(Admin admin);
	
	void updateLevel(Admin admin);
	
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
