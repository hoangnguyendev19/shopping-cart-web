<%@page import="com.shoppingcart.model.ProductModel"%>
<%@page import="com.shoppingcart.dao.ProductDao"%>
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

DecimalFormat formatter = new DecimalFormat("###,###,###");

ProductDao od = new ProductDao(ConnectDB.getConnection());
ArrayList<ProductModel> productList = od.getAllProducts();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet" />
<link href="<c:url value="/css/reset.css" />" rel="stylesheet" />

<title>Product Admin</title>
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
								LÝ SẢN PHẨM</li>
						</ol>
					</nav>
				</div>
			</div>

			<div class="row justify-content-between">
				<div class="col col-lg-5 col-sm-12 border border-1 border-dark rounded p-5 mb-3">
					<h2 class="text-center mb-5">THÊM SẢN PHẨM</h2>
					<form action="add-to-product" method="post">
						<div class="form-outline mb-3">
							<label class="form-label">Tên sản phẩm</label>
							<input type="text" name="name" class="form-control"
								placeholder="Hãy nhập tên sản phẩm" required />
						</div>
						<div class="form-outline mb-3">
							<label class="form-label">Hình ảnh</label>
							<input
								type="text" name="imgUrl" class="form-control"
								placeholder="Hãy nhập địa chỉ hình ảnh theo (../img/img-XX-XX)" required />
						</div>
						<div class="form-outline mb-3">
							<label class="form-label">Giá</label>
							<input
								type="text" name="price" class="form-control"
								placeholder="Hãy nhập giá sản phẩm" required />
						</div>

						<div class="form-outline mb-3">
							<label class="form-label">Loại</label> 
							<input
								type="text" name="category" class="form-control"
								placeholder="Hãy nhập loại sản phẩm (Áo,Đầm,Váy,Quần)" required />
						</div>
						<input type="submit" value="Thêm"
							class="btn btn-primary btn-block mb-4 btn-submit" />
					</form>
				</div>
				<div class="col col-lg-5 col-sm-12 border border-1 border-dark rounded p-5 mb-3">
					<h2 class="text-center mb-5">SỬA SẢN PHẨM</h2>
					<form action="update-to-product" method="post">
						<div class="form-outline mb-3">
							<label class="form-label" for="fr-id">Mã sản phẩm</label>
							<input type="text" id="fr-id" name="id" class="form-control"
								placeholder="Mã X" readonly />
						</div>
						<div class="form-outline mb-3">
							<label class="form-label" for="fr-name">Tên sản phẩm</label>
							<input type="text" id="fr-name" name="name" class="form-control"
								placeholder="Hãy nhập tên sản phẩm" required />
						</div>
						<div class="form-outline mb-3">
							<label class="form-label" for="fr-img">Hình ảnh</label>
							<input
								type="text" id="fr-img" name="imgUrl" class="form-control"
								placeholder="Hãy nhập địa chỉ hình ảnh theo (../img/img-XX-XX)" required />
						</div>
						<div class="form-outline mb-3">
							<label class="form-label" for="fr-price">Giá</label>
							<input
								type="text" id="fr-price" name="price" class="form-control"
								placeholder="Hãy nhập giá sản phẩm" required />
						</div>

						<div class="form-outline mb-3">
							<label class="form-label" for="fr-category">Loại</label> <input
								type="text" id="fr-category" name="category" class="form-control"
								placeholder="Hãy nhập loại sản phẩm (Áo, Đầm, Váy, Quần)" required />
						</div>
						<input type="submit" value="Cập nhật"
							class="btn btn-primary btn-block mb-4 btn-submit" />
					</form>
				</div>
			</div>

			<div class="row d-flex justify-content-between pb-5">
				<div class="col col-lg-12 col-sm-12">
					<table
						class="table table-hover table-responsive table-bordered border-secondary">
						<thead class="table-dark text-center">
							<tr>
								<th scope="col-sm-1">Mã sản phẩm</th>
								<th scope="col-sm-1">Tên sản phẩm</th>
								<th scope="col-sm-1">Hình ảnh</th>
								<th scope="col-sm-1">Giá</th>
								<th scope="col-sm-1">Loại</th>
								<th scope="col-sm-1">Xóa</th>
								<th scope="col-sm-1">Sửa</th>
							</tr>
						</thead>
						<tbody class="text-center">
							<%
							if (productList != null) {
								if (productList.size() > 0) {
									for (ProductModel pm : productList) {
							%>
							<tr>
								<td class="product-id" ><%=pm.getProductId()%></td>
								<td class="product-name" ><%=pm.getProductName()%></td>
								<td class="product-img" ><%=pm.getImgUrl()%></td>
								<td class="product-price" ><%=formatter.format(pm.getPrice())%></td>

								<%
								if (pm.getCategoryId() == 1) {
								%>
								<td class="product-category" >Áo</td>
								<%
								} else if (pm.getCategoryId() == 2) {
								%>
								<td class="product-category" >Đầm</td>
								<%
								} else if (pm.getCategoryId() == 3) {
								%>
								<td class="product-category" >Váy</td>
								<%
								} else if (pm.getCategoryId() == 4) {
								%>
								<td class="product-category" >Quần</td>
								<%
								}
								%>

								<td><a href="remove-to-product?id=<%=pm.getProductId()%>"
									class="btn btn-danger">Xóa</a></td>
								<td><a href="#"
									class="btn btn-success edit-product" >Sửa</a></td>
							</tr>
							<%
							}
							} else {
							%>
							<tr>
								<td colspan="12" class="fst-italic">Hiện chưa có sản phẩm.</td>
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
	<script src="<c:url value="/js/product-admin.js" />"></script>
</body>
</html>