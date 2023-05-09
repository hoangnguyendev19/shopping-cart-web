<%@page import="com.shoppingcart.connection.ConnectDB"%>
<%@page import="com.shoppingcart.model.CartModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shoppingcart.dao.ProductDao"%>
<%@page import="com.shoppingcart.model.UserModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ProductDao pDao = new ProductDao(ConnectDB.getConnection());
ArrayList<CartModel> cartList = (ArrayList<CartModel>) request.getSession().getAttribute("cart-list");
ArrayList<CartModel> cart = pDao.getProductCart(cartList);
double total = 0;
if (cart != null) {
	int qty = 0;
	for (CartModel cm : cart) {
		qty += cm.getQuantity();
		total += cm.getTotalPrice();
	}
	request.setAttribute("qty", qty);
	request.setAttribute("cart", cart);
}
%>

<header class="header">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="./home.jsp"> <img
				src="../img/img-logo.png" alt="Logo" width="160" height="50" />
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse menu"
				id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link"
						aria-current="page" href="./home.jsp">Trang Chủ</a></li>
					<li class="nav-item"><a class="nav-link" href="./product.jsp">Sản
							phẩm</a></li>
					<li class="nav-item"><a class="nav-link"
						href="./introduce.jsp">Giới thiệu</a></li>
					<li class="nav-item"><a class="nav-link" href="./news.jsp">Tin
							tức</a></li>
					<li class="nav-item"><a class="nav-link" href="./contact.jsp">Liên
							lạc</a></li>
				</ul>
				<ul class="navbar-nav mb-2 mb-lg-0 align-items-center">
					<li class="nav-item"><input class="form-control me-2"
						type="search" placeholder="Search" aria-label="Search" /></li>

					<li class="nav-item"><a class="nav-link" href="./product.jsp"><svg
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                      <path
									d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                    </svg> </a></li>
					<%
					if (auth != null) {
					%>
					<li class="nav-item me-3"><a
						class="nav-link position-relative" href="./cart.jsp"> <svg
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                      <path
									d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                    </svg> <span
							class="position-absolute bottom-0 start-100 translate-middle badge rounded-pill bg-danger">
								${ qty } <span class="visually-hidden"></span>
						</span>
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="dropdownMenuLink"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<span> <svg xmlns="http://www.w3.org/2000/svg" width="24"
									height="24" fill="currentColor" class="bi bi-person-circle"
									viewBox="0 0 16 16">
									<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
									<path fill-rule="evenodd"
										d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
								</svg>
						</span>
					</a>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<li><a class="dropdown-item" href="./profile.jsp">Thông
									tin</a></li>
							<li><a class="dropdown-item" href="./order.jsp">Hóa đơn</a></li>
							<li><a class="dropdown-item" href="./password.jsp">Đổi
									mật khẩu</a></li>
							<li><a class="dropdown-item" href="user-logout">Đăng
									xuất</a></li>
						</ul></li>
					<%
					} else {
					%>
					<li class="nav-item mr-3"><a class="nav-link"
						href="./sign-in.jsp">Đăng nhập</a></li>
					<li class="nav-item"><a class="nav-link" href="./sign-up.jsp">Đăng
							ký</a></li>

					<%
					}
					%>


				</ul>
			</div>
		</div>
	</nav>
</header>