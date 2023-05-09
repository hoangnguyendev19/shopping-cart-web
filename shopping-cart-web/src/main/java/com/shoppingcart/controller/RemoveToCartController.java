package com.shoppingcart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingcart.model.CartModel;

@WebServlet("/views/remove-to-cart")
public class RemoveToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			ArrayList<CartModel> cart = (ArrayList<CartModel>) request.getSession().getAttribute("cart-list");
			if(cart != null) {
				for (CartModel cm : cart) {
					if(cm.getProductId() == id) {
						cart.remove(cart.indexOf(cm));
						break;
					}
				}
				response.sendRedirect("./cart.jsp");
			} else {
				response.sendRedirect("./cart.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
