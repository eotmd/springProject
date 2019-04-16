package kr.co.jsphomme.purchaselist.dao;

import java.util.List;
import java.util.Map;

import kr.co.jsphomme.member.vo.MemberVo;
import kr.co.jsphomme.purchaselist.vo.PurchaseListVo;

public interface PurchaseListDao {
	public PurchaseListVo purchaseListInsert(PurchaseListVo purchaseListVo);			//구매목록 추가
	public List<PurchaseListVo> purchaseListView(Map<String, Object> map);			//구매목록 보여주기
	public int purchaseListCount();
	public int purchaseListDelete(int no);						//구매 취소
}
