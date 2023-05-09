<%@page import="com.shoppingcart.model.CommentModel"%>
<%@page import="com.shoppingcart.dao.CommentDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.shoppingcart.model.ProductModel"%>
<%@page import="com.shoppingcart.connection.ConnectDB"%>
<%@page import="com.shoppingcart.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% 
UserModel auth = (UserModel) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
} 
%>

<% int productId = Integer.parseInt(request.getParameter("id"));
	request.setAttribute("id", productId);
	
	ProductDao pd = new ProductDao(ConnectDB.getConnection());
	ProductModel product = pd.getProductById(productId);
	
	DecimalFormat formatter = new DecimalFormat("###,###,###");
	
	CommentDao cd = new CommentDao(ConnectDB.getConnection());
	ArrayList<CommentModel> commentList = cd.getCommentByProductId(productId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet" />
<link href="<c:url value="/css/reset.css" />" rel="stylesheet" />

<title>Product Detail</title>
</head>
<body>
	<%@include file="../common/header.jsp"%>

	<main class="main">
		<section class="content__top">
			<div class="container">
				<div class="row py-5">
					<div class="bg-light">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="../html/trangchu.html"
									class="text-dark">TRANG CHỦ</a></li>
								<li class="breadcrumb-item active" aria-current="page">CHI
									TIẾT SẢN PHẨM</li>
							</ol>
						</nav>
					</div>
				</div>
				<div class="row">
					<div class="col col-lg-5 col-sm-12 col-12">
						<div>
							<img src="<%= product.getImgUrl() %>"
								class="img-fluid mb-3 mx-auto img-primary" alt="Áo <%= product.getProductId() %>" />
						</div>
					</div>
					<div class="col col-lg-7 col-sm-12 col-12">
						<h2 class="mb-3 product__name"><%= product.getProductName() %></h2>
						
						<form action="add-to-cart" method="get" >
							<h5 class="text-secondary mb-3">Mã: <input type="text" class="px-2 bg-secondary" name="id" value="<%= product.getProductId() %>" readonly style="width: 50px;" /></h5>
							<h3 class="mb-3"><%= formatter.format((int) product.getPrice()) + " VND" %></h3>	
							<p>
							Kích thước: <select class="custom-select px-3 py-1 mb-3" name="size" >
								<option value="S" selected>S</option>
								<option value="M">M</option>
								<option value="L">L</option>
							</select>
						</p>
						<p>
							Số lượng: <select class="custom-select px-3 py-1 mb-5 ms-3" name="qty" >
								<option value="1" selected>1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
							</select>
						</p>
						<div>
							<a href="./payment.jsp" class="btn btn-dark btn-lg">MUA
								NGAY</a> 
							<button type="submit" class="btn btn-outline-dark btn-lg">THÊM VÀO GIỎ</button>
						</div>
						</form>
					</div>
				</div>
				<div class="row py-3">
					<h3 class="text-decoration-underline mb-3">Thông tin sản phẩm</h3>
					<p>Miêu tả: <%= product.getProductName() %></p>
					<p>Đặc tính: Trẻ trung - Năng động.</p>
					<p>Thể loại: Trang phục dạo phố, thường ngày.</p>
					<p>Size: S/M/L.</p>
					<p>Chất liệu: Thun cotton.</p>
					<p>Màu sắc: Trắng/Đen.</p>
					<p>Lưu ý: Không ngâm, tẩy. Giặt nhẹ. Ủi mặt trái áo với nhiệt
						độ thấp.</p>
					<p>Số đo mẫu nữ: Chiều cao: 168 cm. Số đo 3 vòng: 83 - 59 - 86
						(Mặc size S).</p>
				</div>
				
				<div class="row py-3" >
					<h3 class="text-decoration-underline mb-3">Hướng dẫn mua hàng</h3>
					<h5 class="fw-bold mt-4">1. Giới thiệu</h5>
		            <p>Chào mừng quý khách hàng đến với website chúng tôi.</p>
		            <p>
		              Khi quý khách hàng truy cập vào trang website của chúng tôi có nghĩa là quý khách đồng
		              ý với các điều khoản này. Trang web có quyền thay đổi, chỉnh sửa, thêm hoặc lược bỏ
		              bất kỳ phần nào trong Điều khoản mua bán hàng hóa này, vào bất cứ lúc nào. Các thay
		              đổi có hiệu lực ngay khi được đăng trên trang web mà không cần thông báo trước. Và khi
		              quý khách tiếp tục sử dụng trang web, sau khi các thay đổi về Điều khoản này được đăng
		              tải, có nghĩa là quý khách chấp nhận với những thay đổi đó.
		            </p>
		            <p>
		              Quý khách hàng vui lòng kiểm tra thường xuyên để cập nhật những thay đổi của chúng
		              tôi.
		            </p>
		
		            <h5 class="fw-bold mt-4">2. Hướng dẫn sử dụng website</h5>
		            <p>
		              Khi vào web của chúng tôi, khách hàng phải đảm bảo đủ 18 tuổi, hoặc truy cập dưới sự
		              giám sát của cha mẹ hay người giám hộ hợp pháp. Khách hàng đảm bảo có đầy đủ hành vi
		              dân sự để thực hiện các giao dịch mua bán hàng hóa theo quy định hiện hành của pháp
		              luật Việt Nam.
		            </p>
		            <p>
		              Trong suốt quá trình đăng ký, quý khách đồng ý nhận email quảng cáo từ website. Nếu
		              không muốn tiếp tục nhận mail, quý khách có thể từ chối bằng cách nhấp vào đường link
		              ở dưới cùng trong mọi email quảng cáo.
		            </p>
		
		            <h5 class="fw-bold mt-4">3. Thanh toán an toàn và tiện lợi</h5>
		            <p>
		              Người mua có thể tham khảo các phương thức thanh toán sau đây và lựa chọn áp dụng
		              phương thức phù hợp:
		            </p>
		            <p>
		              <span class="fst-italic">Cách 1:</span> Thanh toán trực tiếp (người mua nhận hàng tại
		              địa chỉ người bán)
		            </p>
		            <p>
		              <span class="fst-italic">Cách 2:</span> Thanh toán sau (COD - giao hàng và thu tiền
		              tận nơi)
		            </p>
		            <p>
		              <span class="fst-italic">Cách 3:</span> Thanh toán online qua thẻ tín dụng, chuyển
		              khoản
		            </p>
				</div>
				
				<div class="row py-3">
					<h3 class="text-decoration-underline mb-3">Chính sách đổi trả</h3>
					<h5 class="fw-bold mt-4">1. Điều kiện đổi trả</h5>
		            <p>
		              Quý Khách hàng cần kiểm tra tình trạng hàng hóa và có thể đổi hàng/ trả lại hàng ngay
		              tại thời điểm giao/nhận hàng trong những trường hợp sau:
		            </p>
		            <p>
		              Hàng không đúng chủng loại, mẫu mã trong đơn hàng đã đặt hoặc như trên website tại
		              thời điểm đặt hàng. Không đủ số lượng, không đủ bộ như trong đơn hàng. Tình trạng bên
		              ngoài bị ảnh hưởng như rách bao bì, bong tróc, bể vỡ…
		            </p>
		            <p>
		              Khách hàng có trách nhiệm trình giấy tờ liên quan chứng minh sự thiếu sót trên để hoàn
		              thành việc hoàn trả/đổi trả hàng hóa.
		            </p>
		
		            <h5 class="fw-bold mt-4">2. Quy định về thời gian thông báo và gửi sản phẩm đổi trả</h5>
		            <p>
		              <span class="fst-italic">Thời gian thông báo đổi trả:</span> trong vòng 48h kể từ khi
		              nhận sản phẩm đối với trường hợp sản phẩm thiếu phụ kiện, quà tặng hoặc bể vỡ.
		            </p>
		            <p>
		              <span class="fst-italic">Thời gian gửi chuyển trả sản phẩm:</span> trong vòng 14 ngày
		              kể từ khi nhận sản phẩm.
		            </p>
		            <p>
		              <span class="fst-italic">Địa điểm đổi trả sản phẩm:</span> Khách hàng có thể mang hàng
		              trực tiếp đến văn phòng/ cửa hàng của chúng tôi hoặc chuyển qua đường bưu điện.
		            </p>
		            <p>
		              Trong trường hợp Quý Khách hàng có ý kiến đóng góp/khiếu nại liên quan đến chất lượng
		              sản phẩm, Quý Khách hàng vui lòng liên hệ đường dây chăm sóc khách hàng của chúng tôi.
		            </p>
				</div>
				
				<div class="row py-3">
					<h3 class="text-decoration-underline mb-4">Bình luận</h3>
					<% if(commentList != null && commentList.size() > 0) { 
						for(CommentModel cm: commentList) {
					%>
						<div class="card-body border rounded mb-4">
			          	<div class="d-flex flex-start align-items-center">
			            <img
			              class="rounded-circle shadow-1-strong me-3"
			              src="../img/img-avatar-4.png"
			              alt="avatar"
			              width="60"
			              height="60"
			            />
			            <div>
			              <h6 class="fw-bold text-primary mb-1"><%= cm.getUserName() %></h6>
			              <p class="text-muted small mb-0">Đã đăng tải - <%= cm.getPostDate() %></p>
			            </div>
			          </div>
			
			          <p class="mt-3 mb-4 pb-2">
			            <%= cm.getCommentText() %>
			          </p>
			
			          <div class="small d-flex justify-content-start">
			            <a href="#" class="d-flex align-items-center me-3">
			              <svg
			                xmlns="http://www.w3.org/2000/svg"
			                width="16"
			                height="16"
			                fill="currentColor"
			                class="bi bi-hand-thumbs-up"
			                viewBox="0 0 16 16"
			              >
			                <path
			                  d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"
			                />
			              </svg>
			              <p class="mb-0 ms-2">Thích</p>
			            </a>
			            <a href="#" class="d-flex align-items-center me-3">
			              <svg
			                xmlns="http://www.w3.org/2000/svg"
			                width="16"
			                height="16"
			                fill="currentColor"
			                class="bi bi-chat-dots"
			                viewBox="0 0 16 16"
			              >
			                <path
			                  d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"
			                />
			                <path
			                  d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"
			                />
			              </svg>
			              <p class="mb-0 ms-2">Bình luận</p>
			            </a>
			            <a href="#" class="d-flex align-items-center me-3">
			              <svg
			                xmlns="http://www.w3.org/2000/svg"
			                width="16"
			                height="16"
			                fill="currentColor"
			                class="bi bi-share"
			                viewBox="0 0 16 16"
			              >
			                <path
			                  d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z"
			                />
			              </svg>
			              <p class="mb-0 ms-2">Chia sẻ</p>
			            </a>
			          </div>
			        </div>
					<% 
						}
					} else {
					%>		
						<p class="text-center fst-italic" >Hiện chưa có bình luận nào.</p>
					
					<% } %>
					<div class='card'>
				        <div class="card-footer py-3 border-0" style="background-color: #f8f9fa">
				            <form action="post-to-comment?id=${ id }" method="post">
				            	<div class="d-flex flex-start w-100">
					              <img
					                class="rounded-circle shadow-1-strong me-3"
					                src="../img/img-avatar-4.png"
					                alt="avatar"
					                width="40"
					                height="40"
					              />
					              <div class="form-outline w-100">
					                <label class="form-label" for="textAreaExample">Bình luận</label>
					                <textarea
					                  class="form-control"
					                  id="textAreaExample"
					                  name="text"
					                  rows="4"
					                  style="background: #fff"
					                  placeholder="Hãy để lại bình luận ở đây!"
					                  required
					                ></textarea>
					              </div>
					            </div>
					            <div class="float-end mt-2 pt-1">
					              <input type="submit" class="btn btn-primary btn-sm" value="Đăng tải" />
					              <input type="reset" class="btn btn-outline-primary btn-sm" value="Hủy bỏ" />
					            </div>
				            </form>
				        </div>
				    </div>
				</div>
			</div>
		</section>
	</main>

	<%@include file="../common/footer.jsp"%>
	<script src="<c:url value="/js/jquery-3.6.3.min.js" />"></script>
	<script src="<c:url value="/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/js/product-detail.js" />"></script>
</body>
</html>