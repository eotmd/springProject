package kr.co.jsphomme.product.service;

import kr.co.jsphomme.product.vo.ProductVo;


public interface ProductService {
	
	public ProductVo productInsert();			//물품 등록
	public ProductVo productListView();			//물품 리스트
	public ProductVo productOneDeteilView();	//물품 상세 정보
	public int productUpdate();					//물품 수정
	public int productDelete();					//물품 삭제
	
}
