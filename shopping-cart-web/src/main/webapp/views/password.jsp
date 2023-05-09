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
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet" />
<link href="<c:url value="/css/reset.css" />" rel="stylesheet" />

<title>Sign In</title>
</head>
<body>
	<%@include file="../common/header.jsp" %>
	
	<main class="main">
        <div class="container">
          <div class="row py-5">
            <div class="bg-light">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item">
                    <a href="./home.jsp" class="text-dark">TRANG CHỦ</a>
                  </li>
                  <li class="breadcrumb-item active" aria-current="page">THAY ĐỔI MẬT KHẨU</li>
                </ol>
              </nav>
            </div>
          </div>
          <div class="row d-flex justify-content-center pb-5">
            <div class="col col-lg-4 border border-1 border-dark rounded p-5">
              <h2 class="text-center mb-5">THAY ĐỔI MẬT KHẨU</h2>

              <form action="update-to-password" method="post" >
                <div class="form-outline mb-3">
                  <label class="form-label" for="txtEmail">Tên đăng nhập</label>
                  <input
                    type="email"
                    id="email"
                    name="email"
                    class="form-control"
                    placeholder="Hãy nhập địa chỉ email của bạn"
                    required
                  />
                </div>

                <div class="form-outline mb-3">
                  <label class="form-label" for="oldPassword">Mật khẩu hiện tại</label>
                  <input
                    type="password"
                    id="oldPassword"
                    name="oldPassword"
                    class="form-control"
                    placeholder="Hãy nhập mật khẩu hiện tại của bạn"
                    required
                  />
                </div>
                
                <div class="form-outline mb-3">
                  <label class="form-label" for="newPassword">Mật khẩu mới</label>
                  <input
                    type="password"
                    id="newPassword"
                    name="newPassword"
                    class="form-control"
                    placeholder="Hãy nhập mật khẩu mới của bạn"
                    required
                  />
                </div>
                
                <div>
                	<input type="submit" class="btn btn-primary" value="Cập nhật" />
                </div>
              </form>
            </div>
          </div>
        </div>
      </main>
	
	<%@include file="../common/footer.jsp" %>	
	<script src="<c:url value="/jquery-3.6.3.min.js" />"></script>
	<script src="<c:url value="/js/bootstrap.min.js" />"></script>
</body>
</html>