package com.shoppingcart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingcart.connection.ConnectDB;
import com.shoppingcart.dao.UserDao;

@WebServlet("/views/user-signup")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			UserDao ud = new UserDao(ConnectDB.getConnection());
			boolean result = ud.signup(name, email, password);
			
			if(result) {
				response.sendRedirect("./sign-in.jsp");
			} else {
				response.getWriter().print("Đăng ký thất bại! Bạn hãy thực hiện lại!");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
