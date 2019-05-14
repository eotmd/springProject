package kr.co.jsphomme.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.jsphomme.member.service.MemberService;
import kr.co.jsphomme.member.vo.MemberVo;
import kr.co.jsphomme.purchaselist.service.PurchaseListService;
import kr.co.jsphomme.purchaselist.service.PurchaseListServiceImpl;
import kr.co.jsphomme.util.Paging;

@Controller
public class MemberController {

	private final Logger log = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/common/main.do")

	public String mainSiteView(Model model) {

		log.debug("Welcome  siteMainPage로 이동! ");

		return "common/siteMainPage";
	}

	// 관리자가 회원 목록 조회 화면으로
	@RequestMapping(value = "/member/list.do", method = { RequestMethod.GET, RequestMethod.POST })

	public String memberListView(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "userId") String searchOption, @RequestParam(defaultValue = "") String keyword,
			HttpSession session, Model model) {

		log.debug(": {}", session.getAttribute("_memberVo_"));

		if (session.getAttribute("_memberVo_") == null) {
			return "redirect:/auth/login.do";
		}

		log.info("memberListView enter! -{}", curPage);

		log.debug(": {}", searchOption);
		log.debug(": {}", keyword);

		int totalCount = memberService.memberSelectTotalCount(searchOption, keyword);

		Paging memberPaging = new Paging(totalCount, curPage);
		int start = memberPaging.getPageBegin();
		int end = memberPaging.getPageEnd();

		List<MemberVo> memberList = memberService.memberListView(searchOption, keyword, start, end);

		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("paging", memberPaging);

		model.addAttribute("memberList", memberList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchOption", searchOption);

		return "member/memberListView";
	}

	@RequestMapping(value = "/member/detail.do")
	public String memberOneDeteilView(int memberNo, HttpSession session, Model model) {
		log.debug(": {}", session.getAttribute("_memberVo_"));

		if (session.getAttribute("_memberVo_") == null) {

			return "redirect:/auth/login.do";
		}
		log.debug("Welcome memberOneDeteilView enter! - {}", memberNo);

		Map<String, Object> map = memberService.memberOneDeteilView(memberNo);

		MemberVo memberVo = (MemberVo) map.get("memberVo");

		model.addAttribute("memberVo", memberVo);

		return "member/memberListOneView";
	}

	@RequestMapping(value = "/member/add.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String memberAdd(@RequestParam(defaultValue = "1") int judgeNumber, MemberVo memberVo, Model model) {
		log.debug("Welcome MemberController memberAdd 페이지 이동! ");

		model.addAttribute("judgeNumber", judgeNumber);
		model.addAttribute("MemberVo", memberVo);

		return "member/memberRegisterForm";
	}

	@RequestMapping(value = "/member/addCtr.do", method = RequestMethod.POST)
	public String memberAddCtr(MemberVo memberVo, Model model) {
		log.trace("Welcome MemberController memberAdd 신규등록 처리! " + memberVo);

		try {
			memberService.memberInsertOne(memberVo);
		} catch (Exception e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
		}

		return "redirect:/auth/login.do";
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
			// 사이트 메인페이지로 이동
			session.setAttribute("_memberVo_", memberVo);

			viewUrl = "redirect:/siteMainPage.jsp";

			// 자동로그인 아직 구현안함;;;;

//			if ( memberVo.isUseCookie() ){ // dto 클래스 안에 useCookie 항목에 폼에서 넘어온 쿠키사용 여부(true/false)가 들어있을 것임
//                // 쿠키 사용한다는게 체크되어 있으면...
//                // 쿠키를 생성하고 현재 로그인되어 있을 때 생성되었던 세션의 id를 쿠키에 저장한다.
//                Cookie cookie = new Cookie("loginCo mn nbvb okie", session.getId());
//                // 쿠키를 찾을 경로를 컨텍스트 경로로 변경해 주고...
//                cookie.setPath("/");
//                cookie.setMaxAge(60*60*24*7); // 단위는 (초)임으로 7일정도로 유효시간을 설정해 준다.
//                // 쿠키를 적용해 준다.
//                response.addCookie(cookie);
//            }

		} else {
			viewUrl = "/common/failPage";
		}

		return viewUrl;
	}

	@RequestMapping(value = "/auth/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		log.debug("Welcome MemberController logout 페이지 이동! ");

		// 세션의 객체들 파기
		session.invalidate();

		return "redirect:/siteMainPage.jsp";
	}

	@RequestMapping(value = "/member/update.do")
	public String memberUpdateOne(int memberNo, @RequestParam(defaultValue = "1") int judgeNumber, @RequestParam(defaultValue = "") String id, HttpSession session, Model model) {
		log.debug("memberVo: {}", session.getAttribute("_memberVo_"));
		log.debug("judgeNumber: {}",judgeNumber);
		log.debug("id: {}", id);

		if (session.getAttribute("_memberVo_") == null) {
			return "redirect:/auth/login.do";
		}
		log.debug("Welcome memberUpdate enter! - {}", memberNo);

		Map<String, Object> map = memberService.memberOneDeteilView(memberNo);
		
		int judgeNumber2 = memberService.memberIdOverlapCheck(id);
		
		
		MemberVo memberVo = (MemberVo) map.get("memberVo");
		
		if(!id.equals("")) {
			memberVo.setId(id);
		}
		
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("judgeNumber",judgeNumber2);

		return "member/memberUpdateForm";
	}

	@RequestMapping(value = "/member/updateCtr.do", method = RequestMethod.POST)
	public String memberUpdateCtr(HttpSession session, MemberVo memberVo, Model model) {

		log.debug("Welcome MemberController memberUpdateCtr {} ", memberVo);

		try {
			memberService.memberUpdateOne(memberVo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		MemberVo sessionMemberVo = (MemberVo) session.getAttribute("_memberVo_");
		// 세션에 객체가 존재하는지 여부
		if (sessionMemberVo != null) {
			// 세션의 값과 새로운 값이 일치하는지 여부
			// 홍길동 ㄴㅇㄹㄴㅇ
			// s1@test.com ㄴㅇㄹ33@
			// 1111 2222
			if (sessionMemberVo.getMemberNo() == memberVo.getMemberNo()) {
				MemberVo newMemberVo = new MemberVo();

				newMemberVo.setMemberNo(memberVo.getMemberNo());
				newMemberVo.setStatus(memberVo.getStatus());
				newMemberVo.setAuthority(memberVo.getAuthority());
				newMemberVo.setName(memberVo.getName());
				newMemberVo.setId(memberVo.getId());

				newMemberVo.setAddress(memberVo.getAddress());
				newMemberVo.setHp(memberVo.getHp());

				session.removeAttribute("_memberVo_");

				session.setAttribute("_memberVo_", newMemberVo);
			}
		}

		return "member/memberListOneView";
	}

	@RequestMapping(value = "/member/deleteCtr.do", method = RequestMethod.GET)
	public String memberDelete(int memberNo, Model model) {
		log.debug("Welcome MemberController memberDelete" + " 회원삭제 처리! - {}", memberNo);

		try {
			memberService.memberDelete(memberNo);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:/member/list.do";
	}

	@RequestMapping(value = "/member/leaveCtr.do", method = RequestMethod.GET)
	public String memberLeave(HttpSession session, int memberNo, Model model) {
		log.debug("Welcome MemberController memberDelete" + " 회원삭제 처리! - {}", memberNo);

		try {

			memberService.memberDelete(memberNo);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		session.invalidate();

		return "redirect:/auth/login.do";
	}

	@RequestMapping(value = "/member/overlapCheck.do", method = RequestMethod.POST)
	public String memberOverlapCheck(MemberVo memberVo, Model model) {
		log.debug("Welcome MemberController memberOverlapCheck" + " 아이디 중복체크! - {}", memberVo.getId());

		int judgeNumber = memberService.memberIdOverlapCheck(memberVo.getId());

		if (judgeNumber == 1) {

			model.addAttribute("MemberVo", memberVo);
			model.addAttribute("judgeNumber", 1);
		} else if (judgeNumber == 0) {

			model.addAttribute("MemberVo", memberVo);
			model.addAttribute("judgeNumber", 0);

		}
		
		return "/common/judgePage";
	}

	@RequestMapping(value = "/member/certificationMove.do", method = RequestMethod.GET)
	public String memberCertification(HttpSession session, Model model) {
		log.debug("Welcome MemberController memberCertification" + " 본인인증 페이지! - {}");

		if (session.getAttribute("_memberVo_") == null) {
			return "redirect:/auth/login.do";
		}

		return "/member/memberSelfCertificationPage";
	}

	@RequestMapping(value = "/member/certificationCtr.do", method = RequestMethod.POST)
	public String memberCertification(String password, HttpSession session, Model model) {
		log.debug("Welcome MemberController memberCertification" + " 비밀번호 확인! - {}", password);
		
		if (session.getAttribute("_memberVo_") == null) {
			return "redirect:/auth/login.do";
		}
		MemberVo sessionMemberVo = (MemberVo)session.getAttribute("_memberVo_");
		int memberNo = sessionMemberVo.getMemberNo();
		MemberVo memberVo = memberService.memberCertification(password, memberNo);

		if (memberVo == null || !memberVo.getPassword().equals(password)) {
			return "/common/failPage2";
		}

		return "redirect:/member/update.do?memberNo=" + memberVo.getMemberNo();
	}

}
