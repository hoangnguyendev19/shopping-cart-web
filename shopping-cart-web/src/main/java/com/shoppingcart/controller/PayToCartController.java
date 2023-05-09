package com.shoppingcart.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingcart.connection.ConnectDB;
import com.shoppingcart.dao.OrderDao;
import com.shoppingcart.dao.ProductDao;
import com.shoppingcart.model.CartModel;
import com.shoppingcart.model.OrderModel;
import com.shoppingcart.model.UserModel;

/**
 * Servlet implementation class PayToCartController
 */
@WebServlet("/views/pay-to-cart")
public class PayToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		try {
			UserModel auth = (UserModel) request.getSession().getAttribute("auth");
			ArrayList<CartModel> cartList = (ArrayList<CartModel>) request.getSession().getAttribute("cart-list");
			ProductDao pd = new ProductDao(ConnectDB.getConnection());			
			ArrayList<CartModel> cart = pd.getProductCart(cartList);
					
			OrderDao od = new OrderDao(ConnectDB.getConnection());
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

			Date dateNow = new Date();
			boolean result = false;
			
			if(auth != null) {
				if(cart != null && cart.size() > 0) {
					for (CartModel cm : cart) {
						OrderModel om = new OrderModel();
						om.setProductId(cm.getProductId());
						om.setUserId(auth.getUserId());
						om.setSize(cm.getSize());
						om.setOrderDate(formatter.format(dateNow));
						om.setQuantity(cm.getQuantity());
						om.setTotalPrice(cm.getTotalPrice());
						result = od.insertToOrder(om);
					}
					
					if(result) {
						request.getSession().setAttribute("cart-list", null);
						response.sendRedirect("./order.jsp");
					}
				} else {
					response.sendRedirect("./product.jsp");
				}
			} else {
				response.sendRedirect("./sign-in.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
