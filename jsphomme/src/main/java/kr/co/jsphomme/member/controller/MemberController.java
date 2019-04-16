package kr.co.jsphomme.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.jsphomme.member.service.MemberService;
import kr.co.jsphomme.member.vo.MemberVo;
import kr.co.jsphomme.util.Paging;


@Controller
public class MemberController {

	private final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	

	// 관리자가 회원 목록 조회 화면으로
		@RequestMapping(value ="/member/list.do" 
				, method = {RequestMethod.GET})
		
		public String memberListView(
				@RequestParam(defaultValue ="1") int curPage, 
				@RequestParam(defaultValue ="title") String searchOption,
				@RequestParam(defaultValue ="") String keyword,
				Model model) {
			
			log.info("memberListView enter! -{}", curPage);
			
			log.debug(": {}", searchOption);
			log.debug(": {}", keyword);
			
			int totalCount = 
					memberService.memberSelectTotalCount(searchOption, keyword);
			
			Paging memberPaging = new Paging(totalCount, curPage);
			int start = memberPaging.getPageBegin();
			int end = memberPaging.getPageEnd();

			List<MemberVo> memberList = 
					memberService.memberListView(
							searchOption, keyword, start, end);
			
			Map<String, Object> pagingMap = new HashMap<>();
			pagingMap.put("totalCount", totalCount);
			pagingMap.put("memberPaging", memberPaging);

			model.addAttribute("memberList", memberList);
			model.addAttribute("pagingMap", pagingMap);
			model.addAttribute("keyword", keyword);
			model.addAttribute("searchOption", searchOption);
			
			return "member/memberListView";
		}
	
		@RequestMapping(value = "/member/detail.do")
		public String  memberOneDeteilView(int memberNo, Model model) {
			log.debug("Welcome memberOneDeteilView enter! - {}", memberNo);

			Map<String, Object> map = (Map<String, Object>) memberService.memberOneDeteilView(memberNo);

			MemberVo memberVo = (MemberVo) map.get("memberVo");

			model.addAttribute("memberVo", memberVo);
			
			return "member/memberListOneView";
		}
	
		@RequestMapping(value = "/member/add.do", method = RequestMethod.GET)
		public String memberAdd(Model model) {
			log.debug("Welcome MemberController memberAdd 페이지 이동! ");

			return "member/memberRegisterForm";
		}
		
		@RequestMapping(value = "/member/addCtr.do", method = RequestMethod.POST)
		public String memberAdd(MemberVo memberVo, MultipartHttpServletRequest multipartHttpServletRequest, Model model) {
			log.trace("Welcome MemberController memberAdd 신규등록 처리! " + memberVo);

			try {
				memberService.memberInsert(memberVo, multipartHttpServletRequest);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				
				e.printStackTrace();
			}

			return "redirect:/member/detail.do";
		}
		
		@RequestMapping(value = "/auth/login.do", method = RequestMethod.GET)
		public String login(HttpSession session, Model model) {
			log.debug("Welcome MemberController login 페이지 이동! ");

			return "auth/loginForm";
		}
	
		
		@RequestMapping(value = "/auth/loginCtr.do", method = RequestMethod.POST)
		public String loginCtr(String id, String password, HttpSession session, Model model) {
			log.debug("Welcome MemberController loginCtr! " + id + ", " + password);

			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("id", id);
			paramMap.put("password", password);

			MemberVo memberVo = memberService.memberExist(paramMap);

			String viewUrl = "";
			if (memberVo != null) {
				// 회원이 존재한다면 세션에 담고
				// 마이페이지로 이동
				session.setAttribute("memberVo", memberVo);

				viewUrl = "/common/siteMainPage";
			} else {
				viewUrl = "/auth/loginFail";
			}

			return viewUrl;
		}
	
		
	
		

		
	
	
	
	
	
	
	
	
	
	
}
