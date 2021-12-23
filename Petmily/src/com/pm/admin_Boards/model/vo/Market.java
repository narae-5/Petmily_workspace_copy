package com.pm.admin_Boards.model.vo;

public class Market {

	private int marketNo;
	private String marketWriter;
	private String category;
	private String dCategory;
	private String marketTitle;
	private String marketContent;
	private int price;
	private int count;
	private String status;
	private String enrollDate;
	
	public Market () {}


	
	public Market(int marketNo, String marketWriter, String category, String dCategory, String marketTitle,
			String marketContent, int price, int count, String status, String enrollDate) {
		super();
		this.marketNo = marketNo;
		this.marketWriter = marketWriter;
		this.category = category;
		this.dCategory = dCategory;
		this.marketTitle = marketTitle;
		this.marketContent = marketContent;
		this.price = price;
		this.count = count;
		this.status = status;
		this.enrollDate = enrollDate;
	}


	public int getMarketNo() {
		return marketNo;
	}

	public void setMarketNo(int marketNo) {
		this.marketNo = marketNo;
	}

	public String getMarketWriter() {
		return marketWriter;
	}

	public void setMarketWriter(String marketWriter) {
		this.marketWriter = marketWriter;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getdCategory() {
		return dCategory;
	}

	public void setdCategory(String dCategory) {
		this.dCategory = dCategory;
	}

	public String getMarketTitle() {
		return marketTitle;
	}

	public void setMarketTitle(String marketTitle) {
		this.marketTitle = marketTitle;
	}

	public String getMarketContent() {
		return marketContent;
	}

	public void setMarketContent(String marketContent) {
		this.marketContent = marketContent;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	
	
	@Override
	public String toString() {
		return "Market [marketNo=" + marketNo + ", marketWriter=" + marketWriter + ", category=" + category
				+ ", dCategory=" + dCategory + ", marketTitle=" + marketTitle + ", marketContent=" + marketContent
				+ ", price=" + price + ", count=" + count + ", status=" + status + ", enrollDate=" + enrollDate + "]";
	}
	
	
	
	
}