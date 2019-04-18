package kr.co.jsphomme.product.service;

import java.util.List;

import kr.co.jsphomme.product.vo.ProductVo;


public interface ProductService {
	
	public ProductVo productInsert();			//물품 등록
	public List<ProductVo> productListView();
//			String searchOption, String keyword, int start, int end);			//물품 리스트
	public ProductVo productOneDeteilView(int productNo);	//물품 상세 정보
	public int productUpdate();					//물품 수정
	public int productDelete();					//물품 삭제
//	public int productSelectTotalCount(String searchOption, String keyword);
	
}
