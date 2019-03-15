package com.spring.wewind.vo;

public class MemberVO {
	private String id;
	private String name;
	private String password;
	private String email;
	private int auth;
	private String face_filepath;
	private int b_count;
	
	
	public MemberVO() {
		;
	}
	
	public MemberVO(String id, String name, String password, String email, int auth) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.auth = auth;
	}
	
	public MemberVO(String id, String name, String password, String email, int auth, String face_filepath,
			int b_count) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.auth = auth;
		this.face_filepath = face_filepath;
		this.b_count = b_count;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	public String getFace_filepath() {
		return face_filepath;
	}
	public void setFace_filepath(String face_filepath) {
		this.face_filepath = face_filepath;
	}
	public int getB_count() {
		return b_count;
	}
	public void setB_count(int b_count) {
		this.b_count = b_count;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", name=" + name + ", password=" + password + ", email=" + email + ", auth="
				+ auth + ", face_filepath=" + face_filepath + ", b_count=" + b_count + "]";
	}
}
