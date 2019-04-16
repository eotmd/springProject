package kr.co.jsphomme.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jsphomme.member.service.MemberService;
import kr.co.jsphomme.product.service.ProductService;
import kr.co.jsphomme.product.vo.ProductVo;
import kr.co.jsphomme.util.Paging;

@Controller
public class ProductController {

	private final Logger log = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/product/list.do",
			method= {RequestMethod.GET})
	public String productListView(
//			@RequestParam(defaultValue ="1") int curPage,
//			@RequestParam(defaultValue ="title") String searchOption,
//			@RequestParam(defaultValue ="") String keyword,
			Model model) {
		
		log.debug("Welcome ProductController productList!");
//		log.debug("Welcome ProductController productList! : {}", curPage);
//		log.debug(": {}", searchOption);
//		log.debug(": {}", keyword);
		
//		int totalCount =
//				productService.productSelectTotalCount(searchOption, keyword);
		
//		Paging productPaging = new Paging(totalCount, curPage);
//		int start = productPaging.getPageBegin();
//		int end = productPaging.getPageEnd();
		
		List<ProductVo> productList = 
				productService.productListView();
//						searchOption, keyword, start, end);
		
//		Map<String, Object> pagingMap = new HashMap<>();
//		pagingMap.put("totalCount", totalCount);
//		pagingMap.put("productPaging", productPaging);
		
		model.addAttribute("productList", productList);
//		model.addAttribute("pagingMap", pagingMap);
//		model.addAttribute("keyword", keyword);
//		model.addAttribute("searchOption", searchOption);
				
		return "product/productListView";
	}
	
	@RequestMapping(value = "/product/detail.do")
	public String productOneDeteilView(int productNo, Model model) {
		log.debug("Welcome productOneDeteilView enter! - {}", productNo);
		
		ProductVo productVo = 
				productService.productOneDeteilView(productNo);
		
		model.addAttribute("productVo", productVo);
		
		return "product/productDetailView";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
