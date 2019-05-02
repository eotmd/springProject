package kr.co.jsphomme.basket.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jsphomme.basket.vo.BasketVo;

@Repository
public class BasketDaoImpl implements BasketDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "kr.co.jsphomme.basket.";

	@Override
	public int basketInsert(BasketVo basketVo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "basketInsert", basketVo);
	}

	@Override
	public List<BasketVo> basketListView(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(namespace + "basketListView", map);
	}

	@Override
	public BasketVo basketOneDeteilView() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int basketUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int basketDelete() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int basketSelectTotalCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "basketSelectTotalCount");
	}

}
