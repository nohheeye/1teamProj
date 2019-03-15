package com.spring.wewind.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

//import com.spring.wewind.util.Constant;
import com.spring.wewind.vo.ScheduleVO;

@Repository
public class ScheduleDaoImpl implements ScheduleDao{
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ScheduleVO> scheduleList(){
		return sqlSession.selectList("schedule.scheduleList");
	}
	
	@Override
	public void scheduleWrite(ScheduleVO vo) {
		sqlSession.insert("schedule.scheduleWrite", vo);
	}
	
	@Override
	public ScheduleVO scheduleContentView(String sch_no) {
		return sqlSession.selectOne("schedule.scheduleContentView", sch_no);
				
	}
	
	@Override
	public void scheduleDelete(String sch_no) {
		sqlSession.delete("schedule.scheduleDelete", sch_no);
	}

	@Override
	public void scheduleModify(ScheduleVO vo) {
		sqlSession.insert("schedule.scheduleModify", vo);
	}
	
	@Override
	public ScheduleVO scheduleModifyView(String sch_no) {
		return sqlSession.selectOne("schedule.scheduleModifyView", sch_no);
	}
}
