package kr.co.jsphomme.product.vo;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class ProductVo {

	private int productNo = 0;
	private String name = "";
	private int quantity = 0;
	private int price = 0;
	private String detail = "";
	private String originalFileName = "";
	private String storedFileName = "";
	private int fileSize = 0;
	private Date enrollmentDate = null;
	
	private static final String filePath = "C:\\upload";

	public ProductVo() {
		super();
	}

	public ProductVo(int productNo, String name, int quantity, int price, String detail, String originalFileName,
			String storedFileName, int fileSize, Date enrollmentDate) {
		super();
		this.productNo = productNo;
		this.name = name;
		this.quantity = quantity;
		this.price = price;
		this.detail = detail;
		this.originalFileName = originalFileName;
		this.storedFileName = storedFileName;
		this.fileSize = fileSize;
		this.enrollmentDate = enrollmentDate;
	}
	
	// 파일 입출력 다시 살펴보자...
	public List<Map<String, Object>> parseInsertFileInfo(int parentSeq,
			MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		
		List<Map<String, Object>> fileList = new ArrayList<Map<String,Object>>();
		Map<String, Object> fileInfoMap = null;
		
		File file = new File(filePath);
		
		if (file.exists() == false) {
			file.mkdirs();
		}
		
		while (iterator.hasNext()) {
			
		}
		
		return null;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getStoredFileName() {
		return storedFileName;
	}

	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public Date getEnrollmentDate() {
		return enrollmentDate;
	}

	public void setEnrollmentDate(Date enrollmentDate) {
		this.enrollmentDate = enrollmentDate;
	}

	@Override
	public String toString() {
		return "ProductVo [productNo=" + productNo + ", name=" + name + ", quantity=" + quantity + ", price=" + price
				+ ", detail=" + detail + ", originalFileName=" + originalFileName + ", storedFileName=" + storedFileName
				+ ", fileSize=" + fileSize + ", enrollmentDate=" + enrollmentDate + "]";
	}

}
