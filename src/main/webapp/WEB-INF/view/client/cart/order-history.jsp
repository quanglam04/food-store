<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>Lịch sử mua hàng - FoodStore</title>
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
                

                <style>
                    .jq-toast-single {
                            font-size: 16px !important;  
                        }
                    /* Custom styling */
                    .order-history-title {
                        font-size: 1.5rem;
                        font-weight: 600;
                        color: #333;
                    }

                    .table th,
                    .table td {
                        vertical-align: middle;
                    }

                    .table th {
                        color: #555;
                        background-color: #f8f9fa;
                        text-align: center;
                    }

                    .table img {
                        width: 70px;
                        height: 70px;
                        object-fit: cover;
                        border-radius: 8px;
                    }

                    .table td {
                        text-align: center;
                    }

                    .breadcrumb {
                        background-color: transparent;
                    }

                    .breadcrumb-item a {
                        color: #007bff;
                    }

                    .breadcrumb-item.active {
                        color: #6c757d;
                    }

                    .order-id {
                        font-weight: bold;
                        font-size: 1rem;
                    }

                    .price-text {
                        color: #d9534f;
                        font-weight: 600;
                    }
                </style>
            </head>

            <body>

                <!-- Spinner Start -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <!-- Spinner End -->

                <jsp:include page="../layout/header.jsp" />

                <!-- Cart Page Start -->
                <div class="container-fluid py-5">
                    <div class="container py-5">
                        <div class="mb-3">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mt-3">
                                    <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Lịch sử mua hàng</li>
                                </ol>
                            </nav>
                        </div>

                        <h2 class="order-history-title mb-4">Lịch sử mua hàng</h2>

                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Sản phẩm</th>
                                        <th>Tên</th>
                                        <th>Giá cả</th>
                                        <th>Số lượng</th>
                                        <th>Thành tiền</th>
                                        <th>Địa chỉ</th>
                                        <th>Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${ empty orders}">
                                        <tr>
                                            <td colspan="6">Không có đơn hàng nào được tạo</td>
                                        </tr>
                                    </c:if>
                                    <c:forEach var="order" varStatus="loop" items="${orders}">
                                        <tr>
                                            <td colspan="2" class="order-id">Số thứ tự : ${loop.index + 1}
                                            </td>
                                            <td colspan="1" class="price-text">
                                                <fmt:formatNumber type="number" value="${order.totalPrice}" /> đ
                                            </td>
                                            <td colspan="2"></td>
                                            <td colspan="1">${order.receiverAddress}</td>
                                            <td colspan="1">
                                                <c:choose>
                                                    <c:when test="${order.status == 'Hủy'}">
                                                        Đã hủy
                                                    </c:when>
                                            
                                                    <c:when test="${order.status == 'Hoàn thành'}">
                                                        Hoàn thành - Đã thanh toán
                                                    </c:when>
                                            
                                                    <c:otherwise>
                                                        <c:choose>
                                                            <c:when test="${order.paymentMethod == 'COD'}">
                                                                ${order.status} - Chưa thanh toán
                                                            </c:when>
                                            
                                                            <c:when test="${order.paymentMethod == 'BANKING'}">
                                                                ${order.status} - Đã thanh toán
                                                            </c:when>
                                            
                                                            <c:otherwise>
                                                                ${order.status}
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>


                                        </tr>
                                        <c:forEach var="orderDetail" items="${order.orderDetails}">
                                            <tr>
                                                <td>
                                                    <img src="/images/product/${orderDetail.product.image}"
                                                        alt="${orderDetail.product.name}">
                                                </td>
                                                <td>
                                                    <a href="/product/${orderDetail.product.id}" target="_blank">
                                                        ${orderDetail.product.name}
                                                    </a>
                                                </td>
                                                <td class="price-text">
                                                    <fmt:formatNumber type="number" value="${orderDetail.price}" /> đ
                                                </td>
                                                <td>${orderDetail.quantity}</td>
                                                <td class="price-text">
                                                    <fmt:formatNumber type="number"
                                                        value="${orderDetail.price * orderDetail.quantity}" /> đ
                                                </td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </c:forEach>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Cart Page End -->

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
            </body>

            </html>