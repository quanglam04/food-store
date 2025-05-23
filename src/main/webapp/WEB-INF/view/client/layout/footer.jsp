<!-- Footer Start -->
<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>

<div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
  <div class="container py-5">
    <div
      class="pb-4 mb-4"
      style="border-bottom: 1px solid rgba(226, 175, 24, 0.5)"
    >
      <div class="row g-4">
        <div class="col-lg-3">
          <a href="#">
            <h1 class="text-primary mb-0">FoodStore</h1>
            <p class="text-secondary mb-0">Thực phẩm tươi</p>
          </a>
        </div>
        <div class="col-lg-6">
          <div class="position-relative mx-auto">
            <input
              class="form-control border-0 w-100 py-3 px-4 rounded-pill"
              type="number"
              placeholder="Email của bạn"
            />
            <button
              type="submit"
              class="btn btn-primary border-0 border-secondary py-3 px-4 position-absolute rounded-pill text-white"
              style="top: 0; right: 0"
            >
              Đăng ký ngay
            </button>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="d-flex justify-content-end pt-3">
            <a
              target="_blank"
              class="btn btn-outline-secondary me-2 btn-md-square rounded-circle"
              href=""
              ><i class="fab fa-twitter"></i
            ></a>
            <a
              target="_blank"
              class="btn btn-outline-secondary me-2 btn-md-square rounded-circle"
              href="https://www.facebook.com/profile.php?id=100041721947314&locale=vi_VN"
              ><i class="fab fa-facebook-f"></i
            ></a>
            <a
              target="_blank"
              class="btn btn-outline-secondary me-2 btn-md-square rounded-circle"
              href=""
              ><i class="fab fa-youtube"></i
            ></a>
            <a
              target="_blank"
              class="btn btn-outline-secondary btn-md-square rounded-circle"
              href=""
              ><i class="fab fa-linkedin-in"></i
            ></a>
          </div>
        </div>
      </div>
    </div>

    <div class="row g-5">
      <div class="col-lg-4 col-md-6">
        <div class="d-flex flex-column text-start footer-item">
          <h4 class="text-light mb-3">Thông tin cửa hàng</h4>
          <a class="btn-link" href="#">Về chúng tôi</a>
          <a class="btn-link" href="#">Liên hệ với chúng tôi</a>
          <a class="btn-link" href="#">Chính sách bảo mật</a>
          <a class="btn-link" href="#">Chính sách hoàn trả</a>
          <a class="btn-link" href="#">Câu hỏi thường gặp và trợ giúp</a>
        </div>
      </div>
      <div class="col-lg-4 col-md-6">
        <div class="d-flex flex-column text-start footer-item">
          <h4 class="text-light mb-3">Tài khoản</h4>
          <a class="btn-link" href="/view-profile">Tài khoản của tôi</a>
          <a class="btn-link" href="/">Thông tin chi tiết cửa hàng</a>
          <a class="btn-link" href="/cart">Giỏ hàng</a>
          <a class="btn-link" href="/order-history">Lịch sử mua hàng</a>
          <a class="btn-link" href="#">Đơn đặt hàng quốc tế</a>
        </div>
      </div>
      <div class="col-lg-4 col-md-6">
        <div class="footer-item">
          <h4 class="text-light mb-3">Thông tin liên hệ</h4>
          <p>Địa chỉ: Km10, Đường Nguyễn Trãi, Q. Hà Đông, Hà Nội</p>
          <p>Email: trinhquanglam2k4@gmail.com</p>
          <p>Số điện thoại: 024 3756 2186</p>
          <p>Hình thức thanh toán</p>
          <img src="/client/img/payment.png" class="img-fluid" alt="" />
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Footer End -->
