package kr.co.jsphomme.basket.service;

import java.util.List;

import kr.co.jsphomme.basket.vo.BasketVo;

public interface BasketService {
	
	public int basketInsert(BasketVo basketVo);
	public List<BasketVo> basketListView(int memberNo);
	public BasketVo basketOneDeteilView();
	public int basketUpdate();
	public int basketDelete();
	public int basketSelectTotalCount();

}
