package com.spring.wewind.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.wewind.Criteria;
import com.spring.wewind.dao.ActivityDAO;
import com.spring.wewind.vo.ActivityVO;
import com.spring.wewind.vo.BaramVO;

@Service
public class ActivityServiceImpl implements ActivityService{

	@Inject
	ActivityDAO dao;
	
	@Override
	public List<ActivityVO> select(int acti_b_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.select(acti_b_no);
	}

	@Override
	public int update(ActivityVO activityVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.update(activityVO);
	}

	@Override
	public int create(ActivityVO activityVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.create(activityVO);
	}

	@Override
	public ActivityVO selectOne(int acti_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectOne(acti_no);
	}

	@Override
	public int delete(int acti_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.delete(acti_no);
	}

	@Override
	public List<BaramVO> select2(int acti_b_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.select2(acti_b_no);
	}

	@Override
	public List<ActivityVO> activityListPaging(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.activityListPaging(criteria);
	}

	@Override
	public int activityCount(int acti_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.activityCount(acti_no);
	}

}
