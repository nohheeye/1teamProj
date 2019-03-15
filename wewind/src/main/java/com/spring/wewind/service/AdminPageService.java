package com.spring.wewind.service;

import java.util.List;

import com.spring.wewind.Criteria;
import com.spring.wewind.vo.ActivityVO;
import com.spring.wewind.vo.AwardVO;
import com.spring.wewind.vo.BaramInfoVO;
import com.spring.wewind.vo.BaramVO;

public interface AdminPageService {
	public List<BaramVO> selectBaram() throws Exception;
	public List<BaramInfoVO> selectBaramInfo(int acti_b_no) throws Exception;
	public int createAward(AwardVO awardVO) throws Exception;
	public List<AwardVO> selectAward() throws Exception;
	
	public int updateAward(AwardVO awardVO) throws Exception;
	public int deleteAward(int a_no) throws Exception;

	//
	public List<AwardVO> awardListPaging(Criteria criteria) throws Exception;

	//페이징처리 - 활동내역
	public List<BaramVO> activityListPaging(Criteria criteria) throws Exception;
		
	//수상내역 list count
	public int awardCount(Criteria criteria) throws Exception;
	//활동내역 list count
	public int activityCount(Criteria criteria) throws Exception;
}
