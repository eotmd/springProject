package kr.co.jsphomme.purchaselist.controller;



import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jsphomme.purchaselist.service.PurchaseListService;
import kr.co.jsphomme.purchaselist.vo.PurchaseListVo;

@Controller
public class PurchaseListController {
	
	
	@Autowired
	private PurchaseListService purchaseListService;
	
	@RequestMapping(value="/purchaseList.do")
	public String PurchaseListView(Model model) {
		
		
		model.addAttribute("purchaseList", purchaseListService.purchaseListView());
		
		return "purchaseList/purchaseListViewForm";
	}
}
