package com.spring.wewind;

public class Criteria {
	private int page;
	private int perPageNum;
	
	public Criteria() {
		this.page=1;
		this.perPageNum = 3; //�Ѱ� �������� ��� �����ٰ�����
		
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page<=0) {
			this.page=1;
			return;
		}
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum<=0 || perPageNum >100) {
			this.perPageNum = 3;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPageStart() {
		return (this.page-1)*perPageNum;
	}
	
	//activity������ ���� ����

	private int acti_b_no; //�̰� activiy������ ����
	
	public int getActi_b_no() {
		return acti_b_no;
	}
	public void setActi_b_no(int acti_b_no) {
		this.acti_b_no = acti_b_no;
	}
	//
	
	//activity������ ���� ��
	
	//Knowledge������ ���� ����
	private int know_b_no; //�̰� Knowledge������ ���

	public int getKnow_b_no() {
		return know_b_no;
	}
	public void setKnow_b_no(int know_b_no) {
		this.know_b_no = know_b_no;
	}
	//Knowledge������ ���� ��
}
