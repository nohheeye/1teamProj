package com.spring.wewind.vo;

public class UserVO {
	String user_id;
	String user_name;
	int user_auth;
	
	public UserVO() {
		;
	}
	public UserVO(String user_id, String user_name, int user_auth) {
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_auth = user_auth;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getUser_auth() {
		return user_auth;
	}
	public void setUser_auth(int user_auth) {
		this.user_auth = user_auth;
	}
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_name=" + user_name + ", user_auth=" + user_auth + "]";
	}
}
