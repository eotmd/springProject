package kr.co.jsphomme.member.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jsphomme.member.dao.MemberDao;

import java.util.List;


import kr.co.jsphomme.member.vo.MemberVo;


@Service
public class MemberServiceImpl implements MemberService{
	
	
	@Autowired
	public MemberDao MemberDao;
	
	@Override
	public MemberVo memberInsert() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberVo> memberListView() {
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
