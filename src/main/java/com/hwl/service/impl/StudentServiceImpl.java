package com.hwl.service.impl;

import java.util.List;

import com.hwl.mapper.StudentMapper;
import com.hwl.pojo.Info;
import com.hwl.pojo.Student;
import com.hwl.service.StudentService;

public class StudentServiceImpl implements StudentService {
	private StudentMapper studentMapper;
	
	public void setStudentMapper(StudentMapper studentMapper) {
		this.studentMapper = studentMapper;
	}
	@Override
	public void register(Student student) {
		studentMapper.register(student);
	}
	public int isStudent(Student student) {
		return studentMapper.isLogin(student);
	}
	@Override
	public void update(Student student) {
		studentMapper.update(student);
	}
	@Override
	public Student queryById(String id) {
		return studentMapper.queryById(id);
	}
	@Override
	public List<Student> queryAll() {
		return studentMapper.queryAll();
	}
	@Override
	public void signUp(Student student) {
		studentMapper.signUp(student);
	}
	@Override
	public int showWriteScore(String id) {
		return studentMapper.showWriteScore(id);
	}
	@Override
	public void addWriteScore(Info info) {
		studentMapper.addWriteScore(info);
	}
	@Override
	public void addFaceScore(Info info) {
		studentMapper.addFaceScore(info);
	}
	@Override
	public Info queryInfo(String id) {
		return studentMapper.queryInfo(id);
	}
	@Override
	public List<Student> queryByCo(String col) {
		return studentMapper.queryByCo(col);
	}
	@Override
	public void deleteStudent(String id) {
		studentMapper.delete(id);
	}
	@Override
	public void supdatePwd(Student student) {
		studentMapper.supdatePwd(student);
	}
	@Override
	public void uspdate(Student student) {
		studentMapper.uspdate(student);
	}
	@Override
	public void sendMessage(Student student) {
		studentMapper.sendMessage(student);
	}
	@Override
	public void passWrite(Student student) {
		studentMapper.passWrite(student);
	}
	@Override
	public void joinFace(Student student) {
		studentMapper.joinFace(student);
	}
	@Override
	public void selectWrite(Student student) {
		studentMapper.selectWrite(student);
	}
	@Override
	public int signUpNo() {
		return studentMapper.signUpNo();
	}
	@Override
	public void addOrder(Student student) {
		studentMapper.addOrder(student);
	}
	@Override
	public void addAnswer(Student student) {
		studentMapper.addAnswer(student);
	}
	@Override
	public List<Student> allSignUp() {
		return studentMapper.allSignUp();
	}
	
	
}
