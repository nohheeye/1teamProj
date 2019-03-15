package com.spring.wewind;

public class Criteria {
	private int page;
	private int perPageNum;
	
	public Criteria() {
		this.page=1;
		this.perPageNum = 3; //한개 페이지에 몇개씩 보여줄것인지
		
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
	
	//activity에서만 사용됨 시작

	private int acti_b_no; //이건 activiy에서만 사용됨
	
	public int getActi_b_no() {
		return acti_b_no;
	}
	public void setActi_b_no(int acti_b_no) {
		this.acti_b_no = acti_b_no;
	}
	//
	
	//activity에서만 사용됨 끝
	
	//Knowledge에서만 사용됨 시작
	private int know_b_no; //이건 Knowledge에서만 사용

	public int getKnow_b_no() {
		return know_b_no;
	}
	public void setKnow_b_no(int know_b_no) {
		this.know_b_no = know_b_no;
	}
	//Knowledge에서만 사용됨 끝
}
