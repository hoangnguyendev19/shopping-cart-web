package com.shoppingcart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingcart.connection.ConnectDB;
import com.shoppingcart.dao.OrderDao;
import com.shoppingcart.model.UserModel;

@WebServlet("/views/remove-to-order")
public class RemoveToOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		UserModel user = (UserModel) request.getSession().getAttribute("auth");
		
		try {
			int orderId = Integer.parseInt(request.getParameter("id"));
			OrderDao od = new OrderDao(ConnectDB.getConnection());
			boolean result = od.removeToOrder(orderId);
			
			if(result) {
				if(user.getUserName().equals("admin")) {
					response.sendRedirect("./order-admin.jsp");
				} else {
					response.sendRedirect("./order.jsp");
				}
			} else {
				response.getWriter().print("Hủy đơn hàng thất bại!");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
