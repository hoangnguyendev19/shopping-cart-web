package com.shoppingcart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingcart.connection.ConnectDB;
import com.shoppingcart.dao.UserDao;
import com.shoppingcart.model.UserModel;

@WebServlet("/views/update-to-profile")
public class UpdateToProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try {
			String userName = request.getParameter("name");
			String gender = request.getParameter("gender");
			String email = request.getParameter("email");
			String birthday = request.getParameter("birthday");
			String address = request.getParameter("address");
			String phoneNumber = request.getParameter("phone");
			
			UserModel um = new UserModel();
			um.setUserName(userName);
			um.setGender(gender);
			um.setEmail(email);
			um.setBirthday(birthday);
			um.setAddress(address);
			um.setPhoneNumber(phoneNumber);
			
			UserDao ud = new UserDao(ConnectDB.getConnection());
			boolean result = ud.updateToProfile(um);
			
			if(result) {
				response.sendRedirect("./home.jsp");
			} else {
				response.getWriter().print("Cập nhật thông tin cá nhân thất bại. Bạn hãy thực hiện lại!");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
