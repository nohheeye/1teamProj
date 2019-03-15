package com.spring.wewind.service;

import java.util.List;

import com.spring.wewind.Criteria;
import com.spring.wewind.vo.ActivityVO;
import com.spring.wewind.vo.BaramVO;
import com.spring.wewind.vo.KnowledgeVO;

public interface KnowledgeService {
	public List<KnowledgeVO> select(int know_b_no) throws Exception;
	public int create(KnowledgeVO knowledgeVO) throws Exception;
	public int update(KnowledgeVO knowledgeVO) throws Exception;
	public KnowledgeVO selectOne(int know_no) throws Exception;
	public int delete(int know_no) throws Exception;
	
	//페이징
	public List<KnowledgeVO> knowledgeListPaging(Criteria criteria) throws Exception;
	//카운트
	public int knowledgeCount(int know_b_no) throws Exception;
}
