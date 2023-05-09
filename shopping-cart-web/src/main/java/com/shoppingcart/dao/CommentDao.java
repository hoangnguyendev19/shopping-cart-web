package com.shoppingcart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.shoppingcart.model.CommentModel;
import com.shoppingcart.model.ProductModel;

public class CommentDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public CommentDao(Connection con) {
		this.con = con;
	}
	
	public ArrayList<CommentModel> getCommentByProductId(int productId) {
		ArrayList<CommentModel> commentList = new ArrayList<>();
		
		try {
			query = "select * from comments as C inner join users as U on C.user_id=U.user_id where product_id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, productId);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				CommentModel cm = new CommentModel();
				cm.setCommentId(rs.getInt("comment_id"));
				cm.setUserName(rs.getString("user_name"));
				cm.setCommentText(rs.getString("comment_text"));
				cm.setPostDate(rs.getString("post_date"));
				commentList.add(cm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return commentList;
	}
	
	public boolean addToComment(CommentModel cm) {
		boolean result = false;
		
		try {
			query = "insert into comments (product_id, user_id, comment_text, post_date) values(?,?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, cm.getProductId());
			pst.setInt(2, cm.getUserId());
			pst.setString(3, cm.getCommentText());
			pst.setString(4, cm.getPostDate());
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
