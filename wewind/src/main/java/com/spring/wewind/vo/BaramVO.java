package com.spring.wewind.vo;

public class BaramVO {
	private int b_no; //auto
	private String b_cate; //ī�װ� 
	private String b_name; //�̸� 
	private String b_introduce; //�Ұ���
	private String b_activityplan; //�ٶ����� Ȱ����ȹ�� null
	private String b_difficulty;// �н�����
	private String b_place; //�н� ���				 null
	private String b_support;// ���� ���� 				null	
	private String b_proposal;//���� ���� 				null
	private String b_madeday;
	private String b_mader;//������
	private String b_owner;//ȸ�� //�ʱⰪ�� �����ڿ� ����.
	private String b_award; //���󳻿� 				null
	private String b_award_filepath; //���� ���� ���� 	null
	private String b_classify;
	
	private int b_activity_count; //Ȱ������ ����Ʈ?
	//
	
	
	public String getB_classify() {
		return b_classify;
	}
	public void setB_classify(String b_classify) {
		this.b_classify = b_classify;
	}
	
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_cate() {
		return b_cate;
	}
	public void setB_cate(String b_cate) {
		this.b_cate = b_cate;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_introduce() {
		return b_introduce;
	}
	public void setB_introduce(String b_introduce) {
		this.b_introduce = b_introduce;
	}
	public String getB_activityplan() {
		return b_activityplan;
	}
	public void setB_activityplan(String b_activityplan) {
		this.b_activityplan = b_activityplan;
	}
	public String getB_difficulty() {
		return b_difficulty;
	}
	public void setB_difficulty(String b_difficulty) {
		this.b_difficulty = b_difficulty;
	}
	public String getB_place() {
		return b_place;
	}
	public void setB_place(String b_place) {
		this.b_place = b_place;
	}
	public String getB_support() {
		return b_support;
	}
	public void setB_support(String b_support) {
		this.b_support = b_support;
	}
	public String getB_proposal() {
		return b_proposal;
	}
	public void setB_proposal(String b_proposal) {
		this.b_proposal = b_proposal;
	}
	public String getB_madeday() {
		return b_madeday;
	}
	public void setB_madeday(String b_madeday) {
		this.b_madeday = b_madeday;
	}
	public String getB_mader() {
		return b_mader;
	}
	public void setB_mader(String b_mader) {
		this.b_mader = b_mader;
	}
	public String getB_owner() {
		return b_owner;
	}
	public void setB_owner(String b_owner) {
		this.b_owner = b_owner;
	}
	public String getB_award() {
		return b_award;
	}
	public void setB_award(String b_award) {
		this.b_award = b_award;
	}
	public String getB_award_filepath() {
		return b_award_filepath;
	}
	public void setB_award_filepath(String b_award_filepath) {
		this.b_award_filepath = b_award_filepath;
	}
	
	///�ӽôٿ�
	
	
	public int getB_activity_count() {
		return b_activity_count;
	}
	public void setB_activity_count(int b_activity_count) {
		this.b_activity_count = b_activity_count;
	}
}
