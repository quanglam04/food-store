<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title> Sản Phẩm - FoodStore</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">

                    <meta name="_csrf" content="${_csrf.token}" />
                    <!-- default header name is X-CSRF-TOKEN -->
                    <meta name="_csrf_header" content="${_csrf.headerName}" />

                    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
                        rel="stylesheet">

                    <style>
                        .page-link.disabled {
                            color: var(--bs-pagination-disabled-color);
                            pointer-events: none;
                            background-color: var(--bs-pagination-disabled-bg);
                        }
                    </style>

                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->

                    <jsp:include page="../layout/header.jsp" />

                    <!-- Single Product Start -->
                    <div class="container-fluid py-5 mt-5">
                        <div class="container py-5">
                            <div class="row g-4 mb-5">
                                <div>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Danh Sách Sản Phẩm
                                            </li>
                                        </ol>
                                    </nav>
                                </div>

                                <div class="row g-4 fruite">
                                    <div class="col-12 col-md-4">
                                        <div class="row g-4">

                                            <div class="col-12" id="targetFilter">
                                                <div class="mb-2"><b>Mục đích sử dụng</b></div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-1"
                                                        value="giam-can">
                                                    <label class="form-check-label" for="target-1">Giảm cân</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-2"
                                                        value="tang-co">
                                                    <label class="form-check-label" for="target-2">Tăng cơ</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-3"
                                                        value="tang-chieu-cao">
                                                    <label class="form-check-label" for="target-3">Tăng chiều
                                                        cao</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-4"
                                                        value="tang-can">
                                                    <label class="form-check-label" for="target-4">Tăng cân
                                                    </label>
                                                </div>


                                            </div>

                                            <div class="col-12" id="customertargetFilter">
                                                <div class="mb-2"><b>Đối tượng</b></div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox"
                                                        id="customertarget-1" value="tap-the-hinh">
                                                    <label class="form-check-label" for="customertarget-1">Dành cho
                                                        người
                                                        tập
                                                        thể hình</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox"
                                                        id="customertarget-2" value="dan-van-phong">
                                                    <label class="form-check-label" for="customertarget-2">Dành cho dân
                                                        văn
                                                        phòng</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox"
                                                        id="customertarget-3" value="phu-nu-co-thai">
                                                    <label class="form-check-label" for="customertarget-3">Dành cho
                                                        phụ nữ
                                                        có thai</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox"
                                                        id="customertarget-4" value="be-duoi-1-tuoi">
                                                    <label class="form-check-label" for="customertarget-4">Dành cho bé
                                                        dưới
                                                        1 tuổi</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox"
                                                        id="customertarget-5" value="nguoi-an-kieng">
                                                    <label class="form-check-label" for="customertarget-5">Dành cho
                                                        người ăn
                                                        kiêng</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox"
                                                        id="customertarget-6" value="tat-ca">
                                                    <label class="form-check-label" for="customertarget-6">Tất
                                                        cả</label>
                                                </div>



                                            </div>

                                            <div class="col-12" id="typeFilter">
                                                <div class="mb-2"><b>Loại</b></div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="type-1"
                                                        value="rau">
                                                    <label class="form-check-label" for="type-1">Rau</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="type-4"
                                                        value="cu">
                                                    <label class="form-check-label" for="type-4">Củ</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="type-2"
                                                        value="trai-cay">
                                                    <label class="form-check-label" for="type-2">Trái cây</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="type-3"
                                                        value="thuc-pham-giau-protein">
                                                    <label class="form-check-label" for="type-3">Thực phẩm giàu
                                                        protein</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="type-6"
                                                        value="thuc-pham-chua-tinh-bot">
                                                    <label class="form-check-label" for="type-6">Thực phẩm chứa tinh
                                                        bột</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="type-5"
                                                        value="thuc-uong">
                                                    <label class="form-check-label" for="type-5">Thức uống</label>
                                                </div>
                                            </div>


                                            <div class="col-12" id="priceFilter">
                                                <div class="mb-2"><b>Mức giá</b></div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="price-2"
                                                        value="duoi-100-nghin">
                                                    <label class="form-check-label" for="price-2">Dưới 100
                                                        nghìn</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="price-3"
                                                        value="100-150-nghin">
                                                    <label class="form-check-label" for="price-3">Từ 100 - 150
                                                        nghìn</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="price-4"
                                                        value="150-200-nghin">
                                                    <label class="form-check-label" for="price-4">Từ 150 - 200
                                                        nghìn</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="price-5"
                                                        value="tren-200-nghin">
                                                    <label class="form-check-label" for="price-5">Trên 200
                                                        nghìn</label>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="mb-2"><b>Sắp xếp</b></div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="sort-1"
                                                        value="gia-tang-dan" name="radio-sort">
                                                    <label class="form-check-label" for="sort-1">Giá tăng dần</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="sort-2"
                                                        value="gia-giam-dan" name="radio-sort">
                                                    <label class="form-check-label" for="sort-2">Giá giảm dần</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="sort-3" checked
                                                        value="gia-nothing" name="radio-sort">
                                                    <label class="form-check-label" for="sort-3">Không sắp xếp</label>
                                                </div>

                                            </div>
                                            <div class="col-12">
                                                <button
                                                    class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4"
                                                    id="btnFilter">
                                                    Lọc Sản Phẩm
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-8 text-center">
                                        <div class="row g-4">

                                            <c:if test="${totalPages == 0}">
                                                <div>Không tìm thấy sản phẩm</div>

                                            </c:if>
                                            <c:forEach var="product" items="${products}">
                                                <div class="col-md-6 col-lg-4">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="/images/product/${product.image}"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>

                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4 style="font-size: 15px;">
                                                                <a href="/product/${product.id}">
                                                                    ${product.name}
                                                                </a>

                                                            </h4>
                                                            <p style="font-size: 13px;">
                                                                ${product.shortDesc}</p>
                                                            <div
                                                                class="d-flex  flex-lg-wrap justify-content-center flex-column">
                                                                <p style="font-size: 15px; text-align: center; width: 100%;"
                                                                    class="text-dark  fw-bold mb-3">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${product.price}" />
                                                                    đ
                                                                </p>
                                                                <!-- <form action="/add-product-to-cart/${product.id}"
                                                                    method="post"> -->
                                                                <input type="hidden" name="${_csrf.parameterName}"
                                                                    value="${_csrf.token}" />
                                                                <input class="form-control d-none" type="text"
                                                                    name="quantity" id="cartDetails0.quantity"
                                                                    value="1" />

                                                                <button data-product-id="${product.id}"
                                                                    class="btnAddToCartDetail mx-auto btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Thêm vào giỏ hàng
                                                                </button>
                                                                <!-- </form> -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <c:if test="${totalPages>0}">
                                                <div class="pagination d-flex justify-content-center mt-5">
                                                    <li class="page-item">
                                                        <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                            href="/products?page=${currentPage - 1}${queryString}"
                                                            aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                        </a>
                                                    </li>
                                                    <c:forEach begin="1" end="${totalPages }" varStatus="loop">
                                                        <li class="page-item">
                                                            <a class="${(loop.index ) eq currentPage ? 'active page-link' : 'page-link'}"
                                                                href="/products?page=${loop.index}${queryString}">
                                                                ${loop.index }
                                                            </a>
                                                        </li>
                                                    </c:forEach>
                                                    <li class="page-item">
                                                        <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                            href="/products?page=${currentPage + 1}${queryString}"
                                                            aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>

                                                </div>

                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Single Product End -->

                    <jsp:include page="../layout/footer.jsp" />


                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>


                    <!-- Thêm jQuery UI (để hỗ trợ autocomplete) -->

                    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js">
                    </script>
                    <script>
                        var nameProducts = `${nameProducts}`;
                        function autocomplete(inp, arr) {
                            var currentFocus;

                            inp.addEventListener("input", function (e) {
                                var a, b, i, val = this.value;
                                closeAllLists();
                                if (!val) { return false; }
                                currentFocus = -1;

                                a = document.createElement("DIV");
                                a.setAttribute("id", this.id + "autocomplete-list");
                                a.setAttribute("class", "autocomplete-items");
                                this.parentNode.appendChild(a);

                                for (i = 0; i < arr.length; i++) {
                                    if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                                        b = document.createElement("DIV");
                                        b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                                        b.innerHTML += arr[i].substr(val.length);
                                        b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                                        b.addEventListener("click", function (e) {
                                            inp.value = this.getElementsByTagName("input")[0].value;
                                            closeAllLists();
                                        });
                                        a.appendChild(b);
                                    }
                                }
                            });

                            inp.addEventListener("keydown", function (e) {
                                var x = document.getElementById(this.id + "autocomplete-list");
                                if (x) x = x.getElementsByTagName("div");
                                if (e.keyCode == 40) {
                                    currentFocus++;
                                    addActive(x);
                                } else if (e.keyCode == 38) {
                                    currentFocus--;
                                    addActive(x);
                                } else if (e.keyCode == 13) {
                                    e.preventDefault();
                                    if (currentFocus > -1) {
                                        if (x) x[currentFocus].click();
                                    }
                                }
                            });

                            function addActive(x) {
                                if (!x) return false;
                                removeActive(x);
                                if (currentFocus >= x.length) currentFocus = 0;
                                if (currentFocus < 0) currentFocus = (x.length - 1);
                                x[currentFocus].classList.add("autocomplete-active");
                            }

                            function removeActive(x) {
                                for (var i = 0; i < x.length; i++) {
                                    x[i].classList.remove("autocomplete-active");
                                }
                            }

                            function closeAllLists(elmnt) {
                                var x = document.getElementsByClassName("autocomplete-items");
                                for (var i = 0; i < x.length; i++) {
                                    if (elmnt != x[i] && elmnt != inp) {
                                        x[i].parentNode.removeChild(x[i]);
                                    }
                                }
                            }

                            document.addEventListener("click", function (e) {
                                closeAllLists(e.target);
                            });
                        }

                        // Kích hoạt autocomplete khi trang đã tải xong
                        document.addEventListener("DOMContentLoaded", function () {
                            var input = document.getElementById("tags");
                            if (input) {
                                autocomplete(input, nameProducts);
                            }
                        });

                    </script>
                </body>

                </html>