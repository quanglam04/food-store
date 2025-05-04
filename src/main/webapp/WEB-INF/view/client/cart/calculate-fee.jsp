<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Thanh toán - Foodstore</title>
    <style>
      img {
        width: 180px;
        position: relative;
        margin-top: -14px;
      }
    </style>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="keywords" />
    <meta content="" name="description" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
      rel="stylesheet"
    />

    <!-- Icon Font Stylesheet -->
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />

    <!-- Libraries Stylesheet -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet" />
    <link
      href="/client/lib/owlcarousel/assets/owl.carousel.min.css"
      rel="stylesheet"
    />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Template Stylesheet -->
    <link href="/client/css/style.css" rel="stylesheet" />
  </head>

  <body>
    <!-- Spinner Start -->
    <div
      id="spinner"
      class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center"
    >
      <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    <jsp:include page="../layout/header.jsp" />

    <!-- Cart Page Start -->
    <div class="container-fluid py-5">
      <div class="container py-5">
        <div class="mb-3">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb" style="padding-top: 10px">
              <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
              <li class="breadcrumb-item active" aria-current="page">
                Thanh toán
              </li>
            </ol>
          </nav>
        </div>
      </div>
    </div>
    <div
      style="
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        width: 500px;
        margin: auto;
        height: 210px;
      "
    >
      <div>
        <p>Tỉnh/Thành phố</p>
        <select name="provinceId">
          <option value="269">Lào Cai</option>
          <option value="268">Hưng yên</option>
          <option value="267">Hòa Bình</option>
          <option value="266">Sơn La</option>
          <option value="265">Điện Biên</option>
          <option value="264">Lai Châu</option>
          <option value="263">Yên Bái</option>
          <option value="262">Bình Định</option>
          <option value="261">Ninh Thuận</option>
          <option value="260">Phú Yên</option>
          <option value="259">Kon Tum</option>
          <option value="258">Bình Thuận</option>
          <option value="253">Bạc Liêu</option>
          <option value="252">Cà Mau</option>
          <option value="250">Hậu Giang</option>
          <option value="249">Bắc Ninh</option>
          <option value="248">Bắc Giang</option>
          <option value="247">Lạng Sơn</option>
          <option value="246">Cao Bằng</option>
          <option value="245">Bắc Kạn</option>
          <option value="244">Thái Nguyên</option>
          <option value="243">Quảng Nam</option>
          <option value="242">Quảng Ngãi</option>
          <option value="241">Đắk Nông</option>

          <option value="240">Tây Ninh</option>
          <option value="239">Bình Phước</option>
          <option value="238">Quảng Trị</option>
          <option value="237">Quảng Bình</option>
          <option value="236">Hà Tĩnh</option>
          <option value="235">Nghệ An</option>
          <option value="234">Thanh Hóa</option>
          <option value="233">Ninh Bình</option>
          <option value="232">Hà Nam</option>
          <option value="231">Nam Định</option>
          <option value="230">Quảng Ninh</option>
          <option value="229">Phú Thọ</option>
          <option value="228">Tuyên Quang</option>
          <option value="227">Hà Giang</option>
          <option value="226">Thái Bình</option>
          <option value="225">Hải Dương</option>
          <option value="224">Hải Phòng</option>
          <option value="223">Thừa Thiên Huế</option>
          <option value="221">Vĩnh Phúc</option>
          <option value="220">Cần Thơ</option>
          <option value="219">Kiên Giang</option>
          <option value="218">Sóc Trăng</option>
          <option value="217">An Giang</option>
          <option value="216">Đồng Tháp</option>
          <option value="215">Vĩnh Long</option>
          <option value="214">Trà Vinh</option>
          <option value="213">Bến Tre</option>
          <option value="212">Tiền Giang</option>

          <option value="211">Long An</option>
          <option value="210">Đắk Lắk</option>
          <option value="209">Lâm Đồng</option>
          <option value="208">Khánh Hòa</option>
          <option value="207">Gia Lai</option>
          <option value="206">Bà Rịa - Vũng Tàu</option>
          <option value="205">Bình Dương</option>
          <option value="204">Đồng Nai</option>
          <option value="203">Đà Nẵng</option>
          <option value="202">Hồ Chí Minh</option>
          <option value="201">Hà Nội</option>
        </select>
      </div>
      <div>
        <p>Quận/Huyện</p>
        <select id="districtSelect" name="districtId"></select>
      </div>
      <div>
        <p>Phường xã</p>
        <select id="wardSelect" name="wardCode"></select>
      </div>
    </div>
    <jsp:include page="../layout/footer.jsp" />
    <jsp:include page="../layout/chat-bot.jsp" />

    <a
      href="#"
      class="btn btn-primary border-3 border-primary rounded-circle back-to-top"
      ><i class="fa fa-arrow-up"></i
    ></a>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/client/lib/easing/easing.min.js"></script>
    <script src="/client/lib/waypoints/waypoints.min.js"></script>
    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

    <script src="/client/js/main.js"></script>
  </body>

  <script>
    // --------------------Xử lý logic đoạn lấy thông tin quận huyện từ ProvinceID -------------------
    // Hàm gọi API để lấy danh sách quận/huyện dựa trên provinceID
    function getDistricts(provinceId) {
      // Kiểm tra nếu không có provinceId
      if (!provinceId) {
        console.error("Province ID is required");
        return;
      }
      // Cấu hình request
      const url =
        "https://online-gateway.ghn.vn/shiip/public-api/master-data/district";
      const token = "ed67dc49-2835-11f0-8c8d-faf19a0e6e5b";
      // Sử dụng fetch API để gửi request
      fetch(url, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Token: token,
        },
        body: JSON.stringify({
          province_id: parseInt(provinceId),
        }),
      })
        .then((response) => {
          if (!response.ok) {
            throw new Error("Network response was not ok");
          }
          return response.json();
        })
        .then((data) => {
          if (data.code === 200 && data.data) {
            // Cập nhật danh sách quận/huyện vào dropdown
            updateDistrictDropdown(data.data);
          } else {
            console.error(
              "Error getting districts:",
              data.message || "Unknown error"
            );
          }
        })
        .catch((error) => {
          console.error("Error fetching districts:", error);
        });
    }
    // Hàm cập nhật danh sách quận/huyện vào dropdown
    function updateDistrictDropdown(districts) {
      const districtSelect = document.getElementById("districtSelect");
      // Xóa tất cả options hiện tại
      districtSelect.innerHTML = "";
      // Thêm option mặc định
      const defaultOption = document.createElement("option");
      defaultOption.value = "";
      defaultOption.textContent = "Chọn quận/huyện";
      districtSelect.appendChild(defaultOption);
      // Thêm các options mới từ API
      districts.forEach((district) => {
        if (district.DistrictName.includes("Thành phố")) {
          return;
        }
        const option = document.createElement("option");
        option.value = district.DistrictID;
        option.textContent = district.DistrictName;
        districtSelect.appendChild(option);
      });
    }
    // Thêm event listener cho dropdown tỉnh/thành phố
    document.addEventListener("DOMContentLoaded", function () {
      const provinceSelect = document.querySelector(
        'select[name="provinceId"]'
      );
      if (provinceSelect) {
        // Lấy danh sách quận/huyện khi trang được tải với giá trị provinceId ban đầu
        getDistricts(provinceSelect.value);
        // Thêm event listener cho sự kiện thay đổi tỉnh/thành phố
        provinceSelect.addEventListener("change", function () {
          getDistricts(this.value);
        });
      }
    });
    // ---------------Xử lý Logic lấy thông tin phường xã từ Quận huyện-------------------------------
    // Hàm gọi API để lấy danh sách phường/xã dựa trên districtID
    function getWards(districtId) {
      // Kiểm tra nếu không có districtId
      if (!districtId) {
        console.error("District ID is required");
        return;
      }

      // Cấu hình request
      const url =
        "https://online-gateway.ghn.vn/shiip/public-api/master-data/ward";
      const token = "ed67dc49-2835-11f0-8c8d-faf19a0e6e5b";

      // Hiển thị trạng thái loading nếu cần
      const wardSelect = document.getElementById("wardSelect");
      wardSelect.innerHTML = '<option value="">Đang tải...</option>';

      // Sử dụng fetch API để gửi request
      fetch(url, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Token: token,
        },
        body: JSON.stringify({
          district_id: parseInt(districtId),
        }),
      })
        .then((response) => {
          if (!response.ok) {
            throw new Error("Network response was not ok");
          }
          return response.json();
        })
        .then((data) => {
          if (data.code === 200 && data.data) {
            // Cập nhật danh sách phường/xã vào dropdown
            updateWardDropdown(data.data);
          } else {
            console.error(
              "Error getting wards:",
              data.message || "Unknown error"
            );
            wardSelect.innerHTML =
              '<option value="">Không thể tải phường/xã</option>';
          }
        })
        .catch((error) => {
          console.error("Error fetching wards:", error);
          wardSelect.innerHTML =
            '<option value="">Không thể tải phường/xã</option>';
        });
    }

    // Hàm cập nhật danh sách phường/xã vào dropdown
    function updateWardDropdown(wards) {
      const wardSelect = document.getElementById("wardSelect");

      // Xóa tất cả options hiện tại
      wardSelect.innerHTML = "";

      // Thêm option mặc định
      const defaultOption = document.createElement("option");
      defaultOption.value = "";
      defaultOption.textContent = "Chọn phường/xã";
      wardSelect.appendChild(defaultOption);

      // Thêm các options mới từ API
      wards.forEach((ward) => {
        // Bỏ qua các ward có tên đặc biệt nếu cần
        if (ward.WardName.includes("Thị trấn")) {
          return; // Skip this iteration
        }

        const option = document.createElement("option");
        option.value = ward.WardCode; // Sử dụng WardCode thay vì WardID
        option.textContent = ward.WardName;
        wardSelect.appendChild(option);
      });
    }

    // Thêm event listener cho dropdown quận/huyện
    document.addEventListener("DOMContentLoaded", function () {
      const districtSelect = document.getElementById("districtSelect");

      if (districtSelect) {
        // Thêm event listener cho sự kiện thay đổi quận/huyện
        districtSelect.addEventListener("change", function () {
          if (this.value) {
            getWards(this.value);
          } else {
            // Reset danh sách phường xã khi không có quận/huyện được chọn
            const wardSelect = document.getElementById("wardSelect");
            wardSelect.innerHTML = '<option value="">Chọn phường/xã</option>';
          }
        });
      }
    });
  </script>
</html>
