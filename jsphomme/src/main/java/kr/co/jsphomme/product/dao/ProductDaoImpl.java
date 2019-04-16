package kr.co.jsphomme.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jsphomme.product.vo.ProductVo;

@Repository
public class ProductDaoImpl implements ProductDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "kr.co.jsphomme.product.";
	
	@Override
	public ProductVo productInsert() {
		// TODO Auto-generated method stub
		
		
		
		return null;
	}

	@Override
	public List<ProductVo> productListView(){
//			String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		
//		Map<String, Object> map = new HashMap();
		
//		map.put("searchOption", searchOption);
//		map.put("keyword", keyword);
//		map.put("start", start);
//		map.put("end", end);
		
		
//		return sqlSession.selectList(namespace + "productListView", map);
		return sqlSession.selectList(namespace + "productListView");
	}

	@Override
	public ProductVo productOneDeteilView(int productNo) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne(
				namespace + "productOneDeteilView", productNo);
	}

	@Override
	public int productUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int productDelete() {
		// TODO Auto-generated method stub
		return 0;
	}

//	@Override
//	public int productSelectTotalCount(String searchOption, String keyword) {
//		// TODO Auto-generated method stub
//		return 0;
//	}

}
