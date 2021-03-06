package kr.co.jsphomme.purchaselist.controller;


import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jsphomme.member.vo.MemberVo;
import kr.co.jsphomme.product.controller.ProductController;
import kr.co.jsphomme.product.vo.ProductVo;
import kr.co.jsphomme.purchaselist.service.PurchaseListService;
import kr.co.jsphomme.purchaselist.vo.PurchaseListVo;
import kr.co.jsphomme.util.Paging;
import kr.co.jsphomme.util.adminPaging;

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
	
	@RequestMapping(value="/purchase/allList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String userAllPurchaseListView(@RequestParam(defaultValue ="1") int curPage, HttpSession session, Model model) {
		
		log.debug("구매목록 컨트롤러All : {}" + curPage);
		
		MemberVo memberVo = (MemberVo)session.getAttribute("_memberVo_");
		
		if(memberVo == null) {
			return "redirect:/auth/login.do";
		}
		if(!(memberVo.getAuthority()).equals("0")) {
			return "redirect:/auth/login.do";
		}
			
			
		int allNum = purchaseListService.purchaseListCount();
		
		
		
		adminPaging allPurchaseListPaging = new adminPaging(allNum, curPage);
		
		int start = allPurchaseListPaging.getPageBegin();
		int end = allPurchaseListPaging.getPageEnd();
		

			
		List<PurchaseListVo> purchaseList = purchaseListService.allPurchaseListView(start, end);
		
			

		
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", allNum);
		pagingMap.put("paging", allPurchaseListPaging);
		
		
		model.addAttribute("pagingMap",pagingMap);
		model.addAttribute("purchaseList", purchaseList);
		
		return "purchaseList/allPurchaseListView";
	}
	
	
	@RequestMapping(value="/purchase/view.do", method = RequestMethod.GET)
	public String PurchaseView(PurchaseListVo purchaseListVo, HttpSession session, Model model) {
		log.debug("결제페이지이동 컨트롤러 : {}" + purchaseListVo);
		
		MemberVo memberVo = (MemberVo)session.getAttribute("_memberVo_");
		
		if(memberVo == null) {
			return "redirect:/auth/login.do";
		}
		List<PurchaseListVo> purchaseList = new ArrayList<PurchaseListVo>();
		purchaseList.add(purchaseListVo);
		
		model.addAttribute("purchaseListVo", purchaseList);
		
		
		
		return "purchaseList/purchaseViewForm";
	}
	
	
	@RequestMapping(value="/purchase/finish.do", method = RequestMethod.POST)
	public String PurchaseListInsert(PurchaseListVo purchaseListVo,int[] productNoArr, String[] productSizeArr, int[] purchaseQuantityArr,@RequestParam(defaultValue ="0") int[] basketNo, HttpSession session, Model model) {
		log.debug("결제완료 컨트롤러 - purchaseListVo: {}" + purchaseListVo);
		log.debug("결제완료 컨트롤러 - productNo: {}" + productNoArr);
		log.debug("결제완료 컨트롤러 - productSize: {}" + productSizeArr);
		log.debug("결제완료 컨트롤러 - purchaseQuantity: {}" + purchaseQuantityArr);
		
		MemberVo memberVo = (MemberVo)session.getAttribute("_memberVo_");
		
		if(memberVo == null) {
			return "redirect:/auth/login.do";
		
		}
		
			
		
		try {
			
			purchaseListService.purchaseListCreate(purchaseListVo,productNoArr,productSizeArr,purchaseQuantityArr,basketNo);
			
		} catch (Exception e) {
			// TODO: handle exception
			
			return "/common/soldOutPage";
		}
		

		
		return "redirect:/purchase/list.do";
	}
	/*
	 * @RequestMapping(value="/purchase/finish.do", method = RequestMethod.POST)
	 * public String PurchaseListInsert(PurchaseListVo
	 * purchaseListVo,HttpServletRequest req , HttpSession session, Model model) {
	 * log.debug("결제완료 컨트롤러 : {}" + purchaseListVo);
	 * 
	 * MemberVo memberVo = (MemberVo)session.getAttribute("_memberVo_");
	 * 
	 * if(memberVo == null) { return "redirect:/auth/login.do";
	 * 
	 * }
	 * 
	 * 
	 * try {
	 * 
	 * purchaseListService.purchaseListCreate(purchaseListVo);
	 * 
	 * } catch (Exception e) { // TODO: handle exception return
	 * "/common/soldOutPage"; }
	 * 
	 * 
	 * 
	 * return "redirect:/purchase/list.do"; }
	 */	
//	
}
