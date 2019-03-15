package com.spring.wewind.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.wewind.vo.BaramVO;
import com.spring.wewind.vo.CategoryVO;


@Repository
public class BaramDAOImpl implements BaramDAO{

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<BaramVO> select() throws Exception {
		// TODO Auto-generated method stub
    	System.out.println("여기는 DAO");
		return sqlSession.selectList("Baram.select");
	}

	@Override
	public int update(BaramVO baramVO) throws Exception {
		// TODO Auto-generated method stub
	   	System.out.println("여기는 DAO");
		 
		return sqlSession.update("Baram.update",baramVO);
	}
	
	@Override
	public int create(BaramVO baramVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("dao 에서 한글 테스트"+baramVO.getB_name());
		return sqlSession.insert("Baram.create",baramVO);
	}
	
	@Override
	public BaramVO selectOne(int b_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Baram.selectOne", b_no);
	}

	@Override
	public String getTime() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Baram.getTime");
	}

	@Override
	public int delete(int b_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("Baram.delete",b_no);
	}

	@Override
	public int idCheck(String b_name) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("여기까지는 오니??"+b_name);
		return sqlSession.selectOne("Baram.idCheck",b_name);
	}

	@Override
	public List<CategoryVO> selectCate() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Baram.selectCate");
	}

	@Override
	public List<CategoryVO> selectCatePar() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Baram.selectCatePar");
	
	}

	@Override
	public List<CategoryVO> makeCate(String b_cate_parent) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Baram.makeCate",b_cate_parent);
	}
    


}
