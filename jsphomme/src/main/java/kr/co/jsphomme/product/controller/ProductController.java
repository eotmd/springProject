package kr.co.jsphomme.product.controller;

import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.jsphomme.basket.service.BasketService;
import kr.co.jsphomme.member.service.MemberService;
import kr.co.jsphomme.member.vo.MemberVo;
import kr.co.jsphomme.product.service.ProductService;
import kr.co.jsphomme.product.vo.ProductVo;
import kr.co.jsphomme.purchaselist.service.PurchaseListService;
import kr.co.jsphomme.util.Paging;

@Controller
public class ProductController {

	private final Logger log = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/product/list.do", method= {RequestMethod.GET})
	public String productListView(
			@RequestParam(defaultValue ="1") int curPage,
//			@RequestParam(defaultValue ="title") String searchOption,
			@RequestParam(defaultValue ="") String keyword,
			Model model) {
		
		log.debug("Welcome ProductController productList! : {}", curPage);
//		log.debug(": {}", searchOption);
		log.debug(": {}", keyword);
		
		int totalCount =
				productService.productSelectTotalCount(keyword);
		
		Paging paging = new Paging(totalCount, curPage);
		int start = paging.getPageBegin();
		int end = paging.getPageEnd();
		
		List<ProductVo> productList = 
				productService.productListView(
						/* searchOption,*/ keyword, start, end);
		
		Map<String, Object> pagingMap= new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("paging", paging);
		
		model.addAttribute("productList", productList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("keyword", keyword);
//		model.addAttribute("searchOption", searchOption);
				
		return "product/productListView";
	}
	
	@RequestMapping(value = "/product/detail.do")
	public String productOneDeteilView(int productNo, Model model) {
		log.debug("Welcome productOneDeteilView enter! - {}", productNo);
		
		ProductVo productVo = 
				productService.productOneDeteilView(productNo);
		
		log.debug("Welcome productOneDeteilView enter! - {}", productNo);
		
		log.debug(" - {}", productVo);
		
		model.addAttribute("productVo", productVo);
		
		return "product/productDetailView";
	}
	
	@RequestMapping(value = "/product/insert.do", method = {RequestMethod.POST})
	public String productInsert(ProductVo productVo, 
			MultipartHttpServletRequest multipartHttpServletRequest, Model model) {
		log.debug("Welcome productInsert enter! 신규 등록 처리! - {}", productVo);
		
		try {
			productService.productInsert(productVo, multipartHttpServletRequest);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("오류!");
			e.printStackTrace();
		}
		
		return "common/successPage";
	}
	
	@RequestMapping(value = "/product/insertMove.do")
	public String productInsertMove(HttpSession session) {
		
		MemberVo memberVo = (MemberVo) session.getAttribute("_memberVo_");
		
		log.debug("Welcome productInsertMove enter! - {}", memberVo);

		if (memberVo == null) {
			
			log.debug("productInsertMove fail!");
			
			return "redirect:/common/main.do";
		}
		
		if (!memberVo.getAuthority().equals("0")) {
			
			log.debug("productInsertMove fail!");
			
			return "redirect:/common/main.do";
		}
		
		return "product/productInsert";
	}
	
	@RequestMapping(value = "/product/update.do", method = RequestMethod.POST)
	public String productUpdate(
			ProductVo productVo,  
			MultipartHttpServletRequest multipartHttpServletRequest,
			Model model) {

		productService.productUpdate(productVo, multipartHttpServletRequest);
		
		log.debug("Welcome productInsertMove enter! - {}", productVo);
		
		return "common/successPage";
	}
	
	@RequestMapping(value = "/product/updateMove.do")
	public String productUpdateMove(int productNo, HttpSession session, Model model) {

		ProductVo productVo = productService.productOneDeteilView(productNo);
		MemberVo memberVo = (MemberVo) session.getAttribute("_memberVo_");
		
		log.debug("Welcome productInsertMove enter! - {}", memberVo);

		if (memberVo == null) {
			
			log.debug("productUpdateMove fail!");
			
			return "redirect:/common/main.do";
		}
		
		if (!memberVo.getAuthority().equals("0")) {
			
			log.debug("productUpdateMove fail!");
			
			return "redirect:/common/main.do";
		}
		
		log.debug("Welcome productUpdateMove enter! - {}", productVo);
		model.addAttribute("productVo", productVo);
		
		return "product/productUpdate";
	}
	
	@RequestMapping(value = "/product/delete.do", method = RequestMethod.POST)
	public String productDelete(int productNo, Model model) {
		
		log.debug("Welcome productDelete enter! - {}", productNo);
		
		productService.productDelete(productNo);
		
		return "common/successPage";
	}
	
	@RequestMapping(value = "product/statusUpdate.do", method = RequestMethod.POST)
	public String productStatusUpdate(int productNo, int status, Model model) {
		
		log.debug("Welcome productStatusUpdate enter! - {}", productNo);
		log.debug(" - {}", status);
		
		productService.productStatusUpdate(productNo, status);
		
		return "common/successPage";
	}
	
}
