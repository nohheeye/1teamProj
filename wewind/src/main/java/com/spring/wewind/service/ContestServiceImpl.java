package com.spring.wewind.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.wewind.dao.ContestDao;
import com.spring.wewind.vo.ContestVO;

@Service
public class ContestServiceImpl implements ContestService {

	@Inject
	ContestDao contestDao;

	@Override
	public List<ContestVO> contestList() {
		return contestDao.contestList();
	}

	@Override
	public void contestWrite(ContestVO vo) {
		contestDao.contestWrite(vo);

	}

	/*
	 * @Override public ContestVO contestContentView(String contest_no) { // TODO
	 * Auto-generated method stub return null; }
	 * 
	 * @Override public void contestDelete(String contest_no) { // TODO
	 * Auto-generated method stub
	 * 
	 * }
	 * 
	 * @Override public void contestModify(ContestVO vo) { // TODO Auto-generated
	 * method stub
	 * 
	 * }
	 * 
	 * @Override public ContestVO contestModifyView(String contest_no) { // TODO
	 * Auto-generated method stub return null; }
	 */

}
