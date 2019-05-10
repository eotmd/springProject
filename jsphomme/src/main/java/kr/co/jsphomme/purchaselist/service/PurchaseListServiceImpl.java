package kr.co.jsphomme.purchaselist.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.jsphomme.basket.dao.BasketDao;
import kr.co.jsphomme.member.vo.MemberVo;
import kr.co.jsphomme.product.dao.ProductDao;
import kr.co.jsphomme.product.service.ProductService;
import kr.co.jsphomme.product.vo.ProductVo;
import kr.co.jsphomme.purchaselist.dao.PurchaseListDao;
import kr.co.jsphomme.purchaselist.vo.PurchaseListVo;

@Service
public class PurchaseListServiceImpl implements PurchaseListService {

	@Autowired
	public PurchaseListDao purchaseListDao;

	@Autowired
	public ProductDao productDao;
	@Autowired
	public BasketDao basketDao;
	
	
	@Transactional
	@Override
	public PurchaseListVo purchaseListCreate(PurchaseListVo purchaseListVo,int[] productNoArr,String[] productSizeArr,int[] purchaseQuantityArr,int[] basketNo) {
		// TODO Auto-generated method stub
		
		ProductVo productVo = null;
		int minusQuantity = 0;
		int productNo = 0;
		
		for (int i = 0; i < productNoArr.length; i++) {
			purchaseListVo.setProductNo(productNoArr[i]);
			purchaseListVo.setProductSize(productSizeArr[i]);
			purchaseListVo.setPurchaseQuantity(purchaseQuantityArr[i]);
			
			minusQuantity = -purchaseListVo.getPurchaseQuantity();
			productNo = purchaseListVo.getProductNo();
			productVo = new ProductVo();
			
			productVo.setQuantity(minusQuantity);
			productVo.setProductNo(productNo);
			
			productDao.productUpdate(productVo);
			
			purchaseListDao.purchaseListCreate(purchaseListVo);
			
			basketDao.basketDelete(basketNo[i]);
		}
			
		

		return null;

	}

	@Override
	public List<PurchaseListVo> purchaseListView(int start, int end, int memberNo) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("start", start);
		map.put("end", end);
		map.put("memberNo", memberNo);
		List<PurchaseListVo> purchaseList = purchaseListDao.purchaseListView(map);

		return purchaseList;
	}

	@Override
	public int purchaseListDelete(int memberNo) {
		// TODO Auto-generated method stub
		return purchaseListDao.purchaseListDelete(memberNo);
	}

	@Override
	public int purchaseListCount(int memberNo) {

		return purchaseListDao.purchaseListCount(memberNo);
	}

	@Override
	public PurchaseListVo purchaseView() {

		return purchaseListDao.purchaseView();
	}

}
