package com.spring.wewind.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.wewind.Criteria;
import com.spring.wewind.dao.AdminPageDAO;
import com.spring.wewind.vo.AwardVO;
import com.spring.wewind.vo.BaramInfoVO;
import com.spring.wewind.vo.BaramVO;

@Service
public class AdminPageServiceImpl implements AdminPageService{

	@Inject
	AdminPageDAO dao;

	@Override
	public List<BaramVO> selectBaram() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectBaram();
	}

	@Override
	public List<BaramInfoVO> selectBaramInfo(int acti_b_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectBaramInfo(acti_b_no);
	}

	@Override
	public int createAward(AwardVO awardVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.createAward(awardVO);
	}

	@Override
	public List<AwardVO> selectAward() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectAward();
	}

	@Override
	public int updateAward(AwardVO awardVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateAward(awardVO);
	}

	@Override
	public int deleteAward(int a_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.deleteAward(a_no);
	}

	@Override
	public List<AwardVO> awardListPaging(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.awardListPaging(criteria);
	}

	@Override
	public int awardCount(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.awardCount(criteria);
	}

	@Override
	public List<BaramVO> activityListPaging(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.activityListPaging(criteria);
	}

	@Override
	public int activityCount(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.activityCount(criteria);
	}
	

}
