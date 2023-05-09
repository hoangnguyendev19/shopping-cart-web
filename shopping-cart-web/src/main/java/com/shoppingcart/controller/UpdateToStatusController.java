package com.shoppingcart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingcart.connection.ConnectDB;
import com.shoppingcart.dao.OrderDao;


@WebServlet("/views/update-to-status")
public class UpdateToStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try {
			int orderId = Integer.parseInt(request.getParameter("id"));
			
			OrderDao od = new OrderDao(ConnectDB.getConnection());
			boolean result = od.updateToStatus(orderId);
			
			if(result) {
				response.sendRedirect("./order-admin.jsp");
			} else {
				response.getWriter().print("Chấp nhận đơn đặt hàng thất bại! Bạn hãy thực hiện lại!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
