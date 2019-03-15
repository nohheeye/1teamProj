package com.spring.wewind.dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.wewind.vo.BaramVO;
import com.spring.wewind.vo.MemberAuthVO;
import com.spring.wewind.vo.MemberVO;


@Repository 
public class MemberDAO {
	
	
	@Inject
	private SqlSession session;
	
	public int insertMember(MemberVO vo) {
		return session.insert("member.insert", vo); 
	}

	public MemberVO selectMember(String id) {
		return session.selectOne("member.select", id);
	}
	
	public List<BaramVO> selectBaramList(String id) {
		return session.selectList("member.selectBaram", id);
	}
	
	public MemberVO login(MemberVO vo) {
		return session.selectOne("member.login", vo);
	}
	
	public int updateMember(MemberVO vo) {
		return session.update("member.update", vo);
	}
	
	public int updatePw(MemberVO vo) {
		return session.update("member.updatePassword", vo);
	}

	public int deleteMember(String id) {
		return session.delete("member.delete", id);
	}

	public List<MemberVO> memberList() {
		return session.selectList("member.list");
	}
	
	public int insertAuthNumber(MemberAuthVO vo) {
		return session.insert("member.insertAuthNumber", vo);
	}
	
	public MemberAuthVO selectAuthNumber(MemberAuthVO vo) {
		return session.selectOne("member.selectAuthNumber", vo);
	}
}
