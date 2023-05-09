<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% 
UserModel auth = (UserModel) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
} 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet" />
<link href="<c:url value="/css/reset.css" />" rel="stylesheet" />

<title>Sign Up</title>
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
                  <li class="breadcrumb-item active" aria-current="page">ĐĂNG KÝ</li>
                </ol>
              </nav>
            </div>
          </div>
          <div class="row d-flex justify-content-center pb-5">
            <div class="col col-lg-4 col-sm-12 border border-1 border-dark rounded p-5">
              <h2 class="text-center mb-5">ĐĂNG KÝ</h2>

              <form action="user-signup" method="post">
                <div class="form-outline mb-3">
                  <label class="form-label" for="txtName">Họ và tên</label>
                  <input
                    type="text"
                    id="txtName"
                    name="name"
                    class="form-control"
                    placeholder="Hãy nhập họ và tên của bạn"
                    required
                  />
                </div>
                <div class="form-outline mb-3">
                  <label class="form-label" for="txtEmail">Tên đăng nhập</label>
                  <input
                    type="email"
                    id="txtEmail"
                    name="email"
                    class="form-control"
                    placeholder="Hãy nhập địa chỉ email của bạn"
                    required
                  />
                </div>

                <div class="form-outline mb-3">
                  <label class="form-label" for="txtPassword">Mật khẩu</label>
                  <input
                    type="password"
                    id="txtPassword"
                    name="password"
                    class="form-control"
                    placeholder="Hãy nhập mật khẩu của bạn"
                    required
                  />
                </div>
                <div class="form-outline mb-3">
                  <label class="form-label" for="retypePass">Nhập lại mật khẩu</label>
                  <input
                    type="password"
                    id="retypePass"
                    class="form-control"
                    placeholder="Hãy nhập lại mật khẩu của bạn"
                    required
                  />
                </div>
                <input
                  type="submit"
                  value="Đăng ký"
                  class="btn btn-primary btn-block mb-4 btn-submit"
                />
                <input
                  type="reset"
                  value="Reset"
                  class="btn btn-primary btn-block mb-4 btn-reset"
                />

                <div class="text-center">
                  <p>Đã có tài khoản ? <a href="./sign-in.jsp">Đăng nhập</a></p>
                </div>
              </form>
            </div>
          </div>
        </div>
      </main>
	
	<%@include file="../common/footer.jsp" %>	
	<script src="<c:url value="/js/jquery-3.6.3.min.js" />"></script>
	<script src="<c:url value="/js/bootstrap.min.js" />"></script>
</body>
</html>