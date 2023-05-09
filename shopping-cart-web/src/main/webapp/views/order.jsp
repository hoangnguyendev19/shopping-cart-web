<%@page import="java.text.DecimalFormat"%>
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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet" />
<link href="<c:url value="/css/reset.css" />" rel="stylesheet" />

<title>Order</title>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<%
	OrderDao od = new OrderDao(ConnectDB.getConnection());
	ArrayList<OrderModel> orderList = od.getOrderByUser(auth);
	%>
	<main class="main">
		<div class="container">
			<div class="row py-5">
				<div class="bg-light">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="./home.jsp"
								class="text-dark">TRANG CHỦ</a></li>
							<li class="breadcrumb-item active" aria-current="page">HÓA
								ĐƠN</li>
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
								<th scope="col-sm-3">Tên sản phẩm</th>
								<th scope="col-sm-1">Kích thước</th>
								<th scope="col-sm-1">Số lượng</th>
								<th scope="col-sm-1">Giá</th>
								<th scope="col-sm-1">Thành tiền</th>
								<th scope="col-sm-2">Ngày đặt</th>
								<th scope="col-sm-2">Trạng thái</th>
								<th scope="col-sm-1">Hủy đơn</th>
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
								<td><%=om.getProductName()%></td>
								<td><%=om.getSize()%></td>
								<td><%=om.getQuantity()%></td>
								<td><%=formatter.format(om.getPrice()) + " VND"%></td>
								<td><%=formatter.format(om.getTotalPrice()) + " VND"%></td>
								<td><%=om.getOrderDate()%></td>
								<td><%=om.getStatus()%></td>
								<td>
									<% if(om.getStatus().equals("Đang đặt hàng")) { %>
										<a href="remove-to-order?id=<%= om.getOrderId() %>"  class="btn btn-danger" >Hủy</a>
									<% } %>
								</td>
							</tr>
							<%
							}
							} else {
							%>
							<tr>
								<td colspan="12" class="fst-italic" >Hiện chưa có hóa đơn.</td>
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