package kr.co.jsphomme.product.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jsphomme.product.service.ProductService;

@Controller
public class ProductController {

	private final Logger log = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/product/list.do",
			method= {RequestMethod.GET})
	public String productList(
			@RequestParam(defaultValue ="1") int curPage,
			@RequestParam(defaultValue ="title") String searchOption,
			@RequestParam(defaultValue ="") String keywoed,
			Model model) {
		
		log.debug("Welcome ProductController productList! : {}", curPage);
		log.debug(": {}", searchOption);
		log.debug(": {}", keywoed);
		
//		int totalCount =
				
		
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
