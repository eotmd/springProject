package kr.co.jsphomme.purchaselist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jsphomme.purchaselist.service.PurchaseListService;

@Controller
public class PurchaseListController {
	
	
	@Autowired
	private PurchaseListService purchaseListService;
	
//	@RequestMapping(value="purchaseList.do")
}
