package com.pm.shop.model.vo;

public class Cart {
	private int memNo;
	private int productNo;
	private String productOp;
	private int amount;
	private int price;
	private String productName;
	private int priceSum;
	private int amountSum;
	private String basicImg;
	

	public Cart(int memNo, int productNo, String productOp, int amount, int price, String productName) {
		super();
		this.memNo = memNo;
		this.productNo = productNo;
		this.productOp = productOp;
		this.amount = amount;
		this.price = price;
		this.productName = productName;
	}
	


	public Cart(int priceSum, int amountSum) {
		super();
		this.priceSum = priceSum;
		this.amountSum = amountSum;
	}



	public Cart(String productName, String productOp, int amount, int price, String basicImg) {
		super();
		this.productName= productName;
		this.productOp = productOp;
		this.amount = amount;
		this.price = price;
		this.basicImg = basicImg;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductOp() {
		return productOp;
	}

	public void setProductOp(String productOp) {
		this.productOp = productOp;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getProductName() {
		return productName;
	}
	
	public void setProductName(String productName) {
		this.productName = productName;
	}
	

	public int getPriceSum() {
		return priceSum;
	}



	public void setPriceSum(int priceSum) {
		this.priceSum = priceSum;
	}



	public int getAmountSum() {
		return amountSum;
	}



	public void setAmountSum(int amountSum) {
		this.amountSum = amountSum;
	}
	
	



	public String getBasicImg() {
		return basicImg;
	}



	public void setBasicImg(String basicImg) {
		this.basicImg = basicImg;
	}



	@Override
	public String toString() {
		return "Cart [memNo=" + memNo + ", productNo=" + productNo + ", productOp=" + productOp + ", amount=" + amount
				+ ", price=" + price + ", productName=" + productName + ", priceSum=" + priceSum + ", amountSum="
				+ amountSum + ", basicImg=" + basicImg + "]";
	}



	

}
