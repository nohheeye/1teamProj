package com.spring.wewind.vo;

public class ActivityVO {

	private int acti_no;
	private int acti_b_no;
	private String acti_title;
	private String acti_writer;
	private String acti_writedate;
	private String acti_date;
	private String acti_content;
	private String acti_filepath;
	private String b_name; //해당 바람개비이름
	
	//월, 일 추가
	private String month;
	private String day;
	
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	//
	
	public int getActi_no() {
		return acti_no;
	}
	public void setActi_no(int acti_no) {
		this.acti_no = acti_no;
	}
	public int getActi_b_no() {
		return acti_b_no;
	}
	public void setActi_b_no(int acti_b_no) {
		this.acti_b_no = acti_b_no;
	}
	public String getActi_title() {
		return acti_title;
	}
	public void setActi_title(String acti_title) {
		this.acti_title = acti_title;
	}
	public String getActi_writer() {
		return acti_writer;
	}
	public void setActi_writer(String acti_writer) {
		this.acti_writer = acti_writer;
	}
	public String getActi_writedate() {
		return acti_writedate;
	}
	public void setActi_writedate(String acti_writedate) {
		this.acti_writedate = acti_writedate;
	}
	public String getActi_date() {
		return acti_date;
	}
	public void setActi_date(String acti_date) {
		this.acti_date = acti_date;
	}
	public String getActi_content() {
		return acti_content;
	}
	public void setActi_content(String acti_content) {
		this.acti_content = acti_content;
	}
	public String getActi_filepath() {
		return acti_filepath;
	}
	public void setActi_filepath(String acti_filepath) {
		this.acti_filepath = acti_filepath;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
}
