package kr.co.jsphomme.basket.vo;

public class BasketVo {

	private int basketNo = 0;
	private int memberNo = 0;
	private int productNo = 0;
	private String name = "";
	private int price = 0;
	private String productSize = "";
	private int purchaseQuantity = 0;
	private String storedFileName = "";
	private int quantity = 0;

	public BasketVo() {
		super();
	}

	public BasketVo(int basketNo, int memberNo, int productNo, String name, int price, String productSize,
			int purchaseQuantity, String storedFileName, int quantity) {
		super();
		this.basketNo = basketNo;
		this.memberNo = memberNo;
		this.productNo = productNo;
		this.name = name;
		this.price = price;
		this.productSize = productSize;
		this.purchaseQuantity = purchaseQuantity;
		this.storedFileName = storedFileName;
		this.quantity = quantity;
	}

	public int getBasketNo() {
		return basketNo;
	}

	public void setBasketNo(int basketNo) {
		this.basketNo = basketNo;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getProductSize() {
		return productSize;
	}

	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}

	public int getPurchaseQuantity() {
		return purchaseQuantity;
	}

	public void setPurchaseQuantity(int purchaseQuantity) {
		this.purchaseQuantity = purchaseQuantity;
	}

	public String getStoredFileName() {
		return storedFileName;
	}

	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "BasketVo [basketNo=" + basketNo + ", memberNo=" + memberNo + ", productNo=" + productNo + ", name="
				+ name + ", price=" + price + ", productSize=" + productSize + ", purchaseQuantity=" + purchaseQuantity
				+ ", storedFileName=" + storedFileName + ", quantity=" + quantity + "]";
	}

}
