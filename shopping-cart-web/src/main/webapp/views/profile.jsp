<%@page import="com.shoppingcart.dao.UserDao"%>
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
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet" />
<link href="<c:url value="/css/reset.css" />" rel="stylesheet" />

<title>Home</title>
</head>
<body>

	<%@include file="../common/header.jsp"%>

	<%
	UserDao ud = new UserDao(ConnectDB.getConnection());
	UserModel user = ud.getUserById(auth.getUserId());
	%>

	<main class="main">
		<section style="background-color: #eee;">
			<div class="container py-5">
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
					<div class="col-lg-4">
						<div class="card mb-4">
							<div class="card-body text-center">
								<div class="d-flex justify-content-center">
									<img src="../img/img-avatar-4.png" alt="avatar"
										class="rounded-circle img-fluid" style="width: 150px;">
								</div>
								<h5 class="my-3">Ảnh Đại Diện</h5>
								<p class="text-muted mb-1">Khách Hàng</p>
							</div>
						</div>
					</div>
					<div class="col-lg-8">
						<div class="card mb-4">
							<div class="card-body">
								<form action="update-to-profile" method="post">
									<div class="row">
										<div class="col-sm-3">
											<label for="name">Họ và tên</label>
										</div>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="name" id="name"
												value="<%=user.getUserName()%>" />
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<label for="gender">Giới tính</label>
										</div>
										<%
										if (user.getGender() != null && user.getGender().equals("Nam")) {
										%>
										<div class="col-sm-9">
											<input type="radio" name="gender" id="gender" value="Nam"
												checked /> Nam <input type="radio" name="gender"
												id="gender" value="Nu" /> Nữ <input type="radio"
												name="gender" id="gender" value="Khac" /> Khác
										</div>
										<%
										} else if (user.getGender() != null && user.getGender().equals("Nu")) {
										%>
										<div class="col-sm-9">
											<input type="radio" name="gender" id="gender" value="Nam" />
											Nam <input type="radio" name="gender" id="gender" value="Nu"
												checked /> Nữ <input type="radio" name="gender" id="gender"
												value="Khac" /> Khác
										</div>
										<%
										} else {
										%>
										<div class="col-sm-9">
											<input type="radio" name="gender" id="gender" value="Nam" />
											Nam <input type="radio" name="gender" id="gender" value="Nu" />
											Nữ <input type="radio" name="gender" id="gender" value="Khac"
												checked /> Khác
										</div>
										<%
										}
										%>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<label for="email">Email</label>
										</div>
										<div class="col-sm-9">
											<input type="email" class="form-control text-muted"
												name="email" id="email" value="<%=user.getEmail()%>"
												readonly />
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<label for="birthday">Ngày sinh</label>
										</div>
										<div class="col-sm-9">
											<input type="date" class="form-control" name="birthday"
												id="birthday" value="<%=(user.getBirthday() != null ? user.getBirthday() : "")%>" />
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<label for="address">Địa chỉ</label>
										</div>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="address"
												id="address" value="<%=(user.getAddress() != null ? user.getAddress() : "Khong co")%>" />
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<label for="phone">Số điện thoại</label>
										</div>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="phone"
												style="width: 100%;" id="phone"
												value="<%= (user.getPhoneNumber() != null ? user.getPhoneNumber() : "Khong co") %>" />
										</div>
									</div>
									<hr>
									<div class="row">
										<input type="submit" class="btn btn-primary" value="Cập nhật" />
									</div>
								</form>
							</div>
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