package com.hwl.pojo;

public class Info {
	private String id;
	private int write;
	private int face;
	public Info() {
	}
	public Info(String id, int write, int face) {
		this.id = id;
		this.write = write;
		this.face = face;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getWrite() {
		return write;
	}
	public void setWrite(int write) {
		this.write = write;
	}
	public int getFace() {
		return face;
	}
	public void setFace(int face) {
		this.face = face;
	}
}
