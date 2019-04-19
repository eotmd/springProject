package kr.co.jsphomme.member.dao;

import java.util.List;
import java.util.Map;

import kr.co.jsphomme.member.vo.MemberVo;

public interface MemberDao {
	public MemberVo memberInsert(MemberVo memberVo);			//회원 가입
	public List<MemberVo> memberListView(Map map);		//회원 리스트
	public MemberVo memberOneDeteilView(int no);	//회원 상세 정보
	public MemberVo memberExist(Map<String, Object> paramMap);		//회원로그인
//	public MemberVo memberLogout();			//회원 로그아웃
	public int memberUpdateOne(MemberVo memberVo);				//정보 수정
	public int memberDelete(int no);				//회원 탈퇴
	
	// 페이징
		public int memberSelectTotalCount(Map<String, String> map);
}
