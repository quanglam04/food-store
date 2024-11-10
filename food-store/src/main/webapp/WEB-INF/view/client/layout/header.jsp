<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <style>
            /* Đảm bảo form có vị trí tương đối */
            .input-group {
                position: relative; /* Cho phép các phần tử con như autocomplete-item có thể đặt vị trí tuyệt đối */
            }

            /* Kiểu dáng cho danh sách gợi ý autocomplete */
            .autocomplete-items {
                position: absolute;
                top: 100%; /* Đặt gợi ý dưới thanh tìm kiếm */
                left: 0;
                width: 100%; /* Chiều rộng bằng với thanh tìm kiếm */
                background-color: #fff;
                border: 1px solid #d4d4d4;
                max-height: 200px;
                overflow-y: auto;
                z-index: 9999;
            }

            /* Kiểu dáng cho item gợi ý khi được chọn */
            .autocomplete-active {
                background-color: #d4d4d4;
            }



        </style>
        <!-- Navbar start -->
        <div class="container-fluid fixed-top " style="background-color: #E8E8E8;">

            <div class="container px-0">
                <nav class="navbar navbar-light   navbar-expand-xl">
                    <a href="/" class="navbar-brand">
                        <h1 class="text-primary display-6">FoodStore</h1>
                    </a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse  " id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="/" class="nav-item nav-link active" style="font-size: 21px;">Trang chủ</a>
                            <a href="/products" class="nav-item nav-link" style="font-size: 21px;">Sản phẩm</a>

                        </div>
                        <div class="d-flex m-3 me-0">


                            <c:if test="${not empty pageContext.request.userPrincipal}">

                                <form action="/products" method="get" class="input-group rounded">
                                    <label for="tags"></label>
                                    <input name="text" type="text" id = "tags" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
                                    <button type="submit" class="input-group-text border-0"   id="search-addon">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </form>
                                <div id="autocomplete-list" class="autocomplete-items"></div>

                                <a href="/cart" class="position-relative me-4 my-auto">
                                    <i class="fa fa-shopping-bag fa-2x"></i>
                                    <span
                                        class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                                        style="top: -5px; left: 15px; height: 20px; min-width: 20px;" id="sumCart">
                                        ${sessionScope.sum}
                                    </span>
                                </a>

                                <!-- Dropdown -->
                                <div class="dropdown my-auto">

                                    <a href="#" class="dropdown" role="button" id="dropdownMenuLink"
                                        data-bs-toggle="dropdown" aria-expanded="false" data-bs-toggle="dropdown"
                                        aria-expanded="false">
                                        <i class="fas fa-user fa-2x"></i>
                                    </a>

                                    <ul class="dropdown-menu dropdown-menu-end p-4" aria-labelledby="dropdownMenuLink">
                                        <li class="d-flex align-items-center flex-column" style="min-width: 300px;">
                                            <img style="width: 150px; height: 150px; border-radius: 50%; overflow: hidden;"
                                                src="/images/avatar/${sessionScope.avatar}" alt="avatar" />

                                            <div class="text-center my-3">
                                                <c:out value="${sessionScope.fullName}" />
                                            </div>
                                        </li>

                                        <li><a class="dropdown-item" href="/view-profile">Quản lý tài khoản</a></li>

                                        <li><a class="dropdown-item" href="/order-history">Lịch sử mua hàng</a></li>
                                        <li><a class="dropdown-item" href="/change-password">Đổi mật khẩu</a></li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li>
                                            <form method="post" action="/logout">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <button class="dropdown-item">Đăng xuất</button>
                                            </form>

                                        </li>
                                    </ul>
                                </div>
                            </c:if>

                            <c:if test="${empty pageContext.request.userPrincipal}">
                                <a href="/login" class="a-login position-relative me-4 my-auto">
                                    Đăng nhập

                                </a>

                            </c:if>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->