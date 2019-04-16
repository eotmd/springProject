package kr.co.jsphomme.member.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

import kr.co.jsphomme.member.vo.MemberVo;


	

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "kr.co.jsphomme.member.";
	
	@Override
	public MemberVo memberInsert(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberVo> memberListView(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "memberListView", map);
	}

	@Override
	public MemberVo memberOneDeteilView(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "memberSelectOne", memberNo);
	}

	@Override
	public MemberVo memberExist(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "memberExist", paramMap);
	}

	

	@Override
	public int memberUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int memberDelete() {
		// TODO Auto-generated method stub
		return 0;
	}

	
	@Override
	public int memberSelectTotalCount(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(
				namespace + "memberSelectTotalCount", map);
	}

	
}
