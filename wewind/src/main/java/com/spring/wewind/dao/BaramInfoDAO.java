package com.spring.wewind.dao;

import java.util.List;

import com.spring.wewind.vo.BaramInfoVO;
import com.spring.wewind.vo.BaramVO;

public interface BaramInfoDAO {

	
	public List<BaramInfoVO> select(int ino_b_no) throws Exception;
	
	/*
	public List<BaramInfoVO> select() throws Exception;

	public int update(BaramInfoVO baramInfoVO) throws Exception;

	public int create(BaramInfoVO baramInfoVO) throws Exception;
	
	public int delete(int acti_b_no) throws Exception;
	*/
}
