package com.hwl.pojo;

public class Face {
	private String faceid;
	private String date;
	private String time;
	private String totalNo;
	private int curNo;
	public Face() {
	}
	public Face(String faceid, String date, String time, String totalNo, int curNo) {
		super();
		this.faceid = faceid;
		this.date = date;
		this.time = time;
		this.totalNo = totalNo;
		this.curNo = curNo;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getFaceid() {
		return faceid;
	}
	public void setFaceid(String faceid) {
		this.faceid = faceid;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTotalNo() {
		return totalNo;
	}
	public void setTotalNo(String totalNo) {
		this.totalNo = totalNo;
	}
	public int getCurNo() {
		return curNo;
	}
	public void setCurNo(int curNo) {
		this.curNo = curNo;
	}
}
