package kr.co.jsphomme.product.dao;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.jsphomme.product.vo.ProductVo;

public interface ProductDao {
	public int productInsert(
			ProductVo productVo);			//물품 등록
	public List<ProductVo> productListView(
			/* String searchOption, String keyword, */ int start, int end);			//물품 리스트
	public ProductVo productOneDeteilView(int productNo);	//물품 상세 정보
	public int productUpdate();			//물품 수정
	public int productDelete();
	public int productSelectTotalCount();
}
