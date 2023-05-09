package com.shoppingcart.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingcart.connection.ConnectDB;
import com.shoppingcart.dao.CommentDao;
import com.shoppingcart.model.CommentModel;
import com.shoppingcart.model.UserModel;

@WebServlet("/views/post-to-comment")
public class PostToComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * UserModel auth = (UserModel) request.getSession().getAttribute("auth");
		 * if(auth == null) { response.sendRedirect("./sign-in.jsp"); }
		 */
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try {
			UserModel auth = (UserModel) request.getSession().getAttribute("auth");
			if(auth == null) {
				response.sendRedirect("./sign-in.jsp");
				return;
			}
			
			int productId = Integer.parseInt(request.getParameter("id"));
			String commentText = request.getParameter("text");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date dateNow = new Date();
			
			CommentModel cm = new CommentModel();
			cm.setProductId(productId);
			cm.setUserId(auth.getUserId());
			cm.setCommentText(commentText);
			cm.setPostDate(formatter.format(dateNow));
			
			CommentDao cd = new CommentDao(ConnectDB.getConnection());
			boolean result = cd.addToComment(cm);
			
			if(result) {
				response.sendRedirect("./product-detail.jsp?id="+productId);
			} else {
				response.getWriter().print("Đăng tải thất bại! Bạn hãy thực hiện lại!");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
