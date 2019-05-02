package kr.co.jsphomme.basket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.jsphomme.basket.service.BasketService;
import kr.co.jsphomme.basket.vo.BasketVo;
import kr.co.jsphomme.member.vo.MemberVo;

@Controller
public class BasketController {
	
	private final Logger log = LoggerFactory.getLogger(BasketController.class);
	
	@Autowired
	private BasketService basketService;
	
	@RequestMapping(value="/basket/list.do", method= {RequestMethod.GET})
	public String basketListView(HttpSession session, Model model) {
		
		log.debug("Welcome ProductController basketListView!");
		
		MemberVo memberVo = (MemberVo)session.getAttribute("_memberVo_");
		
		if(memberVo == null) {
			return "redirect:/auth/login.do";
		}
		
		int memberNo = memberVo.getMemberNo();
		
		log.debug(": {}", memberNo);
		
		List<BasketVo> basketList = 
				basketService.basketListView(memberNo);
		
		model.addAttribute("basketList", basketList);
		
		return "basket/basketList";
	}
	
	@RequestMapping(value="/basket/insert.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String basketInsert(HttpSession session, BasketVo basketVo, Model model) {
		
		log.debug("Welcome ProductController basketInsert! - {}", basketVo);
		
		MemberVo memberVo = (MemberVo) session.getAttribute("_memberVo_");
		
		int memberNo = memberVo.getMemberNo();
		
		basketVo.setMemberNo(memberNo);
		
		basketService.basketInsert(basketVo);
		
		return "redirect:/basket/list.do";
	}
	
	@RequestMapping(value="/basket/delete.do", method= {RequestMethod.POST})
	public String basketDelete() {
		
		return null;
	}
	
}
