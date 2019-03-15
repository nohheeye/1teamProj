package com.spring.wewind.vo;

public class AwardVO {

	private int award_no;
	private int award_b_no;
	private String award_content;
	private String award_filepath;
	private int award_exist;
	
	//
	private String b_name; //바람개비 명

	public int getAward_no() {
		return award_no;
	}

	public void setAward_no(int award_no) {
		this.award_no = award_no;
	}

	public int getAward_b_no() {
		return award_b_no;
	}

	public void setAward_b_no(int award_b_no) {
		this.award_b_no = award_b_no;
	}

	public String getAward_content() {
		return award_content;
	}

	public void setAward_content(String award_content) {
		this.award_content = award_content;
	}

	public String getAward_filepath() {
		return award_filepath;
	}

	public void setAward_filepath(String award_filepath) {
		this.award_filepath = award_filepath;
	}

	public int getAward_exist() {
		return award_exist;
	}

	public void setAward_exist(int award_exist) {
		this.award_exist = award_exist;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	
	
}
