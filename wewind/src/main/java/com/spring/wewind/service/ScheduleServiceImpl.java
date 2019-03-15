package com.spring.wewind.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.wewind.dao.ScheduleDao;
import com.spring.wewind.vo.ScheduleVO;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Inject
	ScheduleDao scheduleDao;

	@Override
	public List<ScheduleVO> scheduleList() {
		// TODO Auto-generated method stub
		return scheduleDao.scheduleList();
	}

	@Override
	public void scheduleWrite(ScheduleVO vo) {
		// TODO Auto-generated method stub
		scheduleDao.scheduleWrite(vo);
	}

	@Override
	public ScheduleVO scheduleContentView(String sch_no) {
		return scheduleDao.scheduleContentView(sch_no);
	}

	@Override
	public void scheduleDelete(String sch_no) {
		// TODO Auto-generated method stub
		scheduleDao.scheduleDelete(sch_no);
	}

	@Override
	public void scheduleModify(ScheduleVO vo) {
		// TODO Auto-generated method stub
		scheduleDao.scheduleModify(vo);
	}

	@Override
	public ScheduleVO scheduleModifyView(String sch_no) {
		return scheduleDao.scheduleModifyView(sch_no);
	}

}
