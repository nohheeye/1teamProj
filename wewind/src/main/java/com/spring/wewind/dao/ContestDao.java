package com.spring.wewind.dao;

import java.util.List;

import com.spring.wewind.vo.ContestVO;

public interface ContestDao {
	public List<ContestVO> contestList();

	public void contestWrite(ContestVO vo);

	/*
	 * public ContestVO contestContentView(String contest_no);
	 * 
	 * public void contestDelete(String contest_no);
	 * 
	 * public void contestModify(ContestVO vo);
	 * 
	 * public ContestVO contestModifyView(String contest_no);
	 */

}
