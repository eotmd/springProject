package kr.co.jsphomme.product.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.jsphomme.member.dao.MemberDao;
import kr.co.jsphomme.member.dao.MemberDaoImpl;
import kr.co.jsphomme.member.service.MemberServiceImpl;
import kr.co.jsphomme.product.dao.ProductDao;
import kr.co.jsphomme.product.dao.ProductDaoImpl;
import kr.co.jsphomme.product.vo.ProductVo;
import kr.co.jsphomme.util.FileUtils;

@Service
public class ProductServiceImpl implements ProductService{

	private final Logger log = 
			LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	public ProductDao productDao;
	
	@Resource(name = "fileUtils")
	private FileUtils fileUtils;
	
	@Transactional
	@Override
	public void productInsert(
			ProductVo productVo, MultipartHttpServletRequest multipartHttpServletRequest) {
		// TODO Auto-generated method stub
		
		try {
			fileUtils.parseInsertFileInfo(productVo, multipartHttpServletRequest);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		productDao.productInsert(productVo);
		
		int productNo = productVo.getProductNo();
		
		log.debug("ProductServiceImpl productInsert enter!! {}", productVo);
		
	}

	@Override
	public List<ProductVo> productListView(
			/* String searchOption, String keyword, */int start, int end) {
		// TODO Auto-generated method stub
		
		return productDao.productListView(/* searchOption, keyword, */ start, end);
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

	@Override
	public int productSelectTotalCount() {
		// TODO Auto-generated method stub
		return productDao.productSelectTotalCount();
	}
	
}
