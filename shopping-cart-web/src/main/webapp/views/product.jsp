<%@page import="java.text.DecimalFormat"%>
<%@page import="com.shoppingcart.model.ProductModel"%>
<%@page import="com.shoppingcart.connection.ConnectDB"%>
<%@page import="com.shoppingcart.dao.ProductDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shoppingcart.model.UserModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% 
UserModel auth = (UserModel) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
} 
%>

<%
String category = request.getParameter("category");
ProductDao pd = new ProductDao(ConnectDB.getConnection());
ArrayList<ProductModel> productList = null;
if (category != null) {
	productList = pd.getProductByCategory(category);
} else {
	productList = pd.getAllProducts();
}

DecimalFormat formatter = new DecimalFormat("###,###,###");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet" />
<link href="<c:url value="/css/reset.css" />" rel="stylesheet" />

<title>Product</title>
</head>
<body>
	<%@include file="../common/header.jsp"%>

	<main class="main">
		<section class="banner">
			<div>
				<img src="../img/img-banner-shirt.jpg" class="img-fluid img-banner"
					alt="Banner 7" />
			</div>
		</section>
		<section class="content">
			<div class="container">
				<div class="bg-light">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="./home.jsp"
								class="text-dark">TRANG CHỦ</a></li>
							<li class="breadcrumb-item active" aria-current="page">SẢN
								PHẨM</li>
						</ol>
					</nav>
				</div>
				<div class="row">
					<div class="col col-lg-3 col-sm-12 mb-4">
						<ul class="dropdown-menu mb-4 d-block" style="position: unset;">
							<li><h6 class="dropdown-header">Danh Mục</h6></li>
							<%
							if (category != null) {
								if (category.equals("shirt")) {
							%>
							<li class="selected"><a class="dropdown-item"
								href="product.jsp">Tất cả</a></li>
							<li class="selected"><a class="dropdown-item active"
								href="?category=shirt">Áo</a></li>
							<li class="selected"><a class="dropdown-item"
								href="?category=dress">Đầm</a></li>
							<li class="selected"><a class="dropdown-item"
								href="?category=skirt">Váy</a></li>
							<li class="selected"><a class="dropdown-item"
								href="?category=pant">Quần</a></li>
							<%
							} else if (category.equals("dress")) {
							%>
							<li class="selected"><a class="dropdown-item"
								href="product.jsp">Tất cả</a></li>
							<li class="selected"><a class="dropdown-item"
								href="?category=shirt">Áo</a></li>
							<li class="selected"><a class="dropdown-item active"
								href="?category=dress">Đầm</a></li>
							<li class="selected"><a class="dropdown-item"
								href="?category=skirt">Váy</a></li>
							<li class="selected"><a class="dropdown-item"
								href="?category=pant">Quần</a></li>
							<%
							} else if (category.equals("skirt")) {
							%>
							<li class="selected"><a class="dropdown-item"
								href="product.jsp">Tất cả</a></li>
							<li class="selected"><a class="dropdown-item"
								href="?category=shirt">Áo</a></li>
							<li class="selected"><a class="dropdown-item"
								href="?category=dress">Đầm</a></li>
							<li class="selected"><a class="dropdown-item active"
								href="?category=skirt">Váy</a></li>
							<li class="selected"><a class="dropdown-item"
								href="?category=pant">Quần</a></li>
							<%
							} else if (category.equals("pant")) {
							%>
							<li class="selected"><a class="dropdown-item"
								href="product.jsp">Tất cả</a></li>
							<li class="selected"><a class="dropdown-item"
								href="?category=shirt">Áo</a></li>
							<li class="selected"><a class="dropdown-item"
								href="?category=dress">Đầm</a></li>
							<li class="selected"><a class="dropdown-item"
								href="?category=skirt">Váy</a></li>
							<li class="selected"><a class="dropdown-item active"
								href="?category=pant">Quần</a></li>
							<%
							}
							%>
							<%
							} else {
							%>
							<li class="selected"><a class="dropdown-item active"
								href="product.jsp">Tất cả</a></li>
							<li class="selected"><a class="dropdown-item"
								href="?category=shirt">Áo</a></li>
							<li class="selected"><a class="dropdown-item"
								href="?category=dress">Đầm</a></li>
							<li class="selected"><a class="dropdown-item"
								href="?category=skirt">Váy</a></li>
							<li class="selected"><a class="dropdown-item"
								href="?category=pant">Quần</a></li>
							<%
							}
							%>

						</ul>
						<ul class="dropdown-menu d-block" style="position: unset;">
							<li><h6 class="dropdown-header">Mức giá</h6></li>
							<li><label class="dropdown-item" for="radio-100"> <input
									type="radio" id="radio-100" name="form-radio" value="100" />
									Dưới 100.000đ
							</label></li>
							<li><label class="dropdown-item" for="radio-300"> <input
									type="radio" id="radio-300" name="form-radio" value="100-300" />
									Từ 100.000đ đến 300.000đ
							</label></li>
							<li><label class="dropdown-item" for="radio-500"> <input
									type="radio" id="radio-500" name="form-radio" /> Từ 300.000đ
									đến 500.000đ
							</label></li>
							<li><label class="dropdown-item" for="radio-1000"> <input
									type="radio" id="radio-1000" name="form-radio" /> Từ 500.000đ
									đến 1.000.000đ
							</label></li>
							<li><label class="dropdown-item" for="radio-2000"> <input
									type="radio" id="radio-2000" name="form-radio" /> Trên
									1.000.000đ
							</label></li>
						</ul>
					</div>

					<div class="col col-lg-9 col-sm-12">
						<div class="row d-flex justify-content-between mb-3">
							<div class="col col-sm-12 col-12">
								<h2 class="text-secondary">Tất cả sản phẩm</h2>
							</div>
						</div>
						<div class="row product__list">
							<%
							if (!productList.isEmpty()) {
								for (ProductModel product : productList) {
							%>
							<div
								class="col col-lg-4 col-sm-6 col-12 d-flex justify-content-center mb-4 product">
								<div class="card" style="width: 18rem; height: 460px">
									<img src="<%=product.getImgUrl()%>" class="card-img-top"
										alt="Áo <%product.getProductId();%>" />
									<div
										class="card-body d-flex flex-column justify-content-between">
										<div>
											<a class="text-decoration-none text-dark"
												href="product-detail.jsp?id=<%=product.getProductId()%>"><%=product.getProductName()%></a>
										</div>
										<div
											class="d-flex justify-content-between align-items-center card-price">
											<span class="card-link text-secondary"><%= formatter.format((int) product.getPrice())+" VND" %></span>
											<a href="product-detail.jsp?id=<%=product.getProductId()%>"
												class="btn btn-primary">Xem Chi Tiết</a>
										</div>
									</div>
								</div>
							</div>
							<%
							}

							}
							%>
						</div>
						<div class="row mt-4">
							<nav aria-label="Page navigation example">
								<ul class="pagination d-flex justify-content-center">
									<li class="page-item disabled"><a class="page-link"
										href="#" aria-label="Previous" aria-disabled="true"> <span
											aria-hidden="true">&laquo;</span>
									</a></li>
									<li class="page-item active"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<%@include file="../common/footer.jsp"%>
	<script src="<c:url value="/js/jquery-3.6.3.min.js" />"></script>
	<script src="<c:url value="/js/bootstrap.min.js" />"></script>
</body>
</html>