package kr.co.jsphomme.product.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.jsphomme.product.vo.ProductVo;

public interface ProductDao {
	public int productInsert(ProductVo productVo);			//물품 등록
	public List<ProductVo> productListView(Map<String,Object> map);			//물품 리스트
	public List<ProductVo> productHideListView(Map<String,Object> map);
	public ProductVo productOneDeteilView(int productNo);	//물품 상세 정보
	public int productUpdate(ProductVo productVo);			//물품 수정
	public int productDelete(int productNo);
	public int productSelectTotalCount(String keyword);
	public int hideProductSelectTotalCount(String keyword);
	public int productStatusUpdate(int productNo, int status);
}
