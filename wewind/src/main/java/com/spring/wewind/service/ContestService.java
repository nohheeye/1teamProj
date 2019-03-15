package com.spring.wewind.service;

import java.util.List;

import com.spring.wewind.vo.ContestVO;

public interface ContestService {
	public List<ContestVO> contestList();

	public void contestWrite(ContestVO vo);
	
	/*
	 * public ContestVO contestContentView(String contest_no); public void
	 * contestDelete(String contest_no); public void contestModify(ContestVO vo);
	 * public ContestVO contestModifyView(String contest_no);
	 */
	 
}
