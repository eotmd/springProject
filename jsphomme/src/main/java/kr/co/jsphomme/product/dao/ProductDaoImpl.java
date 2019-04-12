package kr.co.jsphomme.product.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import kr.co.jsphomme.product.vo.ProductVo;

public class ProductDaoImpl implements ProductDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "kr.co.jsphomme";
	
	@Override
	public ProductVo productInsert() {
		// TODO Auto-generated method stub
		
		
		
		return null;
	}

	@Override
	public ProductVo productListView() {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap();
		
//		map.compute(key, remappingFunction)
		
		return null;
	}

	@Override
	public ProductVo productOneDeteilView() {
		// TODO Auto-generated method stub
		return null;
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

}
