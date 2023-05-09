package com.shoppingcart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingcart.connection.ConnectDB;
import com.shoppingcart.dao.UserDao;

@WebServlet("/views/update-to-password")
public class UpdateToPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try {
			String email = request.getParameter("email");
			String oldPassword = request.getParameter("oldPassword");
			String newPassword = request.getParameter("newPassword");
			
			UserDao ud = new UserDao(ConnectDB.getConnection());
			boolean result = ud.updateToPassword(email, oldPassword, newPassword);
			
			if(result) {
				response.sendRedirect("./home.jsp");
			} else {
				response.getWriter().print("Bạn nhập sai tên đăng nhập hoặc mật khẩu hiện tại! Bạn hãy kiểm tra và nhập lại!");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
