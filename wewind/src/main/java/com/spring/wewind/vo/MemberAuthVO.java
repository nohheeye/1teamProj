package com.spring.wewind.vo;

public class MemberAuthVO {
	private int auth_no;// auto_increment
	private String auth_name;
	private String auth_id;
	private String auth_password;
	private String auth_email;
	private String auth_addr;
	private String auth_code;
	private int auth;
	
	public MemberAuthVO() {
		;
	}

	public MemberAuthVO(int auth_no, String auth_name, String auth_id, String auth_password, String auth_email,
			String auth_addr, String auth_code, int auth) {
		this.auth_no = auth_no;
		this.auth_name = auth_name;
		this.auth_id = auth_id;
		this.auth_password = auth_password;
		this.auth_email = auth_email;
		this.auth_addr = auth_addr;
		this.auth_code = auth_code;
		this.auth = auth;
	}

	public int getAuth_no() {
		return auth_no;
	}

	public void setAuth_no(int auth_no) {
		this.auth_no = auth_no;
	}

	public String getAuth_name() {
		return auth_name;
	}

	public void setAuth_name(String auth_name) {
		this.auth_name = auth_name;
	}

	public String getAuth_id() {
		return auth_id;
	}

	public void setAuth_id(String auth_id) {
		this.auth_id = auth_id;
	}

	public String getAuth_password() {
		return auth_password;
	}

	public void setAuth_password(String auth_password) {
		this.auth_password = auth_password;
	}

	public String getAuth_email() {
		return auth_email;
	}

	public void setAuth_email(String auth_email) {
		this.auth_email = auth_email;
	}

	public String getAuth_addr() {
		return auth_addr;
	}

	public void setAuth_addr(String auth_addr) {
		this.auth_addr = auth_addr;
	}

	public String getAuth_code() {
		return auth_code;
	}

	public void setAuth_code(String auth_code) {
		this.auth_code = auth_code;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "MemberAuthVO [auth_no=" + auth_no + ", auth_name=" + auth_name + ", auth_id=" + auth_id
				+ ", auth_password=" + auth_password + ", auth_email=" + auth_email + ", auth_addr=" + auth_addr
				+ ", auth_code=" + auth_code + ", auth=" + auth + "]";
	}
	
}
