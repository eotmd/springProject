package kr.co.jsphomme.purchaselist.controller;


import java.util.List;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jsphomme.product.vo.ProductVo;
import kr.co.jsphomme.purchaselist.service.PurchaseListService;
import kr.co.jsphomme.purchaselist.vo.PurchaseListVo;
import kr.co.jsphomme.util.Paging;

@Controller
public class PurchaseListController {
	
	
	@Autowired
	private PurchaseListService purchaseListService;
	
	@RequestMapping(value="/purchase/list.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String PurchaseListView(@RequestParam(defaultValue ="1") int curPage, int memberNo ,HttpServletRequest req ,Model model) {
		
		int num = 0;
		
		if(req.getAttribute("memberNo") == null) {
			
			num = purchaseListService.purchaseListCount(memberNo);
		}else {
			
			num = purchaseListService.purchaseListCount((Integer)req.getAttribute("memberNo"));
		}
		
		
		Paging purchaseListPaging = new Paging(num, curPage);
		
		int start = purchaseListPaging.getPageBegin();
		int end = purchaseListPaging.getPageEnd();
		
		List<PurchaseListVo> purchaseList = null;
		
		if(req.getAttribute("memberNo") == null) {
			
			
			purchaseList = purchaseListService.purchaseListView(start, end, memberNo);
		}else {
			
			
			purchaseList = purchaseListService.purchaseListView(start, end, (Integer)req.getAttribute("memberNo"));
			
		}
		
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", num);
		pagingMap.put("paging", purchaseListPaging);
		
		
		model.addAttribute("pagingMap",pagingMap);
		model.addAttribute("purchaseList", purchaseList);
		
		return "purchaseList/purchaseListViewForm";
	}
	
	@RequestMapping(value="/purchase/view.do", method = RequestMethod.GET)
	public String PurchaseView(PurchaseListVo purchaseListVo, Model model) {
		
		
		model.addAttribute("purchaseListVo", purchaseListVo);
		
		return "purchaseList/purchaseViewForm";
	}
	
	@RequestMapping(value="/purchase/finish.do", method = RequestMethod.POST)
	public String PurchaseListInsert(PurchaseListVo purchaseListVo,HttpServletRequest req ,Model model) {
		
		purchaseListService.purchaseListCreate(purchaseListVo);
		
		
		req.setAttribute("memberNo", purchaseListVo.getMemberNo());
		req.setAttribute("memberName", req.getParameter("name"));
		
		return "forward:/purchase/list.do";
	}
//	
}
