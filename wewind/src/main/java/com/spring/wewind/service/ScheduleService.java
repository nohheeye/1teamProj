package com.spring.wewind.service;

import java.util.List;

import com.spring.wewind.vo.ScheduleVO;

public interface ScheduleService {
	public List<ScheduleVO> scheduleList();
	public void scheduleWrite(ScheduleVO vo);
	public ScheduleVO scheduleContentView(String sch_no);
	public void scheduleDelete(String sch_no);
	public void scheduleModify(ScheduleVO vo);
	public ScheduleVO scheduleModifyView(String sch_no);
}
