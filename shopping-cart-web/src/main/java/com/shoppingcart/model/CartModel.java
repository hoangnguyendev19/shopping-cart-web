package com.shoppingcart.model;

public class CartModel extends ProductModel{
	private int quantity;
	private String size;
	private double totalPrice;
	
	public CartModel() {
	}
	
	public CartModel(int productId, String productName, String imgUrl, double price, int categoryId, int quantity, String size, double totalPrice) {
		super(productId, productName, imgUrl, price, categoryId);
		this.quantity = quantity;
		this.size = size;
		this.totalPrice = totalPrice;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
}
