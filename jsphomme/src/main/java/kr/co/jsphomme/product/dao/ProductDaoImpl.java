package kr.co.jsphomme.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.jsphomme.product.vo.ProductVo;

@Repository
public class ProductDaoImpl implements ProductDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "kr.co.jsphomme.product.";
	
	@Override
	public int productInsert(ProductVo productVo) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert(namespace + "productInsert", productVo);
	}

	@Override
	public List<ProductVo> productListView(Map<String,Object> map) {
		// TODO Auto-generated method stub
		

		return sqlSession.selectList(namespace + "productListView", map);
	}

	@Override
	public ProductVo productOneDeteilView(int productNo) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne(
				namespace + "productOneDeteilView", productNo);
	}

	@Override
	public int productUpdate(ProductVo productVo) {
		// TODO Auto-generated method stub
		
		return sqlSession.update(namespace + "productUpdate", productVo);
	}

	@Override
	public int productDelete() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int productSelectTotalCount(String keyword) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "productSelectTotalCount", keyword);
	}

}
