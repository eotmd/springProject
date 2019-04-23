package kr.co.jsphomme.purchaselist.service;

import java.util.List;
import java.util.Map;

import kr.co.jsphomme.member.vo.MemberVo;
import kr.co.jsphomme.purchaselist.vo.PurchaseListVo;

public interface PurchaseListService {
	public PurchaseListVo purchaseListCreate(PurchaseListVo purchaseListVo);			//구매목록 추가
	public int purchaseListCount(int memberNo);
	public List<PurchaseListVo> purchaseListView(int start, int end, int memberNo);			//구매목록 보여주기
	public int purchaseListDelete(int no);					//구매 취소
	public PurchaseListVo purchaseView();
}
