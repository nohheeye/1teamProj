package com.spring.wewind.service;

import java.util.List;

import com.spring.wewind.Criteria;
import com.spring.wewind.vo.ActivityVO;
import com.spring.wewind.vo.BaramVO;

public interface ActivityService {
	public List<ActivityVO> select(int acti_b_no) throws Exception;
	public List<BaramVO> select2(int acti_b_no) throws Exception;

	
	public int update(ActivityVO activityVO) throws Exception;

	public int create(ActivityVO activityVO) throws Exception;
	
	public ActivityVO selectOne(int acti_no) throws Exception;
	
	public int delete(int acti_no) throws Exception;
	
	//����¡
	public List<ActivityVO> activityListPaging(Criteria criteria) throws Exception;
	//ī��Ʈ
	public int activityCount(int acti_no) throws Exception;
}
