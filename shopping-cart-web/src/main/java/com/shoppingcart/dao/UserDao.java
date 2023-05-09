package com.shoppingcart.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.shoppingcart.model.UserModel;

public class UserDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public UserDao(Connection con) {
		this.con = con;
	}
	
	public UserModel login(String email, String password) {
		UserModel user = null;
		try {
			query = "select * from users where email=? and password=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				int userId = rs.getInt("user_id");
				String userName = rs.getString("user_name");
				String eml = rs.getString("email");
				String pwd = rs.getString("password");
				String birthday = rs.getString("birthday");
				String address = rs.getString("address");
				user = new UserModel(userId, userName, eml, pwd, birthday, address);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return user;
	}
	
	public boolean signup(String name, String email, String password) {
		boolean result = false;
		try {
			query = "insert into users (user_name, email, password) values(?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setString(3, password);
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

	
	public UserModel getUserById(int id) {
		UserModel user = null;
		try {
			query = "select * from users where user_id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				user = new UserModel();
				user.setUserName(rs.getString("user_name"));
				user.setGender(rs.getString("gender"));
				user.setEmail(rs.getString("email"));
				user.setBirthday(rs.getString("birthday"));
				user.setAddress(rs.getString("address"));
				user.setPhoneNumber(rs.getString("phone_number"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return user;
	}
	
	public boolean updateToProfile(UserModel um) {
		boolean result = false;
		try {
			if(um != null) {
				query = "update users set user_name=?, gender=?, birthday=?, address=?, phone_number=? where email=?";
				pst = this.con.prepareStatement(query);
				pst.setString(1, um.getUserName());
				pst.setString(2, um.getGender());
				pst.setString(3, um.getBirthday());
				pst.setString(4, um.getAddress());
				pst.setString(5, um.getPhoneNumber());
				pst.setString(6, um.getEmail());
				int kq = pst.executeUpdate();
				
				if(kq == 1) {
					result = true;				
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return result;
	}
	
	public boolean updateToPassword(String email, String oldPassword, String newPassword) {
		boolean result = false;
		try {
			query = "update users set password=? where email=? and password=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, newPassword);
			pst.setString(2, email);
			pst.setString(3, oldPassword);
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
	
	// Admin
	
	public ArrayList<UserModel> getAllUser() {
		ArrayList<UserModel> userList = new ArrayList<>();
		try {
			query = "select * from users";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				UserModel user = new UserModel();
				user.setUserId(rs.getInt("user_id"));
				user.setUserName(rs.getString("user_name"));
				user.setGender(rs.getString("gender"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setBirthday(rs.getString("birthday"));
				user.setAddress(rs.getString("address"));
				user.setPhoneNumber(rs.getString("phone_number"));
				
				userList.add(user);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return userList;
	}
	
	public boolean removeToUser(int id) {
		boolean result = false;
		try {
			query = "delete from users where user_id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
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
