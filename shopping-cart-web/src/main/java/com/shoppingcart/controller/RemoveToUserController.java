package com.shoppingcart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingcart.connection.ConnectDB;
import com.shoppingcart.dao.UserDao;

/**
 * Servlet implementation class RemoveToUserController
 */
@WebServlet("/views/remove-to-user")
public class RemoveToUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try {
			int userId = Integer.parseInt(request.getParameter("id"));
			
			UserDao ud = new UserDao(ConnectDB.getConnection());
			boolean result = ud.removeToUser(userId);
			
			if(result) {
				response.sendRedirect("./user-admin.jsp");
			} else {
				response.getWriter().print("Xóa khách hàng thất bại! Bạn hãy thực hiện lại!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
