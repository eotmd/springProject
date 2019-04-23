package kr.co.jsphomme.purchaselist.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jsphomme.member.vo.MemberVo;
import kr.co.jsphomme.purchaselist.dao.PurchaseListDao;
import kr.co.jsphomme.purchaselist.vo.PurchaseListVo;


@Service
public class PurchaseListServiceImpl implements PurchaseListService{
	
	@Autowired
	public PurchaseListDao purchaseListDao; 
	
	@Override
	public PurchaseListVo purchaseListCreate(PurchaseListVo purchaseListVo) {
		// TODO Auto-generated method stub
		return purchaseListDao.purchaseListCreate(purchaseListVo);
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
	public int purchaseListDelete(int no) {
		// TODO Auto-generated method stub
		return 0;
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
