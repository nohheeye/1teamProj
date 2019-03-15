package com.spring.wewind.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.wewind.Criteria;
import com.spring.wewind.vo.ActivityVO;
import com.spring.wewind.vo.BaramVO;

@Repository
public class ActivityDAOImpl implements ActivityDAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<ActivityVO> select(int acti_b_no) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("여기는 activity select");
		return sqlSession.selectList("Activity.select",acti_b_no);
	}

	@Override
	public int update(ActivityVO activityVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("Activity.update",activityVO );
	}

	@Override
	public int create(ActivityVO activityVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("dao 에서 한글 테스트"+activityVO.getActi_b_no());
		return sqlSession.insert("Activity.create",activityVO);
	
	}

	@Override
	public ActivityVO selectOne(int acti_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Activity.selectOne", acti_no);
		
	}

	@Override
	public int delete(int acti_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("Activity.delete",acti_no);
	}

	@Override
	public List<BaramVO> select2(int acti_b_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Activity.select2",acti_b_no);
	}

	@Override
	public List<ActivityVO> activityListPaging(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub

		return sqlSession.selectList("Activity.activityListPaging", criteria);
	}

	@Override
	public int activityCount(int acti_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Activity.activityCount",acti_no);
	}

}
