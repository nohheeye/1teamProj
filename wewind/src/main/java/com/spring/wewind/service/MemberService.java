package com.spring.wewind.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.wewind.dao.MemberDAO;
import com.spring.wewind.vo.BaramVO;
import com.spring.wewind.vo.MemberAuthVO;
import com.spring.wewind.vo.MemberVO;

@Service 
public class MemberService {
	
	@Inject
	public MemberDAO dao;
	
	public int insertMember(MemberVO vo) {
		return dao.insertMember(vo);
	}

	public MemberVO selectMember(String id) {
		return dao.selectMember(id);
	}
	
	public List<BaramVO> selectBaramList(String id) {
		return dao.selectBaramList(id);
	}
	
	public MemberVO login(MemberVO vo) {
		return dao.login(vo);
	}

	public int updateMember(MemberVO vo) {
		return dao.updateMember(vo);
	}
	
	public int updatePw(MemberVO vo) {
		return dao.updatePw(vo);
	}

	public int memberDelete(String id) {
		return dao.deleteMember(id);
	}

	public List<MemberVO> memberList() {
		return dao.memberList();
	}
	
	public int insertAuthNumber(MemberAuthVO vo) {
		return dao.insertAuthNumber(vo);
	}
	
	public MemberAuthVO selectAuthNumber(MemberAuthVO vo) {
		return dao.selectAuthNumber(vo);
	}

}
