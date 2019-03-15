package com.spring.wewind.vo;

import java.sql.Date;

public class ContestVO {
	String contest_no;
	String contest_id;
	String contest_title;
	String contest_field;
	String contest_sponser;
	String contest_content;
	Date contest_start;
	Date contest_end;
	int contest_exist;
	
	public String getContest_no() {
		return contest_no;
	}
	public void setContest_no(String contest_no) {
		this.contest_no = contest_no;
	}
	public String getContest_id() {
		return contest_id;
	}
	public void setContest_id(String contest_id) {
		this.contest_id = contest_id;
	}
	public String getContest_title() {
		return contest_title;
	}
	public void setContest_title(String contest_title) {
		this.contest_title = contest_title;
	}
	public String getContest_field() {
		return contest_field;
	}
	public void setContest_field(String contest_field) {
		this.contest_field = contest_field;
	}
	public String getContest_sponser() {
		return contest_sponser;
	}
	public void setContest_sponser(String contest_sponser) {
		this.contest_sponser = contest_sponser;
	}
	public Date getContest_start() {
		return contest_start;
	}
	public void setContest_start(Date contest_start) {
		this.contest_start = contest_start;
	}
	public Date getContest_end() {
		return contest_end;
	}
	public void setContest_end(Date contest_end) {
		this.contest_end = contest_end;
	}
	public int getContest_exist() {
		return contest_exist;
	}
	public void setContest_exist(int contest_exist) {
		this.contest_exist = contest_exist;
	}
	public String getContest_content() {
		return contest_content;
	}
	public void setContest_content(String contest_content) {
		this.contest_content = contest_content;
	}
	
	
}
