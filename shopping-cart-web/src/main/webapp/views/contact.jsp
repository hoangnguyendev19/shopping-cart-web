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

<title>Contact</title>
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
                  <li class="breadcrumb-item active" aria-current="page">LIÊN LẠC</li>
                </ol>
              </nav>
            </div>
          </div>
        </div>
        <div>
          <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.8581690523774!2d106.68465671472212!3d10.822164161307272!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174deb3ef536f31%3A0x8b7bb8b7c956157b!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBDw7RuZyBuZ2hp4buHcCBUUC5IQ00!5e0!3m2!1svi!2s!4v1678715881876!5m2!1svi!2s"
            width="100%"
            height="600"
            style="border: 0"
            allowfullscreen=""
            loading="lazy"
            referrerpolicy="no-referrer-when-downgrade"
          ></iframe>
        </div>
        <div class="container">
			<div class="row py-5">
				<div class="col col-lg-5 col-sm-12 col-12 mb-4">
					<h2 class="mb-5">
						<span class="border-bottom border-4 border-dark fs-3">LIÊN
							HỆ</span>
					</h2>
					<ul class="list-unstyled">
						<li class="mb-4">
							<p class="text-secondary">Địa chỉ chúng tôi</p>
							<p class="fst-italic">Lầu 4, Tòa A, 12 Nguyễn Văn Bảo, phường
								4, Gò Vấp, Thành phố Hồ Chí Minh.</p>
						</li>
						<li class="mb-4">
							<p class="text-secondary">Email chúng tôi</p>
							<p class="fst-italic">hoangnguyen@gmail.com</p>
						</li>
						<li class="mb-4">
							<p class="text-secondary">Điện thoại</p>
							<p class="fst-italic">1900.636.099</p>
						</li>
						<li>
							<p class="text-secondary">Thời gian làm việc</p>
							<p class="fst-italic">Từ thứ 2 đến thứ 6 từ 8h đến 20h; Thứ 7
								và Chủ Nhật từ 8h đến 22h</p>
						</li>
					</ul>
				</div>
				<div class="col col-lg-7 col-sm-12 col-12">
					<h2 class="mb-5">
						<span class="border-bottom border-4 border-dark fs-3">GỬI
							THẮC MẮC CHO CHÚNG TÔI</span>
					</h2>
					<form>
						<div class="mb-3">
							<label for="formGroupExampleInput" class="form-label">Họ
								và tên</label> <input type="text" class="form-control"
								id="formGroupExampleInput"
								placeholder="Hãy nhập họ và tên của bạn" />
						</div>
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">Địa
								chỉ email</label> <input type="email" class="form-control"
								id="exampleFormControlInput1"
								placeholder="Hãy nhập địa chỉ email của bạn" />
						</div>
						<div class="mb-3">
							<label for="formGroupExampleInput2" class="form-label">Số
								điện thoại</label> <input type="text" class="form-control"
								id="formGroupExampleInput2"
								placeholder="Hãy nhập số điện thoại của bạn" />
						</div>
						<div class="mb-3">
							<label for="exampleFormControlTextarea1" class="form-label">Nội
								dung tin nhắn</label>
							<textarea class="form-control" id="exampleFormControlTextarea1"
								rows="6"
								placeholder="Hãy nhập nội dung tin nhắn của bạn cho chúng tôi"></textarea>
						</div>
						<div>
							<button type="button" class="btn btn-dark rounded-pill px-4 py-3">
								Gửi cho chúng tôi</button>
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