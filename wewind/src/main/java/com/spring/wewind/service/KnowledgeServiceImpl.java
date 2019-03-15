package com.spring.wewind.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.wewind.Criteria;
import com.spring.wewind.dao.ActivityDAO;
import com.spring.wewind.dao.KnowledgeDAO;
import com.spring.wewind.vo.ActivityVO;
import com.spring.wewind.vo.BaramVO;
import com.spring.wewind.vo.KnowledgeVO;

@Service
public class KnowledgeServiceImpl implements KnowledgeService{

	@Inject
	KnowledgeDAO dao;

	@Override
	public List<KnowledgeVO> select(int know_b_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.select(know_b_no);
	}

	@Override
	public int create(KnowledgeVO knowledgeVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.create(knowledgeVO);
	}

	@Override
	public int update(KnowledgeVO knowledgeVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.update(knowledgeVO);
	}

	@Override
	public KnowledgeVO selectOne(int know_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectOne(know_no);
	}

	@Override
	public int delete(int know_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.delete(know_no);
	}

	@Override
	public List<KnowledgeVO> knowledgeListPaging(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.knowledgeListPaging(criteria);
	}

	@Override
	public int knowledgeCount(int know_b_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.knowledgeCount(know_b_no);
	}
	


}
