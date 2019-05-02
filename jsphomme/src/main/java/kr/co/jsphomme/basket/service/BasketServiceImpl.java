package kr.co.jsphomme.basket.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jsphomme.basket.dao.BasketDao;
import kr.co.jsphomme.basket.vo.BasketVo;
import kr.co.jsphomme.product.dao.ProductDao;

@Service
public class BasketServiceImpl implements BasketService{

	@Autowired
	public BasketDao basketDao;
	
	@Autowired
	public ProductDao productDao;

	@Override
	public int basketInsert(BasketVo basketVo) {
		// TODO Auto-generated method stub
		
		return basketDao.basketInsert(basketVo);
	}

	@Override
	public List<BasketVo> basketListView(int memberNo) {
		// TODO Auto-generated method stub

		Map<String, Object> map = new HashMap();
		
		map.put("memberNo", memberNo);
		
		return basketDao.basketListView(map);
	}

	@Override
	public BasketVo basketOneDeteilView() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int basketUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int basketDelete() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int basketSelectTotalCount() {
		// TODO Auto-generated method stub
		return basketDao.basketSelectTotalCount();
	}

}
