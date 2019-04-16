package kr.co.jsphomme.purchaselist.vo;

import java.util.Date;

public class PurchaseListVo {
	
	private String purchaseListNo = "";
	private int memberNo = 0;
	private int productNo = 0;
	private String productName = "";
	private int productPrice = 0;
	private String productSize = "";
	private Date purchaseDate = null;
	private String requests = "";
	private String address = "";
	private int purchaseQuantity = 0;
	
	
	
	public PurchaseListVo() {
		super();
	}
	
	
	public PurchaseListVo(String purchaseListNo, int memberNo, int productNo, String productSize, String requests,
			String address) {
		super();
		this.purchaseListNo = purchaseListNo;
		this.memberNo = memberNo;
		this.productNo = productNo;
		this.productSize = productSize;
		this.requests = requests;
		this.address = address;
	}






	public PurchaseListVo(String purchaseListNo, int memberNo, int productNo, String productSize, Date purchaseDate,
			String requests, String address) {
		super();
		this.purchaseListNo = purchaseListNo;
		this.memberNo = memberNo;
		this.productNo = productNo;
		this.productSize = productSize;
		this.purchaseDate = purchaseDate;
		this.requests = requests;
		this.address = address;
	}
	
	
	
	

	public PurchaseListVo(String purchaseListNo, int memberNo, int productNo, String productName, int productPrice,
			String productSize, Date purchaseDate, String requests, String address) {
		super();
		this.purchaseListNo = purchaseListNo;
		this.memberNo = memberNo;
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productSize = productSize;
		this.purchaseDate = purchaseDate;
		this.requests = requests;
		this.address = address;
	}


	public String getPurchaseListNo() {
		return purchaseListNo;
	}


	public void setPurchaseListNo(String purchaseListNo) {
		this.purchaseListNo = purchaseListNo;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public int getProductNo() {
		return productNo;
	}


	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}


	public String getProductSize() {
		return productSize;
	}


	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}


	public Date getPurchaseDate() {
		return purchaseDate;
	}


	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}


	public String getRequests() {
		return requests;
	}


	public void setRequests(String requests) {
		this.requests = requests;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}

	
	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public int getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	
	public int getPurchaseQuantity() {
		return purchaseQuantity;
	}


	public void setPurchaseQuantity(int purchaseQuantity) {
		this.purchaseQuantity = purchaseQuantity;
	}


	@Override
	public String toString() {
		return "PurchaseListVo [purchaseListNo=" + purchaseListNo + ", memberNo=" + memberNo + ", productNo="
				+ productNo + ", productName=" + productName + ", productPrice=" + productPrice + ", productSize="
				+ productSize + ", purchaseDate=" + purchaseDate + ", requests=" + requests + ", address=" + address
				+ ", purchaseQuantity=" + purchaseQuantity + "]";
	}

	
	

	
	
}
