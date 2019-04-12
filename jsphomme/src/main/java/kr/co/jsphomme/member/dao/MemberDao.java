package kr.co.jsphomme.member.dao;

import kr.co.jsphomme.member.vo.MemberVo;

public interface MemberDao {
	public MemberVo memberInsert();			//회원 가입
	public MemberVo memberListView();		//회원 리스트
	public MemberVo memberOneDeteilView();	//회원 상세 정보
	public MemberVo memberLogin();			//회원로그인
	public MemberVo memberLogout();			//회원 로그아웃
	public int memberUpdate();				//정보 수정
	public int memberDelete();				//회원 탈퇴
}
