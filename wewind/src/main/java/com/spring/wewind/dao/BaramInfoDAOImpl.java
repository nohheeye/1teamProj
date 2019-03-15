package com.spring.wewind.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.wewind.vo.BaramInfoVO;
import com.spring.wewind.vo.BaramVO;


@Repository
public class BaramInfoDAOImpl implements BaramInfoDAO{

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<BaramInfoVO> select(int info_b_no) throws Exception {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("BaramInfo.select",info_b_no);
	}


}
