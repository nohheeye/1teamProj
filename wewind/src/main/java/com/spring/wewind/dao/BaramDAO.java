package com.spring.wewind.dao;

import java.util.List;

import com.spring.wewind.vo.BaramVO;
import com.spring.wewind.vo.CategoryVO;

public interface BaramDAO {

	public List<BaramVO> select() throws Exception;
	public int idCheck(String b_name) throws Exception;

	public int update(BaramVO baramVO) throws Exception;

	public int create(BaramVO baramVO) throws Exception;
	
	public BaramVO selectOne(int b_no) throws Exception;
	public String getTime()throws Exception;
	
	public int delete(int b_no) throws Exception;
	public List<CategoryVO> selectCate() throws Exception;
	public List<CategoryVO> selectCatePar() throws Exception;
	public List<CategoryVO> makeCate(String b_cate_parent) throws Exception;
	
}
