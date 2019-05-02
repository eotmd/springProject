package kr.co.jsphomme.purchaselist.controller;


import java.util.List;
import java.util.HashMap;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jsphomme.member.vo.MemberVo;
import kr.co.jsphomme.product.controller.ProductController;
import kr.co.jsphomme.product.vo.ProductVo;
import kr.co.jsphomme.purchaselist.service.PurchaseListService;
import kr.co.jsphomme.purchaselist.vo.PurchaseListVo;
import kr.co.jsphomme.util.Paging;

@Controller
public class PurchaseListController {
	
	private final Logger log = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private PurchaseListService purchaseListService;
	
	@RequestMapping(value="/purchase/list.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String PurchaseListView(@RequestParam(defaultValue ="1") int curPage, HttpSession session, Model model) {
		
		log.debug("구매목록 컨트롤러 : {}" + curPage);
		
		MemberVo memberVo = (MemberVo)session.getAttribute("_memberVo_");
		
		if(memberVo == null) {
			return "redirect:/auth/login.do";
		}
		
		int memberNo = memberVo.getMemberNo();
		
		
		System.out.println("회원번호:"+memberVo.getMemberNo());
		
		
			
		int num = purchaseListService.purchaseListCount(memberNo);
		
		
		
		Paging purchaseListPaging = new Paging(num, curPage);
		
		int start = purchaseListPaging.getPageBegin();
		int end = purchaseListPaging.getPageEnd();
		

			
		List<PurchaseListVo> purchaseList = purchaseListService.purchaseListView(start, end, memberNo);
		
			

		
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", num);
		pagingMap.put("paging", purchaseListPaging);
		
		
		model.addAttribute("pagingMap",pagingMap);
		model.addAttribute("purchaseList", purchaseList);
		
		return "purchaseList/purchaseListViewForm";
	}
	
	@RequestMapping(value="/purchase/view.do", method = RequestMethod.GET)
	public String PurchaseView(PurchaseListVo purchaseListVo, HttpSession session, Model model) {
		log.debug("결제페이지이동 컨트롤러 : {}" + purchaseListVo);
		MemberVo memberVo = (MemberVo)session.getAttribute("_memberVo_");
		
		if(memberVo == null) {
			return "redirect:/auth/login.do";
		}
		
		
		
		
		model.addAttribute("purchaseListVo", purchaseListVo);
		
		return "purchaseList/purchaseViewForm";
	}
	
	@RequestMapping(value="/purchase/finish.do", method = RequestMethod.POST)
	public String PurchaseListInsert(PurchaseListVo purchaseListVo,HttpServletRequest req , HttpSession session, Model model) {
		log.debug("결제완료 컨트롤러 : {}" + purchaseListVo);
		MemberVo memberVo = (MemberVo)session.getAttribute("_memberVo_");
		
		if(memberVo == null) {
			return "redirect:/auth/login.do";
		
		}
		purchaseListService.purchaseListCreate(purchaseListVo);
		

		
		return "redirect:/purchase/list.do";
	}
	
//	
}
