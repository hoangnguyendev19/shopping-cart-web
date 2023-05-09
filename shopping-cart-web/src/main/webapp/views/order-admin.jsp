<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shoppingcart.model.UserModel"%>
<%@page import="com.shoppingcart.model.OrderModel"%>
<%@page import="com.shoppingcart.dao.OrderDao"%>
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

DecimalFormat formatter = new DecimalFormat("###,###,###");

OrderDao od = new OrderDao(ConnectDB.getConnection());
ArrayList<OrderModel> orderList = od.getAllOrder();
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
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="./user-admin.jsp">Quản lý khách hàng</a></li>
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
							<li class="breadcrumb-item"><a href="#" class="text-dark">ADMIN</a></li>
							<li class="breadcrumb-item active" aria-current="page">QUẢN
								LÝ HÓA ĐƠN</li>
						</ol>
					</nav>
				</div>
			</div>

			<div class="row d-flex justify-content-between pb-5">
				<div class="col col-lg-12 col-sm-12">
					<table
						class="table table-hover table-responsive table-bordered border-secondary">
						<thead class="table-dark text-center">
							<tr>
								<th scope="col-sm-1">Mã hóa đơn</th>
								<th scope="col-sm-1">Mã khách hàng</th>
								<th scope="col-sm-1">Mã sản phẩm</th>
								<th scope="col-sm-1">Kích thước</th>
								<th scope="col-sm-1">Số lượng</th>
								<th scope="col-sm-1">Thành tiền</th>
								<th scope="col-sm-2">Ngày đặt</th>
								<th scope="col-sm-2">Trạng thái</th>
								<th scope="col-sm-1">Hủy đơn</th>
								<th scope="col-sm-1">Chấp nhận đơn</th>
							</tr>
						</thead>
						<tbody class="text-center">
							<%
							if (orderList != null) {
								if (orderList.size() > 0) {
									for (OrderModel om : orderList) {
							%>
							<tr>
								<td><%=om.getOrderId()%></td>
								<td><%=om.getUserId()%></td>
								<td><%=om.getUserId()%></td>
								<td><%=om.getSize()%></td>
								<td><%=om.getQuantity()%></td>
								<td><%=formatter.format(om.getTotalPrice()) + " VND"%></td>
								<td><%=om.getOrderDate()%></td>
								<td><%=om.getStatus()%></td>
								<td><a href="remove-to-order?id=<%=om.getOrderId()%>"
									class="btn btn-danger">Hủy</a></td>
								<td><a href="update-to-status?id=<%=om.getOrderId()%>"
									class="btn btn-success">Chấp nhận</a></td>
							</tr>
							<%
							}
							} else {
							%>
							<tr>
								<td colspan="12" class="fst-italic">Hiện chưa có hóa đơn.</td>
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