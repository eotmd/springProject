package kr.co.jsphomme.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.jsphomme.member.vo.MemberVo;

public interface MemberService {
	
	public void memberInsertOne(MemberVo memberVo);			//회원 가입
	public List<MemberVo> memberListView(String searchOption, String keyword, int start, int end);		//회원 리스트
	public Map<String, Object> memberOneDeteilView(int memberNo);	//회원 상세 정보
	public MemberVo memberExist(Map<String, Object> paramMap);		//회원로그인

	public int memberUpdateOne(MemberVo memberVo);				//정보 수정
	public int memberDelete(int memberNo);				//관리자가 회원 삭제
	
	// 페이징
	public int memberSelectTotalCount(String searchOption, String keyword);
	
}
