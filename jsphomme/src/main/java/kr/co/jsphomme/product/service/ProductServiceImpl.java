package kr.co.jsphomme.product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.co.jsphomme.product.dao.ProductDao;
import kr.co.jsphomme.product.vo.ProductVo;


@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	public ProductDao productDao;
	@Override
	public ProductVo productInsert() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductVo productListView() {
		// TODO Auto-generated method stub
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
