package com.spring.wewind.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.wewind.Criteria;
import com.spring.wewind.vo.ActivityVO;
import com.spring.wewind.vo.BaramVO;
import com.spring.wewind.vo.KnowledgeVO;

@Repository
public class KnowledgeDAOImpl implements KnowledgeDAO{

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<KnowledgeVO> select(int know_b_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Knowledge.select",know_b_no);
	}

	@Override
	public int create(KnowledgeVO knowledgeVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("Knowledge.create",knowledgeVO);
	}

	@Override
	public int update(KnowledgeVO knowledgeVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("Knowledge.update", knowledgeVO);
	}

	@Override
	public KnowledgeVO selectOne(int know_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Knowledge.selectOne",know_no);
	}

	@Override
	public int delete(int know_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("Knowledge.delete",know_no);
	}

	@Override
	public List<KnowledgeVO> knowledgeListPaging(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Knowledge.knowledgeListPaging",criteria);
	}

	@Override
	public int knowledgeCount(int know_b_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Knowledge.knowledgeCount",know_b_no);
	}
	


}
