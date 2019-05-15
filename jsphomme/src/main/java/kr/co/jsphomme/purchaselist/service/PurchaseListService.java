package kr.co.jsphomme.purchaselist.service;

import java.util.List;
import java.util.Map;

import kr.co.jsphomme.member.vo.MemberVo;
import kr.co.jsphomme.purchaselist.vo.PurchaseListVo;

public interface PurchaseListService {
	public PurchaseListVo purchaseListCreate(PurchaseListVo purchaseListVo,int[] productNoArr,String[] productSizeArr,int[] purchaseQuantityArr,int[] basketNo);			//구매목록 생성
	public int purchaseListCount(int memberNo);											//해당회원 구매품의 갯수
	public int purchaseListCount();											//해당회원 구매품의 갯수
	public List<PurchaseListVo> purchaseListView(int start, int end, int memberNo);		//구매목록 보여주기
	public List<PurchaseListVo> allPurchaseListView(int start, int end);		//구매목록 보여주기
	public int purchaseListDelete(int memberNo);										//구매목록 삭제(회원탈퇴)
	public PurchaseListVo purchaseView();	
	
}
