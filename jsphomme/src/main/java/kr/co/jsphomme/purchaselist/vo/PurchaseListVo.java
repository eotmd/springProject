package kr.co.jsphomme.purchaselist.vo;

import java.util.Date;

public class PurchaseListVo {
	private String purchaseListNo = "";
	private int memberNo = 0;
	private int productNo = 0;
	private int productSize = 0;
	private Date purchaseDate = null;
	private String requests = "";
	private String adress = "";

	public PurchaseListVo() {
		super();
	}
	
	
	public PurchaseListVo(String purchaseListNo, int memberNo, int productNo, int productSize, String requests,
			String adress) {
		super();
		this.purchaseListNo = purchaseListNo;
		this.memberNo = memberNo;
		this.productNo = productNo;
		this.productSize = productSize;
		this.requests = requests;
		this.adress = adress;
	}






	public PurchaseListVo(String purchaseListNo, int memberNo, int productNo, int productSize, Date purchaseDate,
			String requests, String adress) {
		super();
		this.purchaseListNo = purchaseListNo;
		this.memberNo = memberNo;
		this.productNo = productNo;
		this.productSize = productSize;
		this.purchaseDate = purchaseDate;
		this.requests = requests;
		this.adress = adress;
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


	public int getProductSize() {
		return productSize;
	}


	public void setProductSize(int productSize) {
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


	public String getAdress() {
		return adress;
	}


	public void setAdress(String adress) {
		this.adress = adress;
	}


	@Override
	public String toString() {
		return "PurchaseListVo [purchaseListNo=" + purchaseListNo + ", memberNo=" + memberNo + ", productNo="
				+ productNo + ", productSize=" + productSize + ", purchaseDate=" + purchaseDate + ", requests="
				+ requests + ", adress=" + adress + "]";
	}
	
	
	
	
	
}
