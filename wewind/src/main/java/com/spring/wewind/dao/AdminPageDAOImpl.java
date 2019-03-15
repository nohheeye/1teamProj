package com.spring.wewind.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.wewind.Criteria;
import com.spring.wewind.vo.ActivityVO;
import com.spring.wewind.vo.AwardVO;
import com.spring.wewind.vo.BaramInfoVO;
import com.spring.wewind.vo.BaramVO;

@Repository
public class AdminPageDAOImpl implements AdminPageDAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<BaramVO> selectBaram() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AdminPage.selectBaram");
	}

	@Override
	public List<BaramInfoVO> selectBaramInfo(int acti_b_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AdminPage.selectBaramInfo",acti_b_no);
	}

	@Override
	public int createAward(AwardVO awardVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("AdminPage.createAward",awardVO);
	}

	@Override
	public List<AwardVO> selectAward() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AdminPage.selectAward");
	}

	@Override
	public int updateAward(AwardVO awardVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("AdminPage.updateAward", awardVO);
	}

	@Override
	public int deleteAward(int a_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("AdminPage.deleteAward", a_no);
	}

	//∆‰¿Ã¬°√≥∏Æ award
	@Override
	public List<AwardVO> awardListPaging(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AdminPage.awardListPaging",criteria);
	}

	@Override
	public int awardCount(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AdminPage.awardCount",criteria);
	}

	@Override
	public List<BaramVO> activityListPaging(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AdminPage.activityListPaging",criteria);
	}

	@Override
	public int activityCount(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AdminPage.activityCount",criteria);
	}
	
	
}
