package kr.co.jsphomme.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jsphomme.member.vo.MemberVo;


@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public MemberVo memberInsert() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVo memberListView() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVo memberOneDeteilView() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVo memberLogin() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVo memberLogout() {
		// TODO Auto-generated method stub
		return null;
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

}
