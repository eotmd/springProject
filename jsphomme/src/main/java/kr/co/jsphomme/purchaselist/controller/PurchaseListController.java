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
	
	@RequestMapping(value="/purchaseList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String PurchaseListView(@RequestParam(defaultValue ="1") int curPage,Model model) {
		
		int num = purchaseListService.purchaseListCount();
		
		Paging purchaseListPaging = new Paging(num, curPage);
		
		int start = purchaseListPaging.getPageBegin();
		int end = purchaseListPaging.getPageEnd();
		
		List<PurchaseListVo> purchaseList = purchaseListService.purchaseListView(start, end);
		
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", num);
		pagingMap.put("paging", purchaseListPaging);
		
		
		model.addAttribute("pagingMap",pagingMap);
		model.addAttribute("purchaseList", purchaseList);
		
		return "purchaseList/purchaseListViewForm";
	}
	
	@RequestMapping(value="/purchaseView.do", method = RequestMethod.GET)
	public String PurchaseView(HttpServletRequest req, Model model) {
		
		
		
		
		return "";
	}
	
//	@RequestMapping(value="/purchaseListInsert.do", method = RequestMethod.GET)
//	public String PurchaseListInsert(HttpServletRequest req, Model model) {
//		
//		
//		req.getAttribute("")
//		
//		
//		
//		
//		
//		
//		return "";
//	}
//	
}
