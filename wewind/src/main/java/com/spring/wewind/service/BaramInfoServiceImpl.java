package com.spring.wewind.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.wewind.dao.BaramInfoDAO;
import com.spring.wewind.vo.BaramInfoVO;

@Service
public class BaramInfoServiceImpl implements BaramInfoService{

	@Inject
	BaramInfoDAO dao;

	@Override
	public List<BaramInfoVO> select(int info_b_no) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("yonghee in service");
		return dao.select(info_b_no);
	}
		
}
