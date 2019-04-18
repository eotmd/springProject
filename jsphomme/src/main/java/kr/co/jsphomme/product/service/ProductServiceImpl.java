package kr.co.jsphomme.product.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jsphomme.product.dao.ProductDao;
import kr.co.jsphomme.product.vo.ProductVo;
import kr.co.jsphomme.util.FileUtils;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	public ProductDao productDao;
	
	@Resource(name = "fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public ProductVo productInsert() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductVo> productListView(){
//			String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		
//		return productDao.productListView(searchOption, keyword, start, end);
		return productDao.productListView();
	}

	@Override
	public ProductVo productOneDeteilView(int productNo) {
		// TODO Auto-generated method stub
		
		return productDao.productOneDeteilView(productNo);
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
