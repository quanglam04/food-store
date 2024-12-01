<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" />
                <meta name="author" />
                <title>Bảng điều khiển </title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Quản lý sản phẩm</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Bảng điều khiển</a></li>
                                    <li class="breadcrumb-item active">Sản phẩm</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3>Bảng thông tin sản phẩm</h3>
                                                <a href="/admin/product/create" class="btn btn-primary">Tạo sản phẩm</a>
                                            </div>

                                            <hr />
                                            <table class=" table table-bordered table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Tên</th>
                                                        <th>Giá</th>

                                                        <th>Thao tác</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="product" items="${products}">
                                                        <tr>
                                                            <th>${product.id}</th>
                                                            <td>${product.name}</td>
                                                            <td>
                                                                <p class=" fs-7 mb-0">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${product.price}" />
                                                                </p>

                                                            </td>

                                                            <td>
                                                                <a href="/admin/product/${product.id}"
                                                                    class="btn btn-success">Chi tiết</a>
                                                                <a href="/admin/product/update/${product.id}"
                                                                    class="btn btn-warning  mx-2">Cập nhật</a>
                                                                <a href="/admin/product/delete/${product.id}"
                                                                    class="btn btn-danger">Xóa</a>
                                                            </td>
                                                        </tr>

                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                            <!-- phân trang -->
                                            <a href="/admin" class="btn btn-success mt-3">Quay lại</a>
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination justify-content-center">

                                                    <li class="page-item">
                                                        <a class="${currentPage == 1 ? 'page-link disabled' : 'page-link'}"
                                                            href="/admin/product?page=${currentPage-1}"
                                                            aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                        </a>
                                                    </li>

                                                    <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                                        <li class="page-item"><a
                                                                class="${(loop.index) eq currentPage?'active page-link':'page-link'}"
                                                                href="/admin/product?page=${loop.index}">${loop.index}</a>
                                                        </li>
                                                    </c:forEach>

                                                    <li class="page-item">
                                                        <a class="${currentPage == totalPages ? 'page-link disabled' : 'page-link'}"
                                                            href="/admin/product?page=${currentPage+1}"
                                                            aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </nav>
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