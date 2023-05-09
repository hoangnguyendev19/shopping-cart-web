package com.shoppingcart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingcart.model.CartModel;

/**
 * Servlet implementation class CartController
 */
@WebServlet("/views/add-to-cart")
public class AddToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try {
			ArrayList<CartModel> cartList = new ArrayList<>();
			
			int id = Integer.parseInt(request.getParameter("id"));
			String size = request.getParameter("size");
			int quantity = Integer.parseInt(request.getParameter("qty"));
			
			CartModel cm = new CartModel();
			cm.setProductId(id);
			cm.setSize(size);
			cm.setQuantity(quantity);
			
			HttpSession session = request.getSession();
			ArrayList<CartModel> cart = (ArrayList<CartModel>) session.getAttribute("cart-list");
			
			if(cart == null) {
				cartList.add(cm);
				session.setAttribute("cart-list", cartList);
				response.sendRedirect("./product.jsp");
				
			} else {
				boolean exist = false;
				for (CartModel c : cart) {
					if(c.getProductId() == id && c.getSize().equals(size)) {
						exist = true;
						CartModel newCart = new CartModel();
						newCart.setProductId(c.getProductId());
						newCart.setProductName(c.getProductName());
						newCart.setImgUrl(c.getImgUrl());
						newCart.setPrice(c.getPrice());
						newCart.setCategoryId(c.getCategoryId());
						newCart.setSize(size);
						newCart.setQuantity(c.getQuantity() + quantity);
						newCart.setTotalPrice(c.getPrice() * (c.getQuantity() + quantity));
						cartList.add(newCart);
					} else {
						cartList.add(c);						
					}
				}
				
				if(!exist) {
					cartList.add(cm);
				} 
				response.sendRedirect("./product.jsp");
				session.setAttribute("cart-list", cartList);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
