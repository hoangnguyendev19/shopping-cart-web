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

<title>News</title>
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
                  <li class="breadcrumb-item active" aria-current="page">TIN TỨC</li>
                </ol>
              </nav>
            </div>
          </div>
          <div class="row">
            <div class="col col-lg-9 col-sm-12 col-12 mb-4">
              <h2 class="text-secondary mb-3">TIN TỨC</h2>
              <div class="card mb-3">
                <img src="../img/img-tintuc-1.jpg" class="card-img-top" alt="ảnh tin tức 1" />
                <div class="card-body">
                  <h5 class="card-title">
                    <a href="#">Tổng hợp 10 mẫu áo phù hợp với xu hướng của năm 2023</a>
                  </h5>
                  <p class="card-text">
                    Những chiếc áo form rộng luôn mang đến phong cách thời trang mới lạ, cá tính,
                    trẻ trung và thời thượng. Đặc biệt những chiếc áo này sẽ cho bạn cảm giác thoải
                    mái, dễ chịu khi mặc chúng trong những ngày hè nóng nực. Hãy cùng chúng tôi điểm
                    qua những chiếc áo đang hot nhất trong năm 2019 trong bài viết dưới đây nhé!
                  </p>
                  <p class="card-text"><small class="text-muted">11.03.2023</small></p>
                </div>
              </div>
              <div class="card mb-3">
                <img src="../img/img-tintuc-2.jpg" class="card-img-top" alt="ảnh tin tức 2" />
                <div class="card-body">
                  <h5 class="card-title">
                    <a href="#">Mẹo mua sắm thông minh mùa "Giảm giá" theo tâm lý học</a>
                  </h5>
                  <p class="card-text">
                    Hiểu rõ hiệu ứng tâm lý đằng sau các chiến dịch khuyến mãi thường thấy sẽ giúp
                    bạn đưa ra những quyết định mua sắm thông minh. Mùa cuối năm là thời điểm bận
                    rộn nhất trong năm của các cửa hàng bán lẻ. Theo Salesforce, doanh thu từ thương
                    mại điện tử sẽ tăng 13% trong năm nay, đưa con số này đến 136 tỉ đô la Mỹ. Báo
                    cáo trên dựa trên cuộc khảo sát hơn 10 nghìn người tiêu dùng trên các trang
                    thương mại điện tử lớn. Vậy làm thế nào để mua sắm thông minh giữa “tâm bão”
                    giảm giá cuối năm?
                  </p>
                  <p class="card-text"><small class="text-muted">24.03.2023</small></p>
                </div>
              </div>
              <div class="card mb-3">
                <img src="../img/img-tintuc-3.png" class="card-img-top" alt="ảnh tin tức 3" />
                <div class="card-body">
                  <h5 class="card-title">
                    <a href="#"
                      >Top 5 bộ quần áo đang được khách hàng ưu chuộng nhất tại cửa hàng.</a
                    >
                  </h5>
                  <p class="card-text">
                    Xu hướng thời trang nữ với họa tiết kẻ sọc hứa hẹn sẽ làm nên chuyện trong năm
                    tới. Đây là một trong những mẫu họa tiết cực kì dễ tính, giúp bạn thoải mái phối
                    với những item khác nhau thể hiện phong cách riêng. Do đó, bất cứ cô nàng nào
                    cũng sở hữu vài chiếc áo thun sọc năng động, áo blazer hay sơ mi sọc thanh lịch
                    trong tủ đồ của mình.
                  </p>
                  <p class="card-text"><small class="text-muted">12.04.2023</small></p>
                </div>
              </div>
              <div class="card mb-3">
                <img src="../img/img-tintuc-4.png" class="card-img-top" alt="ảnh tin tức 4" />
                <div class="card-body">
                  <h5 class="card-title">
                    <a href="#">Các bước săn sale vào dịp Hè tháng 5 sắp tới năm 2023.</a>
                  </h5>
                  <p class="card-text">
                    Tháng 5 sắp tới, xu hướng thời thời trang mát mẻ, đơn giản phù hợp với tất cả
                    vóc dáng. Đây là một trong những đợt sale lớn nhất trong năm 2023 với nhiều mã
                    giảm giá hấp dẫn kèm nhiều phần quà trúng thưởng có thể mang đến giá trị rất cao
                    trong bộ sưu tập mùa hè này do nhà thiết kế Nguyễn Huy Hoàng sáng tạo ra.
                  </p>
                  <p class="card-text"><small class="text-muted">29.04.2023</small></p>
                </div>
              </div>
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