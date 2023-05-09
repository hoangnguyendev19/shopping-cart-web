package com.shoppingcart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.shoppingcart.model.CartModel;
import com.shoppingcart.model.ProductModel;

public class ProductDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public ProductDao(Connection con) {
		this.con = con;
	}
	
	public ArrayList<ProductModel> getAllProducts() {
		ArrayList<ProductModel> productList = new ArrayList<ProductModel>();
		
		try {
			query = "select * from products";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				int productId = rs.getInt("product_id");
				String productName = rs.getString("product_name");
				String imgUrl = rs.getString("img_url");
				double price = rs.getDouble("price");
				int categoryId = rs.getInt("category_id");
				
				ProductModel product = new ProductModel(productId, productName, imgUrl, price, categoryId);
				productList.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return productList;
	}
	
	public ArrayList<ProductModel> getProductByCategory(String category) {
		ArrayList<ProductModel> productList = new ArrayList<ProductModel>();
		
		try {
			query = "select * from products as P inner join category as C on P.category_id=C.category_id where category_name=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, category);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				int productId = rs.getInt("product_id");
				String productName = rs.getString("product_name");
				String imgUrl = rs.getString("img_url");
				double price = rs.getDouble("price");
				int categoryId = rs.getInt("category_id");
				
				ProductModel product = new ProductModel(productId, productName, imgUrl, price, categoryId);
				productList.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return productList;
	}
	
	public ProductModel getProductById(int id) {
		ProductModel product = null;
		
		try {
			query = "select * from products where product_id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				int productId = rs.getInt("product_id");
				String productName = rs.getString("product_name");
				String imgUrl = rs.getString("img_url");
				double price = rs.getDouble("price");
				int categoryId = rs.getInt("category_id");
				
				product = new ProductModel(productId, productName, imgUrl, price, categoryId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return product;
	}
	
	public ArrayList<CartModel> getProductCart(ArrayList<CartModel> cartList) {
		ArrayList<CartModel> cart = new ArrayList<CartModel>();
		
		try {
			if(cartList != null && !cartList.isEmpty()) {
				for (CartModel cm : cartList) {
					query = "select * from products where product_id=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, cm.getProductId());
					rs = pst.executeQuery();
					
					while(rs.next()) {
						int productId = rs.getInt("product_id");
						String productName = rs.getString("product_name");
						String imgUrl = rs.getString("img_url");
						int categoryId = rs.getInt("category_id");
						int quantity = cm.getQuantity();
						double price = rs.getDouble("price");
						double totalPrice = rs.getDouble("price") * (double) quantity;
						String size = cm.getSize();
						
						CartModel newCM = new CartModel(productId, productName, imgUrl, price, categoryId, quantity, size, totalPrice);
						cart.add(newCM);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cart;
	}
	
	// Admin
	
	public boolean updateToProduct(ProductModel pm) {
		boolean result = false;
		
		try {
			if(pm != null) {
				query = "update products set product_name=?, img_url=?, price=?, category_id=? where product_id=?";
				pst = this.con.prepareStatement(query);
				pst.setString(1, pm.getProductName());
				pst.setString(2, pm.getImgUrl());
				pst.setDouble(3, pm.getPrice());
				pst.setInt(4, pm.getCategoryId());
				pst.setInt(5, pm.getProductId());
				int kq = pst.executeUpdate();
				
				if(kq == 1) {
					result = true;
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public boolean addToProduct(ProductModel pm) {
		boolean result = false;
		
		try {
			if(pm != null) {
				query = "insert into products (product_name, img_url, price, category_id) values (?,?,?,?)";
				pst = this.con.prepareStatement(query);
				pst.setString(1, pm.getProductName());
				pst.setString(2, pm.getImgUrl());
				pst.setDouble(3, pm.getPrice());
				pst.setInt(4, pm.getCategoryId());
				int kq = pst.executeUpdate();
				
				if(kq == 1) {
					result = true;
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public boolean removeToProduct(int id) {
		boolean result = false;
		
		try {
			query = "delete from products where product_id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			int kq = pst.executeUpdate();
			
			if(kq == 1) {
				result = true;
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
