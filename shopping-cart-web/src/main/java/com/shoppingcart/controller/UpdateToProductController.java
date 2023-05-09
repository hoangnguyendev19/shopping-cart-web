package com.shoppingcart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingcart.connection.ConnectDB;
import com.shoppingcart.dao.ProductDao;
import com.shoppingcart.model.ProductModel;

@WebServlet("/views/update-to-product")
public class UpdateToProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try {
			int productId = Integer.parseInt(request.getParameter("id"));
			String productName = request.getParameter("name");
			String imgUrl = request.getParameter("imgUrl");
			double price = Double.parseDouble(request.getParameter("price"));
			String category = request.getParameter("category");
			int categoryId = 1;
			
			if(category.equals("Áo")) {
				categoryId = 1;
			} else if(category.equals("Đầm")) {
				categoryId = 2;
			} else if(category.equals("Váy")) {
				categoryId = 3;
			} else if(category.equals("Quần")) {
				categoryId = 4;
			}
			
			ProductModel pm = new ProductModel(productId, productName, imgUrl, price, categoryId);
			
			ProductDao pd = new ProductDao(ConnectDB.getConnection());
			boolean result = pd.updateToProduct(pm);
			
			if(result) {
				response.sendRedirect("./product-admin.jsp");
			} else {
				response.getWriter().print("Cập nhật sản phẩm thất bại! Bạn hãy thực hiện lại!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
