<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <html lang="en">

            </html>

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Food Store</title>

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
                    .jq-toast-single {
                            font-size: 16px !important;  
                        }
                    .hidden {
                        display: none;
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


                <!-- Modal Search Start -->
                <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-fullscreen">
                        <div class="modal-content rounded-0">
                            <div class="modal-header">
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="  d-flex align-items-center">
                                <div class="input-group w-75 mx-auto d-flex">
                                    <input type="search" class="form-control p-3" placeholder="Từ khóa"
                                        aria-describedby="search-icon-1">
                                    <span id="search-icon-1" class="input-group-text p-3"><i
                                            class="fa fa-search"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Search End -->


                <jsp:include page="../layout/banner.jsp" />

                <jsp:include page="../layout/feature.jsp" />


                <!-- Fruits Shop Start-->
                <div class="container-fluid fruite py-5">
                    <div class="container py-5">
                        <div class="tab-class text-center">
                            <div class="row g-4">
                                <div class="col-lg-4 text-start">
                                    <h1>Sản phẩm hiện có</h1>
                                </div>
                                <div class="col-lg-8 text-end">
                                    <ul class="nav nav-pills d-inline-flex text-center mb-5"
                                        style="display: flex; flex-wrap: nowrap; justify-content: space-between;">
                                        <li class="nav-item">
                                            <a class="d-flex m-2 py-2 bg-light rounded-pill active"
                                                data-bs-toggle="pill" href="#tab-1">
                                                <span class="text-dark" style="width: 130px;"> Tất cả </span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="d-flex py-2 m-2 bg-light rounded-pill" data-bs-toggle="pill"
                                                href="#tab-2">
                                                <span class="text-dark" style="width: 130px;"> Rau củ </span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill"
                                                href="#tab-3">
                                                <span class="text-dark" style="width: 130px;"> Trái cây </span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill"
                                                href="#tab-4">
                                                <span class="text-dark" style="width: 130px;"> Giàu Protein </span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill"
                                                href="#tab-6">
                                                <span class="text-dark" style="width: 130px;"> Chứa tinh bột </span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill"
                                                href="#tab-5">
                                                <span class="text-dark" style="width: 130px;"> Thức uống </span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane fade show p-0  active">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="row g-4">
                                                <!-- Hiển thị sản phẩm bằng c:forEach -->
                                                <c:forEach var="product" items="${products}" varStatus="status">
                                                    <!-- Thêm class "product-item" và "hidden" cho các sản phẩm cần ẩn -->
                                                    <div
                                                        class="col-md-6 col-lg-4 col-xl-3 product-item ${status.index >= 8 ? 'hidden' : ''}">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/images/product/${product.image}"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <a href="/product/${product.id}">${product.name}</a>
                                                                <p>${product.shortDesc}</p>
                                                                <div class="d-flex justify-content-center flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">
                                                                        <fmt:formatNumber type="number"
                                                                            value="${product.price}" /> / kg
                                                                    </p>
                                                                    <button data-product-id="${product.id}"
                                                                        class="btnAddToCartHomepage btn border border-secondary rounded-pill px-3 text-primary">
                                                                        <i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Thêm vào giỏ hàng
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <!-- Nút View More -->
                                            <div class="row">
                                                <div class="col-12 text-center">
                                                    <button id="viewMoreBtn" class="btn btn-primary mt-4"> Xem thêm
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="tab-2" class="tab-pane fade show p-0">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="row g-4">
                                                <c:forEach var="productsTypeRauCu" items="${productsTypeRauCus}">
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/images/product/${productsTypeRauCu.image}"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>

                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <a
                                                                    href="/product/${productsTypeRauCu.id}">${productsTypeRauCu.name}</a>
                                                                <p>${productsTypeRauCu.shortDesc}</p>
                                                                <div
                                                                    class="d-flex  justify-content-center flex-lg-wrap ">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">
                                                                        <fmt:formatNumber type="number"
                                                                            value="${productsTypeRauCu.price}" /> / kg
                                                                    </p>
                                                                    <!-- <form action="/add-product-to-cart/${product.id}"
                                                                        method="post">
                                                                        <input type="hidden"
                                                                            name="${_csrf.parameterName}"
                                                                            value="${_csrf.token}" /> -->

                                                                    <button data-product-id="${productsTypeRauCu.id}"
                                                                        class="btnAddToCartHomepage btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Thêm vào giỏ hàng
                                                                    </button>

                                                                    <!-- </form> -->
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="tab-3" class="tab-pane fade show p-0">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="row g-4">
                                                <c:forEach var="productsTypeTraiCay" items="${productsTypeTraiCays}">
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/images/product/${productsTypeTraiCay.image}"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>

                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <a
                                                                    href="/product/${productsTypeTraiCay.id}">${productsTypeTraiCay.name}</a>
                                                                <p>${productsTypeTraiCay.shortDesc}</p>
                                                                <div
                                                                    class="d-flex  justify-content-center flex-lg-wrap ">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">
                                                                        <fmt:formatNumber type="number"
                                                                            value="${productsTypeTraiCay.price}" /> / kg
                                                                    </p>
                                                                    <!-- <form action="/add-product-to-cart/${product.id}"
                                                                        method="post">
                                                                        <input type="hidden"
                                                                            name="${_csrf.parameterName}"
                                                                            value="${_csrf.token}" /> -->

                                                                    <button data-product-id="${productsTypeTraiCay.id}"
                                                                        class="btnAddToCartHomepage btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Thêm vào giỏ hàng
                                                                    </button>

                                                                    <!-- </form> -->
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="tab-4" class="tab-pane fade show p-0">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="row g-4">
                                                <c:forEach var="productsTypeThit" items="${productsTypeThits}">
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/images/product/${productsTypeThit.image}"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>

                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <a
                                                                    href="/product/${productsTypeThit.id}">${productsTypeThit.name}</a>
                                                                <p>${productsTypeThit.shortDesc}</p>
                                                                <div
                                                                    class="d-flex  justify-content-center flex-lg-wrap ">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">
                                                                        <fmt:formatNumber type="number"
                                                                            value="${productsTypeThit.price}" /> / kg
                                                                    </p>
                                                                    <!-- <form action="/add-product-to-cart/${product.id}"
                                                                        method="post">
                                                                        <input type="hidden"
                                                                            name="${_csrf.parameterName}"
                                                                            value="${_csrf.token}" /> -->

                                                                    <button data-product-id="${productsTypeThit.id}"
                                                                        class="btnAddToCartHomepage btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Thêm vào giỏ hàng
                                                                    </button>

                                                                    <!-- </form> -->
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="tab-5" class="tab-pane fade show p-0">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="row g-4">
                                                <c:forEach var="productsTypeThucUong" items="${productsTypeThucUongs}">
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/images/product/${productsTypeThucUong.image}"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>

                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <a
                                                                    href="/product/${productsTypeThucUong.id}">${productsTypeThucUong.name}</a>
                                                                <p>${productsTypeThucUong.shortDesc}</p>
                                                                <div
                                                                    class="d-flex  justify-content-center flex-lg-wrap ">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">
                                                                        <fmt:formatNumber type="number"
                                                                            value="${productsTypeThucUong.price}" /> /
                                                                        kg
                                                                    </p>
                                                                    <!-- <form action="/add-product-to-cart/${product.id}"
                                                                        method="post">
                                                                        <input type="hidden"
                                                                            name="${_csrf.parameterName}"
                                                                            value="${_csrf.token}" /> -->

                                                                    <button data-product-id="${productsTypeThucUong.id}"
                                                                        class="btnAddToCartHomepage btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Thêm vào giỏ hàng
                                                                    </button>

                                                                    <!-- </form> -->
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="tab-6" class="tab-pane fade show p-0">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="row g-4">
                                                <c:forEach var="productsTypeTinhBot" items="${productsTypeTinhBots}">
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/images/product/${productsTypeTinhBot.image}"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>

                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <a
                                                                    href="/product/${productsTypeTinhBot.id}">${productsTypeTinhBot.name}</a>
                                                                <p>${productsTypeTinhBot.shortDesc}</p>
                                                                <div
                                                                    class="d-flex  justify-content-center flex-lg-wrap ">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">
                                                                        <fmt:formatNumber type="number"
                                                                            value="${productsTypeTinhBot.price}" /> /
                                                                        kg
                                                                    </p>
                                                                    <!-- <form action="/add-product-to-cart/${product.id}"
                                                                        method="post">
                                                                        <input type="hidden"
                                                                            name="${_csrf.parameterName}"
                                                                            value="${_csrf.token}" /> -->

                                                                    <button data-product-id="${productsTypeTinhBot.id}"
                                                                        class="btnAddToCartHomepage btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Thêm vào giỏ hàng
                                                                    </button>

                                                                    <!-- </form> -->
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Fruits Shop End-->


                <!-- Featurs Start -->
                <div class="container-fluid service py-5">
                    <div class="container py-5">
                        <div class="row g-4 justify-content-center">
                            <div class="col-md-6 col-lg-4">
                                <a href="#">
                                    <div class="service-item bg-secondary rounded border border-secondary">
                                        <img src="/client/img/featur-1.jpg" class="img-fluid rounded-top w-100" alt="">
                                        <div class="px-4 rounded-bottom">
                                            <div class="service-content bg-primary text-center p-4 rounded">
                                                <h5 class="text-white">Táo tươi</h5>
                                                <h3 class="mb-0">Giảm giá 20%</h3>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-6 col-lg-4">
                                <a href="#">
                                    <div class="service-item bg-dark rounded border border-dark">
                                        <img src="/client/img/featur-2.jpg" class="img-fluid rounded-top w-100" alt="">
                                        <div class="px-4 rounded-bottom">
                                            <div class="service-content bg-light text-center p-4 rounded">
                                                <h5 class="text-primary">Trái cây</h5>
                                                <h3 class="mb-0">Miễn phí vận chuyển</h3>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-6 col-lg-4">
                                <a href="#">
                                    <div class="service-item bg-primary rounded border border-primary">
                                        <img src="/client/img/featur-3.jpg" class="img-fluid rounded-top w-100" alt="">
                                        <div class="px-4 rounded-bottom">
                                            <div class="service-content bg-secondary text-center p-4 rounded">
                                                <h5 class="text-white">Rau củ</h5>
                                                <h3 class="mb-0">Giảm giá 10%</h3>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Featurs End -->


                <!-- Vesitable Shop Start-->
                <div class="container-fluid vesitable py-5">
                    <div class="container py-5">
                        <h1>
                            Rau củ tươi sạch
                        </h1>
                        <div class="owl-carousel vegetable-carousel justify-content-center">
                            <div class="border border-primary rounded position-relative vesitable-item">
                                <div class="vesitable-img">
                                    <img src="/client/img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top"
                                        alt="">
                                </div>
                                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                    style="top: 10px; right: 10px;">Thực phẩm tươi sạch</div>
                                <div class="p-4 rounded-bottom">
                                    <h4>Rau mùi</h4>
                                    <p>Mùi tây tươi xanh chất lượng cao từ vườn.
                                    </p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold mb-0">50,000đ/kg</p>

                                    </div>
                                </div>
                            </div>

                            <div class="border border-primary rounded position-relative vesitable-item">
                                <div class="vesitable-img">
                                    <img src="/client/img/vegetable-item-3.png"
                                        class="img-fluid w-100 rounded-top bg-light" alt="">
                                </div>
                                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                    style="top: 10px; right: 10px;">Hoa quả tươi</div>
                                <div class="p-4 rounded-bottom">
                                    <h4>Chuối</h4>
                                    <p>Chuối vàng chín mọng giàu dinh dưỡng.
                                    </p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold mb-0">13,000đ/kg</p>

                                    </div>
                                </div>
                            </div>
                            <div class="border border-primary rounded position-relative vesitable-item">
                                <div class="vesitable-img">
                                    <img src="/client/img/vegetable-item-4.jpg" class="img-fluid w-100 rounded-top"
                                        alt="">
                                </div>
                                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                    style="top: 10px; right: 10px;">Thực phẩm sạch</div>
                                <div class="p-4 rounded-bottom">
                                    <h4>Ớt chuông</h4>
                                    <p>Ớt chuông đỏ tươi, giòn ngọt và giàu vitamin.
                                    </p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold mb-0">180,000đ/kg</p>

                                    </div>
                                </div>
                            </div>
                            <div class="border border-primary rounded position-relative vesitable-item">
                                <div class="vesitable-img">
                                    <img src="/client/img/vegetable-item-5.jpg" class="img-fluid w-100 rounded-top"
                                        alt="">
                                </div>
                                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                    style="top: 10px; right: 10px;">Rau củ sạch</div>
                                <div class="p-4 rounded-bottom">
                                    <h4>Khoai tây</h4>
                                    <p>Khoai tây tươi ngon từ nông trại, giàu dinh dưỡng.
                                    </p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold mb-0">15,000đ/kg</p>

                                    </div>
                                </div>
                            </div>


                            <div class="border border-primary rounded position-relative vesitable-item">
                                <div class="vesitable-img">
                                    <img src="/client/img/best-product-1.jpeg" class="img-fluid w-100 rounded-top"
                                        alt="">
                                </div>
                                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                    style="top: 10px; right: 10px;">Hoa quả tươi</div>
                                <div class="p-4 rounded-bottom">
                                    <h4>Cam </h4>
                                    <p>Cam tươi mọng nước, cung cấp vitamin C giúp tăng cường hệ miễn dịch.
                                    </p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold mb-0">25,000đ/kg</p>

                                    </div>
                                </div>
                            </div>

                            <div class="border border-primary rounded position-relative vesitable-item">
                                <div class="vesitable-img">
                                    <img src="/client/img/best-product-6.jpeg" class="img-fluid w-100 rounded-top"
                                        alt="">
                                </div>
                                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                    style="top: 10px; right: 10px;">Hoa quả tươi</div>
                                <div class="p-4 rounded-bottom">
                                    <h4>Táo</h4>
                                    <p>Cam tươi mọng nước, cung cấp vitamin C giúp tăng cường hệ miễn dịch.
                                    </p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold mb-0">25,000đ/kg</p>

                                    </div>
                                </div>
                            </div>



                        </div>
                    </div>
                </div>


                <jsp:include page="../layout/footer.jsp" />
                <jsp:include page="../layout/chat-bot.jsp" />


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
                <script
                    src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
                <script>


                    var nameProducts = ${ nameProducts };
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