package kr.co.jsphomme.basket.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.jsphomme.basket.vo.BasketVo;

@Repository
public interface BasketDao {
	
	public int basketInsert(BasketVo basketVo);
	public List<BasketVo> basketListView(Map<String, Object> map);
	public BasketVo basketOneDeteilView();
	public int basketUpdate();
	public int basketDelete();
	public int basketSelectTotalCount();

}
