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

<title>Introduce</title>
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
                  <li class="breadcrumb-item active" aria-current="page">GIỚI THIỆU</li>
                </ol>
              </nav>
            </div>
          </div>
          <div class="row">
            <div class="col col-lg-9 col-sm-12 col-12 mb-4">
              <h2 class="text-secondary mb-3">GIỚI THIỆU</h2>
              <p>
                Website bán hàng thời trang nữ cung cấp các sản phẩm quần áo, thời trang nữ uy tín,
                theo xu hướng của năm 2023.
              </p>
              <p>
                Website còn giúp các chị em phụ nữ có thể tìm mua những bộ quần áo phù hợp với vóc
                dáng, giá rẻ mà lại còn nhiều ưu đãi khuyến mãi thường xuyên.
              </p>
              <h3 class="text-secondary mb-3">Thông tin cá nhân</h3>
              <ul class="list-unstyled">
                <li>
                  <p class="fst-italic">Nguyễn Huy Hoàng</p>
                </li>
              </ul>
            </div>
            <div class="col col-lg-3 col-sm-12 col-12 mb-4">
              <div class="accordion" id="accordionExample">
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingOne">
                    <button
                      class="accordion-button"
                      type="button"
                      data-bs-toggle="collapse"
                      data-bs-target="#collapseOne"
                      aria-expanded="true"
                      aria-controls="collapseOne"
                    >
                      <span class="text-secondary">BÀI VIẾT MỚI NHẤT</span>
                    </button>
                  </h2>
                  <div
                    id="collapseOne"
                    class="accordion-collapse collapse show"
                    aria-labelledby="headingOne"
                    data-bs-parent="#accordionExample"
                  >
                    <div class="accordion-body">
                      <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                          <p>
                            <a href="./news.jsp" class="text-decoration-none"
                              >Tổng hợp 10 mẫu áo phù hợp với xu hướng của năm 2023</a
                            >
                          </p>
                          <p class="fst-italic">11.03.2023</p>
                        </li>
                        <li class="list-group-item">
                          <p>
                            <a href="./news.jsp" class="text-decoration-none"
                              >Mẹo mua sắm thông minh mùa "Giảm giá" theo tâm lý học</a
                            >
                          </p>
                          <p class="fst-italic">24.03.2023</p>
                        </li>
                        <li class="list-group-item">
                          <p>
                            <a href="./news.jsp" class="text-decoration-none"
                              >Top 5 bộ quần áo đang được khách hàng ưu chuộng nhất tại cửa hàng.</a
                            >
                          </p>
                          <p class="fst-italic">29.04.2023</p>
                        </li>
                        <li class="list-group-item">
                          <p>
                            <a href="./news.jsp" class="text-decoration-none"
                              >Các bước săn sale vào dịp Hè tháng 5 sắp tới năm 2023</a
                            >
                          </p>
                          <p class="fst-italic">20.05.2023</p>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingTwo">
                    <button
                      class="accordion-button collapsed"
                      type="button"
                      data-bs-toggle="collapse"
                      data-bs-target="#collapseTwo"
                      aria-expanded="false"
                      aria-controls="collapseTwo"
                    >
                      <span class="text-secondary">DANH MỤC KHÁC</span>
                    </button>
                  </h2>
                  <div
                    id="collapseTwo"
                    class="accordion-collapse collapse"
                    aria-labelledby="headingTwo"
                    data-bs-parent="#accordionExample"
                  >
                    <div class="accordion-body">
                      <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                          <a href="./introduce.jsp" class="text-decoration-none"
                            >Giới thiệu</a
                          >
                        </li>
                        <li class="list-group-item">
                          <a href="./product.jsp" class="text-decoration-none">Sản phẩm</a>
                        </li>
                        <li class="list-group-item">
                          <a href="./news.jsp" class="text-decoration-none">Tin tức</a>
                        </li>
                        <li class="list-group-item">
                          <a href="./contact.jsp" class="text-decoration-none">Liên lạc</a>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
	
	<%@include file="../common/footer.jsp" %>	
	<script src="<c:url value="/js/jquery-3.6.3.min.js" />"></script>
	<script src="<c:url value="/js/bootstrap.min.js" />"></script>
</body>
</html>