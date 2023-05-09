<%@page import="com.shoppingcart.connection.ConnectDB"%>
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

<title>Home</title>
</head>
<body>

	<%@include file="../common/header.jsp"%>

	<main class="main">
		<section class="banner">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="../img/img-banner-1.jpg" class="d-block w-100"
							alt="Banner 1" />
					</div>
					<div class="carousel-item">
						<img src="../img/img-banner-2.jpg" class="d-block w-100"
							alt="Banner 2" />
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</section>
		<section class="new-arrivals py-5">
			<div class="container">
				<h2 class="text-center text-secondary mb-4">New Arrivals</h2>
				<div class="row justify-content-center">
					<div
						class="col col-lg-3 col-md-6 col-sm-12 mb-4 d-flex justify-content-center">
						<div class="card" style="width: 18rem; height: 460px">
							<img src="../img/img-shirt-1.jpeg"
								class="card-img-top card-img-arrivals" alt="Sản phẩm 1" />
							<div class="card-body d-flex flex-column justify-content-between">
								<div>
									<a class="text-decoration-none text-dark"
										href="product-detail.jsp?id=1">ÁO
										THUN FORM BOXY IN “TAKE TO HEART”</a>
								</div>
								<div class="d-flex justify-content-between align-items-center">
									<span class="card-link text-secondary">399,000đ</span> <a
										href="product-detail.jsp?id=1"
										class="btn btn-primary">Xem Chi
										Tiết</a>
								</div>
							</div>
						</div>
					</div>
					<div
						class="col col-lg-3 col-md-6 col-sm-12 mb-4 d-flex justify-content-center">
						<div class="card" style="width: 18rem; height: 460px">
							<img src="../img/img-shirt-2.jpeg"
								class="card-img-top card-img-arrivals" alt="Sản phẩm 2" />
							<div class="card-body d-flex flex-column justify-content-between">
								<div>
									<a class="text-decoration-none text-dark"
										href="product-detail.jsp?id=2">ÁO
										THUN FORM BOXY IN “MUSÉE”</a>
								</div>
								<div class="d-flex justify-content-between align-items-center">
									<span class="card-link text-secondary">299,000đ</span> <a
										href="product-detail.jsp?id=2"
										class="btn btn-primary">Xem Chi
										Tiết</a>
								</div>
							</div>
						</div>
					</div>
					<div
						class="col col-lg-3 col-md-6 col-sm-12 mb-4 d-flex justify-content-center">
						<div class="card" style="width: 18rem; height: 460px">
							<img src="../img/img-skirt-3.jpeg"
								class="card-img-top card-img-arrivals" alt="Sản phẩm 3" />
							<div class="card-body d-flex flex-column justify-content-between">
								<div>
									<a class="text-decoration-none text-dark"
										href="product-detail.jsp?id=15">CHÂN
										VÁY A MINI TÚI TRANG TRÍ NÚT</a>
								</div>
								<div class="d-flex justify-content-between align-items-center">
									<span class="card-link text-secondary">399,000đ</span> <a
										href="product-detail.jsp?id=15"
										class="btn btn-primary">Xem Chi
										Tiết</a>
								</div>
							</div>
						</div>
					</div>
					<div
						class="col col-lg-3 col-md-6 col-sm-12 mb-4 d-flex justify-content-center">
						<div class="card" style="width: 18rem; height: 460px">
							<img src="../img/img-skirt-4.jpg"
								class="card-img-top card-img-arrivals" alt="Sản phẩm 4" />
							<div class="card-body d-flex flex-column justify-content-between">
								<div>
									<a class="text-decoration-none text-dark"
										href="product-detail.jsp?id=16">CHÂN
										VÁY MINI KIỂU XẾP ĐẮP</a>
								</div>
								<div class="d-flex justify-content-between align-items-center">
									<span class="card-link text-secondary">199,000đ</span> <a
										href="product-detail.jsp?id=16"
										class="btn btn-primary">Xem Chi
										Tiết</a>
								</div>
							</div>
						</div>
					</div>
					<div
						class="col col-lg-3 col-md-6 col-sm-12 mb-4 d-flex justify-content-center">
						<div class="card" style="width: 18rem; height: 460px">
							<img src="../img/img-pant-5.jpeg"
								class="card-img-top card-img-arrivals" alt="Sản phẩm 5" />
							<div class="card-body d-flex flex-column justify-content-between">
								<div>
									<a class="text-decoration-none text-dark"
										href="product-detail.jsp?id=23">QUẦN
										DÀI ỐNG RỘNG GẬP GẤU</a>
								</div>
								<div class="d-flex justify-content-between align-items-center">
									<span class="card-link text-secondary">599,000đ</span> <a
										href="product-detail.jsp?id=23"
										class="btn btn-primary">Xem Chi
										Tiết</a>
								</div>
							</div>
						</div>
					</div>
					<div
						class="col col-lg-3 col-md-6 col-sm-12 mb-4 d-flex justify-content-center">
						<div class="card" style="width: 18rem; height: 460px">
							<img src="../img/img-pant-6.jpeg"
								class="card-img-top card-img-arrivals" alt="Sản phẩm 6" />
							<div class="card-body d-flex flex-column justify-content-between">
								<div>
									<a class="text-decoration-none text-dark"
										href="product-detail.jsp?id=24">QUẦN
										JEANS LỬNG FORM SKINNY</a>
								</div>
								<div class="d-flex justify-content-between align-items-center">
									<span class="card-link text-secondary">599,000đ</span> <a
										href="product-detail.jsp?id=24"
										class="btn btn-primary">Xem Chi
										Tiết</a>
								</div>
							</div>
						</div>
					</div>
					<div
						class="col col-lg-3 col-md-6 col-sm-12 mb-4 d-flex justify-content-center">
						<div class="card" style="width: 18rem; height: 460px">
							<img src="../img/img-dress-5.jpeg"
								class="card-img-top card-img-arrivals" alt="Sản phẩm 7" />
							<div class="card-body d-flex flex-column justify-content-between">
								<div>
									<a class="text-decoration-none text-dark"
										href="product-detail.jsp?id=11">ĐẦM
										NGẮN NHÚN NGỰC IN HOA</a>
								</div>
								<div class="d-flex justify-content-between align-items-center">
									<span class="card-link text-secondary">599,000đ</span> <a
										href="product-detail.jsp?id=11"
										class="btn btn-primary">Xem Chi
										Tiết</a>
								</div>
							</div>
						</div>
					</div>
					<div
						class="col col-lg-3 col-md-6 col-sm-12 mb-4 d-flex justify-content-center">
						<div class="card" style="width: 18rem; height: 460px">
							<img src="../img/img-dress-6.jpeg"
								class="card-img-top card-img-arrivals" alt="Sản phẩm 8" />
							<div class="card-body d-flex flex-column justify-content-between">
								<div>
									<a class="text-decoration-none text-dark"
										href="product-detail.jsp?id=12">ĐẦM
										NHÚN NGỰC XOÈ BẸT VAI</a>
								</div>
								<div class="d-flex justify-content-between align-items-center">
									<span class="card-link text-secondary">599,000đ</span> <a
										href="product-detail.jsp?id=12"
										class="btn btn-primary">Xem Chi
										Tiết</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row text-center mt-4">
					<a href="./product.jsp" class="text-primary fs-5">Xem tất cả</a>
				</div>
			</div>
		</section>
		<section class="new-dress py-5">
			<div class="container">
				<h2 class="text-center text-secondary mb-4">New Dress</h2>
				<div class="row mb-4">
					<img src="../img/img-banner-3.jpg" class="img-fluid" alt="Banner 3" />
				</div>
				<div class="row justify-content-center">
					<div
						class="col col-lg-3 col-md-6 col-sm-12 mb-4 d-flex justify-content-center">
						<div class="card" style="width: 18rem; height: 460px">
							<img src="../img/img-dress-1.jpeg"
								class="card-img-top card-img-dress" alt="Sản phẩm 1" />
							<div class="card-body d-flex flex-column justify-content-between">
								<div>
									<a class="text-decoration-none text-dark"
										href="product-detail.jsp?id=7">ĐẦM
										XẾP NHÚN CHÉO NGỰC</a>
								</div>
								<div class="d-flex justify-content-between align-items-center">
									<span class="card-link text-secondary">499,000đ</span> <a
										href="product-detail.jsp?id=7"
										class="btn btn-primary">Xem Chi
										Tiết</a>
								</div>
							</div>
						</div>
					</div>
					<div
						class="col col-lg-3 col-md-6 col-sm-12 mb-4 d-flex justify-content-center">
						<div class="card" style="width: 18rem; height: 460px">
							<img src="../img/img-dress-2.jpeg"
								class="card-img-top card-img-dress" alt="Sản phẩm 2" />
							<div class="card-body d-flex flex-column justify-content-between">
								<div>
									<a class="text-decoration-none text-dark"
										href="product-detail.jsp?id=8">ĐẦM
										THUN TAY DÀI NƠ NGỰC</a>
								</div>
								<div class="d-flex justify-content-between align-items-center">
									<span class="card-link text-secondary">549,000đ</span> <a
										href="product-detail.jsp?id=8"
										class="btn btn-primary">Xem Chi
										Tiết</a>
								</div>
							</div>
						</div>
					</div>
					<div
						class="col col-lg-3 col-md-6 col-sm-12 mb-4 d-flex justify-content-center">
						<div class="card" style="width: 18rem; height: 460px">
							<img src="../img/img-dress-3.jpeg"
								class="card-img-top card-img-dress" alt="Sản phẩm 3" />
							<div class="card-body d-flex flex-column justify-content-between">
								<div>
									<a class="text-decoration-none text-dark"
										href="product-detail.jsp?id=9">ĐẦM
										NGẮN 2 TẦNG NGỰC XẾP</a>
								</div>
								<div class="d-flex justify-content-between align-items-center">
									<span class="card-link text-secondary">649,000đ</span> <a
										href="product-detail.jsp?id=9"
										class="btn btn-primary">Xem Chi
										Tiết</a>
								</div>
							</div>
						</div>
					</div>
					<div
						class="col col-lg-3 col-md-6 col-sm-12 mb-4 d-flex justify-content-center">
						<div class="card" style="width: 18rem; height: 460px">
							<img src="../img/img-dress-4.jpeg"
								class="card-img-top card-img-dress" alt="Sản phẩm 4" />
							<div class="card-body d-flex flex-column justify-content-between">
								<div>
									<a class="text-decoration-none text-dark"
										href="product-detail.jsp?id=10">ĐẦM
										2 DÂY DÀI BUỘC NƠ VAI</a>
								</div>
								<div class="d-flex justify-content-between align-items-center">
									<span class="card-link text-secondary">599,000đ</span> <a
										href="product-detail.jsp?id=10"
										class="btn btn-primary">Xem Chi
										Tiết</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row text-center mt-4">
					<a href="./product.jsp" class="text-primary fs-5">Xem tất cả</a>
				</div>
			</div>
		</section>
		<section class="collection py-5">
			<div class="container">
				<h2 class="text-center text-secondary mb-4">Mini Collection</h2>
				<div class="row mb-4">
					<div id="carouselExampleCaptions" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleCaptions"
								data-bs-slide-to="0" class="active" aria-current="true"
								aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleCaptions"
								data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleCaptions"
								data-bs-slide-to="2" aria-label="Slide 3"></button>
						</div>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="../img/img-banner-4.jpg" class="d-block w-100"
									alt="Banner 4" />
								<div class="carousel-caption d-none d-md-block">
									<h5 class="text-uppercase text-dark fs-2">Let’s be Chic &
										CHILL</h5>
									<p class="text-dark">Mỗi cô gái đều luôn muốn sống trọn cho
										bản thân mình, được sống đúng tâm hồn, được thoải mái, tự do
										làm những điều mình thích. Hãy thật xinh đẹp, thoải mái là
										chính mình dưới những sắc hè rực rỡ cùng chất liệu mộc mạc của
										“Let’s be Chic & Chill” để bạn có tinh thần thư thái, yêu đời
										và tạo nên dấu ấn cá nhân thật ấn tượng!</p>
								</div>
							</div>
							<div class="carousel-item">
								<img src="../img/img-banner-5.jpg" class="d-block w-100"
									alt="Banner 5" />
								<div class="carousel-caption d-none d-md-block">
									<h5 class="text-uppercase fs-2">Color Me Happy</h5>
									<p>Sau một năm đầy nỗ lực, đây chính là lúc để các cô gái
										tận hưởng những thành quả "rực rỡ, muôn màu" của chính mình.
										Bạn hạnh phúc chính là món quà tuyệt vời nhất cho chính bạn và
										cho cả những người thân yêu. Hãy thật xinh đẹp, rạng ngời với
										COLOR ME HAPPY để đón chào một mùa xuân đầy ngọt ngào, hạnh
										phúc và ngập tràn sức sống!</p>
								</div>
							</div>
							<div class="carousel-item">
								<img src="../img/img-banner-6.jpg" class="d-block w-100"
									alt="Banner 6" />
								<div class="carousel-caption d-none d-md-block">
									<h5 class="text-uppercase fs-2">UP-GREAT COLLECTION</h5>
									<p>Không cần so sánh bản thân với bất cứ ai khác, bạn của
										hiện tại là một phiên bản rất mới mẻ và trên cả tuyệt vời. Một
										“Bạn” rất mạnh mẽ, kiên cường, đầy lạc quan và tinh thần sẵn
										sàng chấp nhận sự thay đổi. Bạn của chính ngày hôm nay khoẻ
										mạnh, xinh đẹp và tự tin làm những điều mình đam mê. Điều đó
										còn trên-cả-tuyệt-vời!</p>
								</div>
							</div>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
				<div class="row justify-content-center">
					<div
						class="col col-lg-3 col-sm-6 mb-4 d-flex justify-content-center">
						<div class="card" style="width: 18rem">
							<img src="../img/img-colletion-1.jpg" class="card-img-top"
								alt="Sản phẩm 1" />
						</div>
					</div>
					<div
						class="col col-lg-3 col-sm-6 mb-4 d-flex justify-content-center">
						<div class="card" style="width: 18rem">
							<img src="../img/img-colletion-2.jpg" class="card-img-top"
								alt="Sản phẩm 1" />
						</div>
					</div>
					<div
						class="col col-lg-3 col-sm-6 mb-4 d-flex justify-content-center">
						<div class="card" style="width: 18rem">
							<img src="../img/img-collection-3.jpg" class="card-img-top"
								alt="Sản phẩm 1" />
						</div>
					</div>
				</div>
				<div class="row text-center mt-4">
					<a href="./news.jsp" class="text-primary fs-5">Xem tất cả</a>
				</div>
			</div>
		</section>
	</main>

	<%@include file="../common/footer.jsp"%>
	<script src="<c:url value="/js/jquery-3.6.3.min.js" />"></script>
	<script src="<c:url value="/js/bootstrap.min.js" />"></script>
</body>
</html>