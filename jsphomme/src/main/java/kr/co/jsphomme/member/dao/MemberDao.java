package kr.co.jsphomme.member.dao;

import java.util.List;
import java.util.Map;

import kr.co.jsphomme.member.vo.MemberVo;

public interface MemberDao {
	public int memberInsertOne(MemberVo memberVo);			//회원 가입
	public List<MemberVo> memberListView(Map<String, Object> map);		//회원 리스트
	public MemberVo memberOneDeteilView(int memberNo);	//회원 상세 정보
	public MemberVo memberExist(Map<String, Object> paramMap);		//회원로그인
//	public MemberVo memberLogout();			//회원 로그아웃
	public int memberUpdateOne(MemberVo memberVo);				//정보 수정
	public int memberDelete(int memberNo);				//관리자가 회원 삭제
	
	// 페이징
	public int memberSelectTotalCount(Map<String, String> map);
	public int memberIdOverlapCheck(String overlapIdCheck);
	public MemberVo memberCertification(Map<String, Object> map);
}
