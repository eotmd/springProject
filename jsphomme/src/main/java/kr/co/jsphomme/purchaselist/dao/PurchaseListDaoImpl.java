package kr.co.jsphomme.purchaselist.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jsphomme.purchaselist.vo.PurchaseListVo;

@Repository
public class PurchaseListDaoImpl implements PurchaseListDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "kr.co.jsphomme.";
	
	@Override
	public PurchaseListVo purchaseListInsert(PurchaseListVo purchaseListVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PurchaseListVo purchaseListView(PurchaseListVo purchaseListVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int purchaseListDelete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
