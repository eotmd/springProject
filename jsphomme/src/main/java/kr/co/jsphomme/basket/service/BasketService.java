package kr.co.jsphomme.basket.service;

import java.util.List;

import kr.co.jsphomme.basket.vo.BasketVo;
import kr.co.jsphomme.purchaselist.vo.PurchaseListVo;

public interface BasketService {
	
	public int basketInsert(BasketVo basketVo);
	public List<BasketVo> basketListView(int memberNo);
	public int basketDelete(int basketNo);
	public int basketSelectTotalCount();
	public void basketDeleteAll(int memberNo);
	public List<PurchaseListVo> basketBuy(int[] basketNoArr);
	public void updateQuantity(int[] basketNoArr, int[] shoppingBasketQuantityArr);
}
