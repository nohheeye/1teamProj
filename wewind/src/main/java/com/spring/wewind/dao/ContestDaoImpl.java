package com.spring.wewind.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.wewind.vo.ContestVO;

@Repository
public class ContestDaoImpl implements ContestDao {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ContestVO> contestList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("contest.contestList");
	}

	
	  @Override public void contestWrite(ContestVO vo) {
		  sqlSession.insert("contest.contestWrite", vo);
	  
	  }
	  
	/*
	 * @Override public ContestVO contestContentView(String contest_no) { // TODO
	 * Auto-generated method stub return null; }
	 * 
	 * @Override public void contestDelete(String contest_no) { // TODO
	 * Auto-generated method stub
	 * 
	 * }
	 * 
	 * @Override public void contestModify(ContestVO vo) { // TODO Auto-generated
	 * method stub
	 * 
	 * }
	 * 
	 * @Override public ContestVO contestModifyView(String contest_no) { // TODO
	 * Auto-generated method stub return null; }
	 */

}
