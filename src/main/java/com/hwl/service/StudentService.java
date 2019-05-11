package com.hwl.service;

import java.util.List;

import com.hwl.pojo.Info;
import com.hwl.pojo.Student;

public interface StudentService {
	void register(Student student);
	
	int isStudent(Student student);
	
	void deleteStudent(String id);
	
	void update(Student student);
	
	void uspdate(Student student);
	
	Student queryById(String id);
	
	List<Student> queryAll();

	void signUp(Student student);
	
	int showWriteScore(String id);
	
	void addWriteScore(Info info);
	
	void addFaceScore(Info info);
	
	Info queryInfo(String id);
	
	List<Student> queryByCo(String col);
	
	void supdatePwd(Student student);
	
	void sendMessage(Student student);
	
	void passWrite(Student student);

	void joinFace(Student student);
	
	void selectWrite(Student student);
	
	int signUpNo();
	
	void addOrder(Student student);
	
	void addAnswer(Student student);
	
	List<Student> allSignUp();
}
