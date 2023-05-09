package com.shoppingcart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingcart.connection.ConnectDB;
import com.shoppingcart.dao.UserDao;
import com.shoppingcart.model.UserModel;

/**
 * Servlet implementation class SigninServlet
 */
@WebServlet("/views/user-signin")
public class SigninController extends HttpServlet {
	private static final long serialVersionUID = 1L; 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("./sign-in.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String email = request.getParameter("txtEmail");
		String password = request.getParameter("txtPassword");
		
		try {
			UserDao userDao = new UserDao(ConnectDB.getConnection());
			UserModel user = userDao.login(email, password);
			if(user != null) {
				request.getSession().setAttribute("auth", user);
				if(user.getUserName().equals("admin")) {
					response.sendRedirect("./order-admin.jsp");
				} else {
					response.sendRedirect("./home.jsp");					
				}
			} else {
				response.getWriter().print("Login Failed!");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
