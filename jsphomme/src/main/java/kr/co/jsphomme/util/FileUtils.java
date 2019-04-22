package kr.co.jsphomme.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.jsphomme.product.vo.ProductVo;

@Component("fileUtils")
public class FileUtils {

	private static final String filePath = "C:\\upload";

	public List<MultipartFile> getFile(MultipartHttpServletRequest multipartHttpServletRequest) {
		
		Iterator<String> iteratorFileName = multipartHttpServletRequest.getFileNames();
		List<MultipartFile> fileList = new ArrayList<MultipartFile>();
		MultipartFile multipartFile = null;
		
		while (iteratorFileName.hasNext()) {
		
			multipartFile = multipartHttpServletRequest.getFile(iteratorFileName.next());
			
			if (multipartFile.isEmpty() == false) {
				
				fileList.add(multipartFile);
			
			}
			
		}
		
		return fileList;
	}
	
//	int parentSeq는 파일이 담겨진 테이블의 기본키값이다
	public void parseInsertFileInfo(ProductVo productVo,
			MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileExtension = null;
		String originalFileName = "";
		String storedFileName = "";
		double fileSize = 0;
		
		File file = new File(filePath);
		
		if (file.exists() == false) {
			file.mkdirs();
		}
		
		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			
			if (multipartFile.isEmpty() == false) {
				
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = 
						originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName =  CommonUtils.getRandomString() + originalFileExtension;
				
				file = new File(filePath, storedFileName);
				multipartFile.transferTo(file);
				
				fileSize = multipartFile.getSize();
				
				productVo.setOriginalFileName(originalFileName);
				productVo.setStoredFileName(storedFileName);
				productVo.setFileSize(fileSize);
			}
		}
	}

	
//	int parentSeq는 파일이 담겨진 테이블의 기본키값이다
	public boolean parseUpdateFileInfo(ProductVo productVo) {

		String storedFileName = productVo.getStoredFileName();
		
		File file = new File(filePath + "/" +storedFileName);
		
		if(file.exists()) {
			try {
				file.delete();
			} catch (Exception e) {
				return false;
			}
			
		}else {
			System.out.println("파일이 존재하지 않습니다.");
		}

		return true;
	}
}
