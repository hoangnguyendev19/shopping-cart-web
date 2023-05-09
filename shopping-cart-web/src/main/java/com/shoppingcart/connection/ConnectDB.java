package com.shoppingcart.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
	public static Connection con = null;
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		if(con==null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/shopping_cart";
			String user = "root";
			String pwd = "190303";
			con = DriverManager.getConnection(url, user, pwd);
		}
		return con;
	}
	
	public void disconnect() {
		if(con != null) {
			try {
				con.close();
			} catch(SQLException e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
		}	
	}
}
