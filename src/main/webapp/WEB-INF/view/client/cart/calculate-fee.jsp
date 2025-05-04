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
      #fee {
        font-family: "Arial", "Helvetica", sans-serif;
        font-weight: 400;
      }

      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
          Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
      }

      .jq-toast-single {
        font-size: 16px !important;
      }

      body {
        background-color: #f5f5f7;
        padding: 20px;
      }

      .shipping-calculator {
        max-width: 800px;
        margin: 20px auto;
      }

      .card {
        background-color: white;
        border-radius: 12px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
        padding: 24px;
        margin-bottom: 20px;
      }

      .card-title {
        display: flex;
        align-items: center;
        font-size: 20px;
        font-weight: 600;
        color: #222;
        margin-bottom: 24px;
      }

      .card-title i {
        color: #00a65a;
        margin-right: 10px;
        font-size: 22px;
      }

      .form-row {
        display: flex;
        flex-wrap: wrap;
        margin-bottom: 20px;
        gap: 20px;
      }

      .form-group {
        flex: 1;
        min-width: 200px;
      }

      .form-label {
        display: flex;
        align-items: center;
        font-size: 14px;
        color: #00a65a;
        margin-bottom: 8px;
      }

      .form-label i {
        margin-right: 6px;
      }

      .form-select,
      .form-input {
        width: 100%;
        padding: 12px 16px;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        font-size: 15px;
        color: #333;
        background-color: white;
        appearance: none;
        -webkit-appearance: none;
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%23999' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M6 9l6 6 6-6'/%3E%3C/svg%3E");
        background-repeat: no-repeat;
        background-position: right 12px center;
      }

      .form-input {
        background-image: none;
      }

      .form-select:focus,
      .form-input:focus {
        outline: none;
        border-color: #00a65a;
        box-shadow: 0 0 0 2px rgba(0, 166, 90, 0.1);
      }

      .btn-container {
        display: flex;
        justify-content: center;
        margin-top: 24px;
      }

      .btn-calculate {
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: #00a65a;
        color: white;
        border: none;
        border-radius: 8px;
        padding: 12px 24px;
        font-size: 16px;
        font-weight: 500;
        cursor: pointer;
        transition: background-color 0.2s;
      }

      .btn-calculate:hover {
        background-color: #008d4c;
      }

      .btn-calculate i {
        margin-right: 8px;
      }

      .result-title {
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 18px;
        font-weight: 600;
        color: #222;
        margin-bottom: 16px;
      }

      .result-title i {
        color: #00a65a;
        margin-right: 8px;
      }

      .result-content {
        text-align: center;
        font-size: 18px;
        color: #999;
      }

      .btn-checkout {
        background-color: #00a65a; /* Màu xanh lá đậm giống nút tính phí vận chuyển */
        color: white;
        font-weight: 600;
        border: none;
        border-radius: 30px;
        padding: 12px 30px;
        font-size: 16px;
        text-transform: uppercase;
        cursor: pointer;
        transition: all 0.3s ease;
        display: block;
        margin: 20px auto;
        box-shadow: 0 4px 8px rgba(0, 166, 90, 0.2);
      }

      .btn-checkout:hover {
        background-color: #008d4c;
        box-shadow: 0 6px 12px rgba(0, 166, 90, 0.3);
        transform: translateY(-2px);
      }

      .result-container {
        background-color: #f8f9fa;
        border-radius: 10px;
        padding: 15px;
        margin-bottom: 20px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
      }

      /* Add Font Awesome for icons */
      @import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css");
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

    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
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
    <div class="container-fluid" style="padding-top: 50px">
      <div class="container" style="padding-top: 50px">
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
    <div class="shipping-calculator">
      <!-- Shipping Calculator Card -->
      <div class="card">
        <h2 class="card-title">
          <i class="fas fa-truck"></i>
          Tính phí vận chuyển
        </h2>

        <div class="form-row">
          <div class="form-group">
            <label class="form-label">
              <i class="fas fa-map-marker-alt"></i>
              Tỉnh/Thành phố
            </label>
            <select id="provinceSelect" name="provinceId" class="form-select">
              <option value="201">Hà Nội</option>
              <option value="202">Hồ Chí Minh</option>
              <option value="203">Đà Nẵng</option>
              <option value="204">Đồng Nai</option>
              <option value="205">Bình Dương</option>
              <option value="206">Bà Rịa - Vũng Tàu</option>
              <option value="207">Gia Lai</option>
              <option value="208">Khánh Hòa</option>
              <option value="209">Lâm Đồng</option>
              <option value="210">Đắk Lắk</option>
              <option value="211">Long An</option>
              <option value="212">Tiền Giang</option>
              <option value="213">Bến Tre</option>
              <option value="214">Trà Vinh</option>
              <option value="215">Vĩnh Long</option>
              <option value="216">Đồng Tháp</option>
              <option value="217">An Giang</option>
              <option value="218">Sóc Trăng</option>
              <option value="219">Kiên Giang</option>
              <option value="220">Cần Thơ</option>
              <option value="221">Vĩnh Phúc</option>
              <option value="223">Thừa Thiên Huế</option>
              <option value="224">Hải Phòng</option>
              <option value="225">Hải Dương</option>
              <option value="226">Thái Bình</option>
              <option value="227">Hà Giang</option>
              <option value="228">Tuyên Quang</option>
              <option value="229">Phú Thọ</option>
              <option value="230">Quảng Ninh</option>
              <option value="231">Nam Định</option>
              <option value="232">Hà Nam</option>
              <option value="233">Ninh Bình</option>
              <option value="234">Thanh Hóa</option>
              <option value="235">Nghệ An</option>
              <option value="236">Hà Tĩnh</option>
              <option value="237">Quảng Bình</option>
              <option value="238">Quảng Trị</option>
              <option value="239">Bình Phước</option>
              <option value="240">Tây Ninh</option>
              <option value="241">Đắk Nông</option>
              <option value="242">Quảng Ngãi</option>
              <option value="243">Quảng Nam</option>
              <option value="244">Thái Nguyên</option>
              <option value="245">Bắc Kạn</option>
              <option value="246">Cao Bằng</option>
              <option value="247">Lạng Sơn</option>
              <option value="248">Bắc Giang</option>
              <option value="249">Bắc Ninh</option>
              <option value="250">Hậu Giang</option>
              <option value="252">Cà Mau</option>
              <option value="253">Bạc Liêu</option>
              <option value="258">Bình Thuận</option>
              <option value="259">Kon Tum</option>
              <option value="260">Phú Yên</option>
              <option value="261">Ninh Thuận</option>
              <option value="262">Bình Định</option>
              <option value="263">Yên Bái</option>
              <option value="264">Lai Châu</option>
              <option value="265">Điện Biên</option>
              <option value="266">Sơn La</option>
              <option value="267">Hòa Bình</option>
              <option value="268">Hưng yên</option>
              <option value="269">Lào Cai</option>
            </select>
          </div>

          <div class="form-group">
            <label class="form-label">
              <i class="fas fa-map"></i>
              Quận/Huyện
            </label>
            <select id="districtSelect" name="districtId" class="form-select">
              <option value="">Chọn quận/huyện</option>
            </select>
          </div>

          <div class="form-group">
            <label class="form-label">
              <i class="fas fa-map-pin"></i>
              Phường/Xã
            </label>
            <select id="wardSelect" name="wardCode" class="form-select">
              <option value="">Chọn phường/xã</option>
            </select>
          </div>
        </div>

        <div class="form-group">
          <label class="form-label">
            <i class="fas fa-home"></i>
            Địa chỉ chi tiết
          </label>
          <input
            id="address"
            type="text"
            placeholder="Nhập số nhà, tên đường..."
            class="form-input"
          />
        </div>

        <div class="btn-container">
          <button type="button" id="calculateFee" class="btn-calculate">
            <i class="fas fa-calculator"></i>
            Tính phí vận chuyển
          </button>
        </div>
      </div>

      <!-- Result Card -->
      <form:form action="/checkout" method="get">
        <input
          type="hidden"
          name="${_csrf.parameterName}"
          value="${_csrf.token}"
        />
        <div class="card">
          <h3 class="result-title">
            <i class="fas fa-truck"></i>
            Kết quả tính phí vận chuyển
          </h3>
          <div class="result-content" id="fee">Chưa có thông tin</div>
          <input type="hidden" name="cost" id="costDelivery" />
          <input type="hidden" name="detailAddress" id="detailAddress" />
        </div>

        <button id="btnCheckout" class="btn-checkout">Thanh toán</button>
      </form:form>
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
        console.log("ProvinceID: " + provinceSelect.value);
        // Thêm event listener cho sự kiện thay đổi tỉnh/thành phố
        provinceSelect.addEventListener("change", function () {
          console.log("ProvinceID: " + provinceSelect.value);
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
    // ---------------Xử lý Logic tính toán chi phí vận chuyển-------------------------------

    // Hàm tính phí vận chuyển qua API GHN
    function calculateShippingFee() {
      // Lấy thông tin quận/huyện và phường/xã đã chọn
      const toProvinceId = document.getElementById("provinceSelect").value;
      const toDistrictId = document.getElementById("districtSelect").value;
      const toWardCode = document.getElementById("wardSelect").value;
      console.log(toProvinceId, toDistrictId, toWardCode);
      const address = document.getElementById("address").value;

      const toProvinceId2 = document.getElementById("provinceSelect");
      const provinceText =
        toProvinceId2.options[toProvinceId2.selectedIndex].text;

      const toDistrictId2 = document.getElementById("districtSelect");
      const districtText =
        toDistrictId2.options[toDistrictId2.selectedIndex].text;

      const toWardCode2 = document.getElementById("wardSelect");
      const wardText = toWardCode2.options[toWardCode2.selectedIndex].text;

      document.getElementById("detailAddress").value =
        address + ", " + wardText + ", " + districtText + ", " + provinceText;
      console.log(address);
      console.log("DistrictID: " + toDistrictId, "WardCode:" + toWardCode);
      // Kiểm tra đã chọn đủ thông tin chưa
      if (!toDistrictId || !toWardCode || !address) {
        alert("Vui lòng chọn đầy đủ Quận/Huyện, Phường/Xã và địa chỉ");
        return;
      }

      // Hiển thị trạng thái đang tính toán
      const feeElement = document.getElementById("fee");
      feeElement.textContent = "Chi phí vận chuyển: Đang tính...";

      // Cấu hình request
      const url =
        "https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee";
      const token = "ed67dc49-2835-11f0-8c8d-faf19a0e6e5b";
      const shopId = "5759905";

      // Dữ liệu gửi đi
      const requestData = {
        from_district_id: 1542,
        from_ward_code: "1B1507",
        service_id: 53321,
        service_type_id: null,
        to_district_id: parseInt(toDistrictId),
        to_ward_code: toWardCode,
        height: 50,
        length: 20,
        weight: 200,
        width: 20,
        insurance_value: 10000,
        cod_failed_amount: 2000,
        coupon: null,
      };

      // Gửi request đến API
      fetch(url, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Token: token,
          ShopId: shopId,
        },
        body: JSON.stringify(requestData),
      })
        .then((response) => {
          if (!response.ok) {
            throw new Error("Network response was not ok");
          }
          return response.json();
        })
        .then((data) => {
          if (data.code === 200 && data.data) {
            // Format số tiền sang định dạng VND
            document.getElementById("costDelivery").value =
              data.data.total || 0;
            const formattedFee = FormatCurrency(data.data.total);

            // Hiển thị phí vận chuyển

            feeElement.textContent =
              "Chi phí vận chuyển: " + formattedFee + " đồng";

            // Lưu thông tin phí vận chuyển nếu cần
            localStorage.setItem("shippingFee", data.data.total);
          } else {
            console.error(
              "Error calculating fee:",
              data.message || "Unknown error"
            );
            feeElement.textContent = "Chi phí vận chuyển: Không thể tính toán";
          }
        })
        .catch((error) => {
          console.error("Error fetching shipping fee:", error);
          feeElement.textContent = "Chi phí vận chuyển: Có lỗi xảy ra";
        });
    }

    const FormatCurrency = (currency) => {
      if (isNaN(currency)) return "";
      return currency.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    };

    // Thêm event listener cho nút tính toán chi phí
    document.addEventListener("DOMContentLoaded", function () {
      const calculateButton = document.getElementById("calculateFee");

      if (calculateButton) {
        calculateButton.addEventListener("click", calculateShippingFee);
      }
    });

    document
      .getElementById("btnCheckout")
      .addEventListener("click", function (event) {
        const toDistrictIdValidate =
          document.getElementById("districtSelect").value;
        const toWardCodeValidate = document.getElementById("wardSelect").value;
        const addressValidate = document.getElementById("address").value;
        if (!toDistrictIdValidate || !toWardCodeValidate || !addressValidate) {
          console.log(
            toDistrictIdValidate,
            toWardCodeValidate,
            addressValidate
          );
          $.toast({
            text: "Vui lòng điền đầy đủ thông tin trước khi thanh toán!",
            heading: "Thông báo",
            icon: "info",
            showHideTransition: "fade",
            allowToastClose: true,
            hideAfter: 3000,
            stack: 2,
            position: "bottom-left",
            textAlign: "left",
            loader: true,
            loaderBg: "#9EC600",
          });
          event.preventDefault();
        }
      });
  </script>
  <script
    src="https://kit.fontawesome.com/a076d05399.js"
    crossorigin="anonymous"
  ></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
</html>
