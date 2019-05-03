package kr.co.jsphomme.basket.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.jsphomme.basket.vo.BasketVo;
import kr.co.jsphomme.purchaselist.vo.PurchaseListVo;

@Repository
public interface BasketDao {
	
	public int basketInsert(BasketVo basketVo);
	public List<BasketVo> basketListView(Map<String, Object> map);
	public BasketVo basketOneDeteilView();
	public int basketUpdate();
	public int basketDelete(int basketNo);
	public int basketSelectTotalCount();
	public void basketDeleteAll(int memberNo);
	public List<PurchaseListVo> basketBuy(int[] basketNoArr);

}
