package kr.co.jsphomme.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.jsphomme.member.service.MemberService;


@Controller
public class MemberController {

	private final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	// 관리자가 회원 목록 조회 화면으로
	@RequestMapping(value =  , method = {RequestMethod.GET})
	
	public String memberListView() {
		
		return "member/memberlistView";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
