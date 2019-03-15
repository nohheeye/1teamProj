package com.spring.wewind.service;

import java.util.List;

import com.spring.wewind.vo.BaramInfoVO;
import com.spring.wewind.vo.BaramVO;

public interface BaramInfoService {

	public List<BaramInfoVO> select(int info_b_no) throws Exception;
	/*
	public List<BaramInfoVO> select() throws Exception;

	public int update(BaramInfoVO baramInfoVO) throws Exception;

	public int create(BaramInfoVO baramInfoVO) throws Exception;
	
	public int delete(int acti_b_no) throws Exception;
	*/	
}
