<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shoppingcart.model.CartModel"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
UserModel auth = (UserModel) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
} else {
	response.sendRedirect("sign-in.jsp");
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

<title>Cart</title>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<main class="main">
		<div class="container">
			<div class="row py-5">
				<div class="bg-light">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="./home.jsp"
								class="text-dark">TRANG CHỦ</a></li>
							<li class="breadcrumb-item active" aria-current="page">GIỎ
								HÀNG</li>
						</ol>
					</nav>
				</div>
			</div>
			<div class="row">
				<div class="h-100 h-custom">
					<div class="container h-100">
						<div class="row h-100">
							<div class="col">
								<div class="table-responsive mb-5">
									<table class="table">
										<thead>
											<tr>
												<th scope="col" class="h5">GIỎ HÀNG</th>
												<th scope="col"><h6 class="text-center">KÍCH THƯỚC</h6></th>
												<th scope="col text-center">
													<h6 class="text-center">SỐ LƯỢNG</h6>
												</th>
												<th scope="col text-center">
													<h6 class="text-center">GIÁ</h6>
												</th>
												<th scope="col text-center">
													<h6 class="text-center">XÓA</h6>
												</th>
											</tr>
										</thead>
										<tbody>
											<%
											if (cart != null) {
												if (cart.size() > 0) {
													for (CartModel cm : cart) {
											%>
											<tr>
												<td scope="row">
													<div class="d-flex align-items-center">
														<img src="<%=cm.getImgUrl()%>" class="img-fluid rounded-3"
															style="width: 120px"
															alt="Sản phẩm <%=cm.getProductId()%>" />
														<div class="flex-column ms-4">
															<p class="mb-2">
																<a
																	class="text-decoration-none text-dark fw-bold fw-bold"
																	href="product-detail.jsp?id=<%=cm.getProductId()%>"><%=cm.getProductName()%></a>
															</p>
															<p class="mb-0 text-secondary">
																Mã:
																<%=cm.getProductId()%></p>
														</div>
													</div>
												</td>
												<td class="align-middle">
													<p class="mb-0 text-center" style="font-weight: 500"><%=cm.getSize()%></p>
												</td>
												<td class="align-middle">
													<div class="d-flex flex-row justify-content-center">
														<p class="mb-0 text-center" style="font-weight: 500"><%=cm.getQuantity()%></p>
													</div>
												</td>
												<td class="align-middle">
													<p class="mb-0 text-center" style="font-weight: 500">
														<%=formatter.format((int) cm.getTotalPrice()) + " VNĐ"%>
													</p>
												</td>
												<td class="align-middle text-center"><a
													href="remove-to-cart?id=<%=cm.getProductId()%>"
													class="btn btn-danger px-2 btn-del"> <svg
															xmlns="http://www.w3.org/2000/svg" width="16" height="16"
															fill="currentColor" class="bi bi-trash3"
															viewBox="0 0 16 16">
                                  <path
																d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z" />
                                </svg>
														</button></td>
											</tr>
											<%
											}
											} else {
											%>
											<tr>
												<td colspan="12" class="fst-italic text-center">Hiện chưa có sản phẩm.</td>
											</tr>
											<%
											}
											}
											%>
										</tbody>
									</table>
								</div>

								<div class="d-flex justify-content-end">
									<div class="card shadow-2-strong mb-5 text-secondary"
										style="border-radius: 16px; width: 500px">
										<div class="card-body p-4">
											<div class="row">
												<div class="col">
													<div class="d-flex justify-content-between"
														style="font-weight: 500">
														<p class="mb-2">Tổng số tiền:</p>
														<%
														if (total > 0) {
														%>
														<p class="mb-2">
															<%=(formatter.format((int) total) + " VNĐ")%>
														</p>
														<%
														} else {
														%>
														<p class="mb-2">
															<%=(formatter.format(0) + " VNĐ")%>
														</p>
														<%
														}
														%>
													</div>

													<div class="d-flex justify-content-between"
														style="font-weight: 500">
														<p class="mb-0">Phí vận chuyển</p>
														<p class="mb-0">
															<%=(formatter.format(30000) + " VNĐ")%>
														</p>
													</div>

													<hr class="my-4" />

													<div class="d-flex justify-content-between mb-4"
														style="font-weight: 500">
														<p class="mb-2">Tổng tiền thanh toán:</p>
														<p class="mb-2">
															<%=(formatter.format(((int) total) + 30000) + " VNĐ")%>
														</p>
													</div>

													<a href="pay-to-cart"
														class="btn btn-primary btn-block btn-lg"> Thanh Toán </a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<%@include file="../common/footer.jsp"%>
	<script src="<c:url value="/js/jquery-3.6.3.min.js" />"></script>
	<script src="<c:url value="/js/bootstrap.min.js" />"></script>
</body>
</html>