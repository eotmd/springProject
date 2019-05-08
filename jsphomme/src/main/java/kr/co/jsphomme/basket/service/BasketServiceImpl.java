package kr.co.jsphomme.basket.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jsphomme.basket.dao.BasketDao;
import kr.co.jsphomme.basket.vo.BasketVo;
import kr.co.jsphomme.product.dao.ProductDao;
import kr.co.jsphomme.purchaselist.vo.PurchaseListVo;

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
	public int basketDelete(int basketNo) {
		// TODO Auto-generated method stub
		
		return basketDao.basketDelete(basketNo);
	}

	@Override
	public int basketSelectTotalCount() {
		// TODO Auto-generated method stub
		return basketDao.basketSelectTotalCount();
	}

	@Override
	public void basketDeleteAll(int memberNo) {
		// TODO Auto-generated method stub
		
		basketDao.basketDeleteAll(memberNo);
	}

	@Override
	public List<PurchaseListVo> basketBuy(int[] basketNoArr) {
		// TODO Auto-generated method stub
		
		List<PurchaseListVo> list = new ArrayList<PurchaseListVo>();
		PurchaseListVo purchaseListVo = null;
		
		for (int i = 0; i < basketNoArr.length; i++) {
			
			purchaseListVo = basketDao.basketBuy(basketNoArr[i]);
			
			list.add(purchaseListVo);
		}
		
		return list;
	}

}
