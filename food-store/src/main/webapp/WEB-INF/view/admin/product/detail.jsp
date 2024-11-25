<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" />
                    <meta name="author" />
                    <title>Chi tiết sản phẩm </title>
                    <link href="/css/styles.css" rel="stylesheet" />

                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Sản phẩm</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">Bảng điều khiển</a></li>
                                        <li class="breadcrumb-item"><a href="/admin/product">Sản phẩm</a></li>
                                        <li class="breadcrumb-item active">Chi tiết sản phẩm</li>
                                    </ol>
                                    <div class="container mt-5">
                                        <div class="row">
                                            <div style="text-align: center;">
                                                <h3>Chi tiết sản phẩm với id = ${id}</h3>
                                            </div>
                                            <div class="col-12 mx-auto">

                                                <hr />

                                                <div class="card"
                                                    style="width: 30%;margin-left: auto;margin-right: auto;">
                                                    <img class="card-img-top" src="/images/product/${product.image}"
                                                        alt="Card image cap">


                                                    <ul class="list-group list-group-flush">
                                                        <li class="list-group-item">ID: ${product.id}</li>
                                                        <li class="list-group-item">Tên: ${product.name}</li>
                                                        <li class="list-group-item">Giá: <p class=" fs-7 mb-0">
                                                                <fmt:formatNumber type="number"
                                                                    value="${product.price}" />
                                                            </p>


                                                        </li>
                                                    </ul>
                                                </div>
                                                <div style="margin-left: 35% ;">
                                                    <a href="/admin/product" class="btn btn-success mt-2">Quay lại</a>
                                                </div>
                                                <hr>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </main>
                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>

                </body>

                </html>