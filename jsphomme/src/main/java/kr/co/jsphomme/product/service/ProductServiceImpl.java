package kr.co.jsphomme.product.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
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
		
		log.debug("ProductServiceImpl productInsert enter!! {}", productVo);
		
	}

	@Override
	public List<ProductVo> productListView(
			/* String searchOption,*/String keyword, int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap();
		
//		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		return productDao.productListView(map);
	}

	@Override
	public ProductVo productOneDeteilView(int productNo) {
		// TODO Auto-generated method stub
		
		return productDao.productOneDeteilView(productNo);
	}

	@Override
	public int productUpdate(
			ProductVo productVo, MultipartHttpServletRequest multipartHttpServletRequest) {
		// TODO Auto-generated method stub
		
		log.debug("ProductServiceImpl productUpdate enter! - {}", productVo);
		
		List<MultipartFile> tempFileList = fileUtils.getFile(multipartHttpServletRequest);
		Iterator<MultipartFile> iterator = tempFileList.iterator();
		
		while (iterator.hasNext()) {
			if (iterator.next().getSize() != productVo.getFileSize()) {
				fileUtils.parseUpdateFileInfo(productVo);
			}
		}
		
		
		try {
			fileUtils.parseInsertFileInfo(productVo, multipartHttpServletRequest);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return productDao.productUpdate(productVo);
	}

	@Override
	public int productDelete(int productNo) {
		// TODO Auto-generated method stub
		return productDao.productDelete(productNo);
	}

	@Override
	public int productSelectTotalCount(String keyword) {
		// TODO Auto-generated method stub
		return productDao.productSelectTotalCount(keyword);
	}

	@Override
	public int productStatusUpdate(int productNo, int status) {
		// TODO Auto-generated method stub
		
		return productDao.productStatusUpdate(productNo, status);
	}

	@Override
	public List<ProductVo> productHideListView(String keyword, int start, int end) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap();
		
//		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		return productDao.productHideListView(map);
	}

	@Override
	public int hideProductSelectTotalCount(String keyword) {
		// TODO Auto-generated method stub
		return productDao.hideProductSelectTotalCount(keyword);
	}
	
}
