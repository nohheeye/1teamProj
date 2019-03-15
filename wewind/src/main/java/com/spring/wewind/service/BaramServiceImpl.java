package com.spring.wewind.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.wewind.dao.BaramDAO;
import com.spring.wewind.vo.BaramVO;
import com.spring.wewind.vo.CategoryVO;

@Service
public class BaramServiceImpl implements BaramService{

	@Inject
	BaramDAO dao;
	
	@Override
	public List<BaramVO> select() throws Exception {
		// TODO Auto-generated method stub
		return dao.select();
	}

	@Override
	public int update(BaramVO baramVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.update(baramVO);
	}

	@Override
	public int create(BaramVO baramVO) throws Exception {
		// TODO Auto-generated method stub

		return dao.create(baramVO);
	}
	

	@Override
	public BaramVO selectOne(int b_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectOne(b_no);
	}

	@Override
	public String getTime() throws Exception {
		// TODO Auto-generated method stub
		return dao.getTime();
	}

	@Override
	public int delete(int b_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.delete(b_no);
	}

	@Override
	public int idCheck(String b_name) throws Exception {
		// TODO Auto-generated method stub
		return dao.idCheck(b_name);
	}

	@Override
	public List<CategoryVO> selectCate() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectCate();
	}

	@Override
	public List<CategoryVO> selectCatePar() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectCatePar();
	}

	@Override
	public List<CategoryVO> makeCate(String b_cate_parent) throws Exception {
		// TODO Auto-generated method stub
		return dao.makeCate(b_cate_parent);
	}
	
	
}
