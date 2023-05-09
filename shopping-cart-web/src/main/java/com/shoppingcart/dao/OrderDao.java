package com.shoppingcart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.concurrent.ThreadLocalRandom;

import com.shoppingcart.connection.ConnectDB;
import com.shoppingcart.model.OrderModel;
import com.shoppingcart.model.UserModel;

public class OrderDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public OrderDao(Connection con) {
		this.con = con;
	}
	
	public boolean insertToOrder(OrderModel om) {
		boolean result = false;
		
		try {
			query = "insert into orders (product_id, user_id, size, quantity, total_price, order_date) values(?,?,?,?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, om.getProductId());
			pst.setInt(2, om.getUserId());
			pst.setString(3, om.getSize());
			pst.setInt(4, om.getQuantity());
			pst.setDouble(5, om.getTotalPrice());
			pst.setString(6, om.getOrderDate());
			int kq = pst.executeUpdate();
			
			if(kq == 1) {
				result = true;				
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<OrderModel> getOrderByUser(UserModel user) {
		ArrayList<OrderModel> orderList = new ArrayList<>();
		
		try {
			query = "select * from orders as O inner join products as P on O.product_id=P.product_id where user_id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, user.getUserId());
			rs = pst.executeQuery();
			
			while(rs.next()) {
				OrderModel om = new OrderModel();
				om.setOrderId(rs.getInt("order_id"));
				om.setProductName(rs.getString("product_name"));
				om.setSize(rs.getString("size"));
				om.setQuantity(rs.getInt("quantity"));
				om.setPrice(rs.getDouble("price"));
				om.setTotalPrice(rs.getDouble("total_price"));
				om.setOrderDate(rs.getString("order_date"));
				om.setStatus(rs.getString("status"));
				
				orderList.add(om);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return orderList;
	}
	
	public boolean removeToOrder(int orderId) {
		boolean result = false;
		
		try {
			query = "delete from orders where order_id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, orderId);
			int kq = pst.executeUpdate();
			
			if(kq == 1) {
				result = true;				
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	//	Admin
	public ArrayList<OrderModel> getAllOrder() {
		ArrayList<OrderModel> orderList = new ArrayList<>();
		
		try {
			query = "select * from orders";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				OrderModel om = new OrderModel();
				om.setOrderId(rs.getInt("order_id"));
				om.setUserId(rs.getInt("user_id"));
				om.setProductId(rs.getInt("product_id"));
				om.setSize(rs.getString("size"));
				om.setQuantity(rs.getInt("quantity"));
				om.setTotalPrice(rs.getDouble("total_price"));
				om.setOrderDate(rs.getString("order_date"));
				om.setStatus(rs.getString("status"));
				
				orderList.add(om);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return orderList;
	}
	
	public boolean updateToStatus(int orderId) {
		boolean result = false;
		
		try {
			query = "update orders set status='Đặt thành công' where order_id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, orderId);
			int kq = pst.executeUpdate();
			
			if(kq == 1) {
				result = true;				
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return result;
	}
}
