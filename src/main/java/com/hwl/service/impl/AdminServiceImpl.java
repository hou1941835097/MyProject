package com.hwl.service.impl;

import java.util.List;

import com.hwl.mapper.AdminMapper;
import com.hwl.pojo.Admin;
import com.hwl.pojo.Face;
import com.hwl.pojo.TestInfo;
import com.hwl.service.AdminService;

public class AdminServiceImpl implements AdminService {
	
	private AdminMapper adminMapper;
	
	
	public void setAdminMapper(AdminMapper adminMapper) {
		this.adminMapper = adminMapper;
	}

	@Override
	public void addAdmin(Admin admin) {
		adminMapper.addAdmin(admin);
	}

	@Override
	public void updatePwd(Admin admin) {
		adminMapper.updatePwd(admin);
	}

	@Override
	public List<Admin> queryAllAdmin() {
		return adminMapper.queryAllAdmin();
	}

	@Override
	public void deleteAdmin(String id) {
		adminMapper.deleteAdmin(id);
	}

	@Override
	public int isAdmin(Admin admin) {
		return adminMapper.isAdmin(admin);
	}

	@Override
	public Admin queryAdminById(String id) {
		return adminMapper.queryAdminById(id);
	}

	@Override
	public void ScheduleFace(Face face) {
		adminMapper.ScheduleFace(face);
	}


	@Override
	public List<Face> showFace() {
		return adminMapper.showFace();
	}
	
	@Override
	public void updateAdmin(Admin admin) {
		adminMapper.updateAdmin(admin);
	}

	@Override
	public void updateLevel(Admin admin) {
		adminMapper.updateLevel(admin);
	}

	@Override
	public void addTest(TestInfo testInfo) {
		adminMapper.addTest(testInfo);
	}


	@Override
	public int FaceExist(String faceid) {
		return adminMapper.FaceExist(faceid);
	}

	@Override
	public List<Face> selectByDate(String date) {
		return adminMapper.selectByDate(date);
	}

	@Override
	public Face selectFaceById(String faceid) {
		return adminMapper.selectFaceById(faceid);
	}

	@Override
	public void increaseNo(Face face) {
		adminMapper.increaseNo(face);
	}

	@Override
	public TestInfo selectInfoById(String textid) {
		return adminMapper.selectInfoById(textid);
	}

	@Override
	public List<TestInfo> selectInfoByDate(String date) {
		return adminMapper.selectInfoByDate(date);
	}

	@Override
	public List<TestInfo> showWrite() {
		return adminMapper.showWrite();
	}

	@Override
	public void increaseWriteNo(TestInfo test) {
		adminMapper.increaseWriteNo(test);
	}


}
