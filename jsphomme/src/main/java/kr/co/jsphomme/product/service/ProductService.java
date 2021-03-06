package kr.co.jsphomme.product.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.jsphomme.product.vo.ProductVo;


public interface ProductService {
	
	public void productInsert(
			ProductVo productVo, MultipartHttpServletRequest multipartHttpServletRequest);			//물품 등록
	public List<ProductVo> productListView(String keyword, int start, int end);			//물품 리스트
	public List<ProductVo> productHideListView(String keyword, int start, int end);
	public ProductVo productOneDeteilView(int productNo);	//물품 상세 정보
	public int productUpdate(
			ProductVo productVo, MultipartHttpServletRequest multipartHttpServletRequest);					//물품 수정
	public int productDelete(int productNo);					//물품 삭제
	public int productSelectTotalCount(String keyword);
	public int hideProductSelectTotalCount(String keyword);
	public int productStatusUpdate(int productNo, int status);
}
