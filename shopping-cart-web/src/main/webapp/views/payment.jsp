<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
UserModel auth = (UserModel) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
} else {
	response.sendRedirect("sign-in.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet" />
<link href="<c:url value="/css/reset.css" />" rel="stylesheet" />

<title>Payment</title>
</head>
<body>
	<%@include file="../common/header.jsp" %>

	<main class="main" style="background-color: #f5f5f5">
      <div class="container" style="background-color: #f5f5f5">
        <div class="row py-5">
          <div class="bg-light">
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item">
                  <a href="./home.jsp" class="text-dark">TRANG CHỦ</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">THANH TOÁN</li>
              </ol>
            </nav>
          </div>
        </div>
        <div class="row mb-5" style="background-color: white">
          <div class="d-flex align-items-center">
            <img
              class="me-3"
              src="../img/img-icon-payment-3.jpg"
              alt=""
              width="100px"
              height="100px"
            />

            <div class="ms-0 border-start border-2 border-dark pe-3">
              <div class="d-flex flex-column align-items-start">
                <p class="mb-0 ms-3 fs-5">Thanh toán</p>
                <p class="mb-0 ms-3 fs-5">Online</p>
              </div>
            </div>
          </div>
        </div>

        <div class="row p-3 mb-5" style="background-color: white">
          <h2 class="mb-5">
            <span class="border-bottom border-4 border-dark">Địa chỉ nhận hàng</span>
          </h2>
          <form>
            <div class="mb-3">
              <label for="formGroupExampleInput" class="form-label">Họ và tên</label>
              <input
                type="text"
                class="form-control"
                id="formGroupExampleInput"
                placeholder="Hãy nhập họ và tên của bạn"
              />
            </div>
            <div class="mb-3">
              <label for="exampleFormControlInput1" class="form-label">Địa chỉ email</label>
              <input
                type="email"
                class="form-control"
                id="exampleFormControlInput1"
                placeholder="Hãy nhập địa chỉ email của bạn"
              />
            </div>
            <div class="mb-3">
              <label for="formGroupExampleInput2" class="form-label">Số điện thoại</label>
              <input
                type="text"
                class="form-control"
                id="formGroupExampleInput2"
                placeholder="Hãy nhập số điện thoại của bạn"
              />
            </div>
            <div class="mb-3">
              <label for="formGroupExampleInput2" class="form-label">Địa chỉ</label>
              <input
                type="text"
                class="form-control"
                id="formGroupExampleInput2"
                placeholder="Hãy nhập địa chỉ của bạn"
              />
            </div>
            <div class="mb-3">
              <label for="exampleFormControlTextarea1" class="form-label">Nội dung tin nhắn</label>
              <textarea
                class="form-control"
                id="exampleFormControlTextarea1"
                rows="3"
                placeholder="Hãy nhập nội dung tin nhắn của bạn"
              ></textarea>
            </div>
            <div class="mb-3">
              <h6 class="pb-2">Chọn hình thức vận chuyển</h6>
              <div class="form-group mb-3">
                <label class="radio-inline pe-3">
                  <input type="radio" name="optradio" checked />Giao hàng nhanh
                </label>
                <label class="radio-inline">
                  <input type="radio" name="optradio" class="ml-5" />Giao hàng tiết kiệm
                </label>
              </div>
            </div>
            <div class="mb-3">
              <h6 class="pb-2">Mã giảm giá</h6>
              <div class="form-group mb-3">
                <div class="col input-group rounded">
                  <input
                    type="search"
                    class="form-control rounded"
                    id="form-search"
                    placeholder="Hãy nhập mã giảm giá của bạn"
                    aria-label="Search"
                    aria-describedby="search-addon"
                  />
                  <span class="input-group-text border-0 bg-dark" id="search-addon">
                    <a class="nav-link text-white" href="#">Xác nhận</a>
                  </span>
                </div>
              </div>
            </div>
          </form>
        </div>
        <div class="row p-3 mb-5" style="background-color: white">
          <h2 class="mb-5">
            <span class="border-bottom border-4 border-dark">Hình thức thanh toán</span>
          </h2>
          <div class="card">
            <div class="card-header bg-white">
              <div class="py-3">
                <ul role="tablist" class="nav bg-light nav-pills rounded nav-fill">
                  <li class="nav-item">
                    <a
                      data-toggle="pill"
                      href="#credit-card"
                      class="nav-link active d-flex justify-content-center align-items-center card-selected"
                    >
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="16"
                        height="16"
                        fill="currentColor"
                        class="bi bi-credit-card"
                        viewBox="0 0 16 16"
                      >
                        <path
                          d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1H2zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7z"
                        />
                        <path
                          d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1z"
                        />
                      </svg>
                      <span class="mx-3">Thẻ tín dụng</span>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a
                      data-toggle="pill"
                      href="#paypal"
                      class="nav-link d-flex justify-content-center align-items-center card-selected"
                    >
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="16"
                        height="16"
                        fill="currentColor"
                        class="bi bi-paypal"
                        viewBox="0 0 16 16"
                      >
                        <path
                          d="M14.06 3.713c.12-1.071-.093-1.832-.702-2.526C12.628.356 11.312 0 9.626 0H4.734a.7.7 0 0 0-.691.59L2.005 13.509a.42.42 0 0 0 .415.486h2.756l-.202 1.28a.628.628 0 0 0 .62.726H8.14c.429 0 .793-.31.862-.731l.025-.13.48-3.043.03-.164.001-.007a.351.351 0 0 1 .348-.297h.38c1.266 0 2.425-.256 3.345-.91.379-.27.712-.603.993-1.005a4.942 4.942 0 0 0 .88-2.195c.242-1.246.13-2.356-.57-3.154a2.687 2.687 0 0 0-.76-.59l-.094-.061ZM6.543 8.82a.695.695 0 0 1 .321-.079H8.3c2.82 0 5.027-1.144 5.672-4.456l.003-.016c.217.124.4.27.548.438.546.623.679 1.535.45 2.71-.272 1.397-.866 2.307-1.663 2.874-.802.57-1.842.815-3.043.815h-.38a.873.873 0 0 0-.863.734l-.03.164-.48 3.043-.024.13-.001.004a.352.352 0 0 1-.348.296H5.595a.106.106 0 0 1-.105-.123l.208-1.32.845-5.214Z"
                        />
                      </svg>
                      <span class="mx-3">Paypal</span>
                    </a>
                  </li>
                </ul>
              </div>
              <div class="tab-content">
                <div id="credit-card" class="tab-pane fade show active pt-3">
                  <form role="form">
                    <div class="form-group mb-3">
                      <label for="Select Your Bank">
                        <h6>Chọn ngân hàng</h6>
                      </label>
                      <select class="form-control" id="ccmonth">
                        <option value="" selected disabled>--Hãy chọn ngân hàng của bạn--</option>
                        <option>Agribank</option>
                        <option>Vietcombank</option>
                        <option>HD Bank</option>
                        <option>Vietinbank</option>
                        <option>BIDV</option>
                        <option>Saccombank</option>
                      </select>
                    </div>
                    <div class="form-group mb-3">
                      <label for="username">
                        <h6>Tên chủ thẻ</h6>
                      </label>
                      <input
                        type="text"
                        name="username"
                        placeholder="Hãy nhập tên chủ thẻ"
                        class="form-control"
                        required
                      />
                    </div>
                    <div class="form-group mb-3">
                      <label for="cardNumber">
                        <h6>Số thẻ</h6>
                      </label>
                      <div class="input-group">
                        <input
                          type="text"
                          name="cardNumber"
                          placeholder="Hãy nhập số thẻ"
                          class="form-control"
                          required
                        />
                        <div class="input-group-append">
                          <span class="input-group-text text-muted h-100">
                            <svg
                              xmlns="http://www.w3.org/2000/svg"
                              width="16"
                              height="16"
                              fill="currentColor"
                              class="bi bi-credit-card"
                              viewBox="0 0 16 16"
                            >
                              <path
                                d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1H2zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7z"
                              />
                              <path
                                d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1z"
                              />
                            </svg>
                          </span>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="form-group mb-3">
                        <label>
                          <span class="hidden-xs">
                            <h6>Ngày hết hạn</h6>
                          </span>
                        </label>
                        <div class="input-group">
                          <input
                            type="number"
                            placeholder="MM"
                            name=""
                            class="form-control"
                            required
                          />
                          <input
                            type="number"
                            placeholder="YY"
                            name=""
                            class="form-control"
                            required
                          />
                        </div>
                      </div>
                    </div>
                    <div class="row mb-3">
                      <div class="form-group">
                        <button type="button" class="btn btn-primary">Xác nhận thanh toán</button>
                      </div>
                    </div>
                  </form>
                </div>
                <div id="paypal" class="tab-pane fade show pt-3">
                  <h6 class="pb-2">Chọn loại tài khoản Paypal thanh toán</h6>
                  <div class="form-group mb-3">
                    <label class="radio-inline pe-3">
                      <input type="radio" name="optradio" checked />Nội địa
                    </label>
                    <label class="radio-inline">
                      <input type="radio" name="optradio" class="ml-5" />Quốc tế
                    </label>
                  </div>
                  <p>
                    <button type="button" class="btn btn-primary">
                      <i class="fab fa-paypal mr-2"></i>Đăng nhập vào Paypal
                    </button>
                  </p>
                  <p class="text-muted">
                    Lưu ý: Sau khi nhấn vào nút Đăng nhập vào Paypal, bạn sẽ được chuyển đến cổng
                    bảo vệ cho thẻ. Sau khi hoàn thành tiến trình thanh toán, bạn sẽ được chuyển
                    hướng trở về trang chi tiết đơn hàng của bạn.
                  </p>
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
		<script src="<c:url value="/js/payment.js" />"></script>
	
</body>
</html>