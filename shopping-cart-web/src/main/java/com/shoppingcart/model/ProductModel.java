package com.shoppingcart.model;

public class ProductModel {
	private int productId;
	private String productName;
	private String imgUrl;
	private double price;
	private int categoryId;
	
	public ProductModel() {
	}

	public ProductModel(int productId, String productName, String imgUrl, double price, int categoryId) {
		this.productId = productId;
		this.productName = productName;
		this.imgUrl = imgUrl;
		this.price = price;
		this.categoryId = categoryId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	@Override
	public String toString() {
		return "ProductModel [productId=" + productId + ", productName=" + productName + ", imgUrl=" + imgUrl
				+ ", price=" + price + ", categoryId=" + categoryId + "]";
	}

}
