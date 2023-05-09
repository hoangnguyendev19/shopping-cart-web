package com.shoppingcart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingcart.connection.ConnectDB;
import com.shoppingcart.dao.ProductDao;

@WebServlet("/views/remove-to-product")
public class RemoveToProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			
			ProductDao pd = new ProductDao(ConnectDB.getConnection());
			boolean result = pd.removeToProduct(id);
			
			if(result) {
				response.sendRedirect("./product-admin.jsp");
			} else {
				response.getWriter().print("Xóa sản phẩm thất bại! Bạn hãy thực hiện lại!");
			}
 		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
