<%@page import="com.shoppingcart.dao.UserDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shoppingcart.model.UserModel"%>
<%@page import="com.shoppingcart.connection.ConnectDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
UserModel auth = (UserModel) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
} else {
	response.sendRedirect("./sign-in.jsp");
	return;
}

	UserDao ud = new UserDao(ConnectDB.getConnection());
	ArrayList<UserModel> userList = ud.getAllUser();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet" />
<link href="<c:url value="/css/reset.css" />" rel="stylesheet" />

<title>Order Admin</title>
</head>
<body>
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
							aria-current="page" href="./user-admin.jsp">Quản lý khách hàng</a></li>
						<li class="nav-item"><a class="nav-link"
							href="./order-admin.jsp">Quản lý hóa đơn</a></li>
						<li class="nav-item"><a class="nav-link"
							href="./product-admin.jsp">Quản lý sản phẩm</a></li>
						<li class="nav-item"><a class="nav-link" href="user-logout">Đăng
								xuất</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<main class="main">
		<div class="container">
			<div class="row py-5">
				<div class="bg-light">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"
								class="text-dark">ADMIN</a></li>
							<li class="breadcrumb-item active" aria-current="page">QUẢN LÝ KHÁCH HÀNG</li>
						</ol>
					</nav>
				</div>
			</div>
			
			<div class="row d-flex justify-content-between pb-5">
				<div class="col col-lg-12 col-sm-12 mb-4">
					<table
						class="table table-hover table-responsive table-bordered border-secondary">
						<thead class="table-dark text-center">
							<tr>
								<th scope="col-sm-1">Mã</th>
								<th scope="col-sm-2">Tên khách hàng</th>
								<th scope="col-sm-1">Giới tính</th>
								<th scope="col-sm-1">Email</th>
								<th scope="col-sm-1">Password</th>
								<th scope="col-sm-1">Ngày sinh</th>
								<th scope="col-sm-3">Địa chỉ</th>
								<th scope="col-sm-1">Số điện thoại</th>
								<th scope="col-sm-1">Xóa</th>
							</tr>
						</thead>
						<tbody class="text-center">
							<%
							if (userList != null) {
								if (userList.size() > 0) {
									for (UserModel um : userList) {
							%>
							<tr>
								<td><%=um.getUserId()%></td>
								<td><%=um.getUserName()%></td>
								<td><%=um.getGender()%></td>
								<td><%=um.getEmail()%></td>
								<td><%=um.getPassword()%></td>
								<td><%=um.getBirthday()%></td>
								<td><%=um.getAddress()%></td>
								<td><%=um.getPhoneNumber()%></td>
								<td><a href="remove-to-user?id=<%=um.getUserId()%>" class="btn btn-danger">Xóa</a></td>
							</tr>
							<%
							}
							} else {
							%>
							<tr>
								<td colspan="12" class="fst-italic">Hiện chưa có khách hàng.</td>
							</tr>
							<%
							}
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>

	<%@include file="../common/footer.jsp"%>
	<script src="<c:url value="/js/jquery-3.6.3.min.js" />"></script>
	<script src="<c:url value="/js/bootstrap.min.js" />"></script>
</body>
</html>