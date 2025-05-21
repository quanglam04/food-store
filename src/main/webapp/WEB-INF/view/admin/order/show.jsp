<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" />
    <meta name="author" />
    <title>Bảng điều khiển</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
  </head>

  <body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />

    <div id="layoutSidenav">
      <jsp:include page="../layout/sidebar.jsp" />

      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Quản lý đơn hàng</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="/admin">Bảng điều khiển</a>
              </li>
              <li class="breadcrumb-item active">Đơn hàng</li>
            </ol>
            <div>
              <h3>Bảng thông tin đơn hàng</h3>
            </div>
            <hr />

            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Tổng</th>
                  <th>Người dùng</th>
                  <th>Trạng thái</th>
                  <th>Thông tin giao dịch</th>
                  <th>Thao tác</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="order" items="${orders}">
                  <tr>
                    <th>${order.id}</th>
                    <td>
                      <p class="fs-7 mb-0">
                        <fmt:formatNumber
                          type="number"
                          value="${order.totalPrice}"
                        />
                      </p>
                    </td>
                    <td>${order.receiverName}</td>
                    <td>${order.status}</td>
                    <td>
                      <div>Trạng thái: ${order.paymentStatus}</div>
                      <div>
                        <span style="font-weight: bold">Mã giao dịch</span>
                        ${order.paymentRef}
                      </div>
                    </td>
                    <td>
                      <a href="/admin/order/${order.id}" class="btn btn-success"
                        >Chi tiết</a
                      >
                      <a
                        href="/admin/order/update/${order.id}"
                        class="btn btn-warning mx-2"
                        >Cập nhật</a
                      >
                      <a
                        href="/admin/order/delete/${order.id}"
                        class="btn btn-danger"
                        >Xóa</a
                      >
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
            <a href="/admin" class="btn btn-success mt-3">Quay lại</a>
            <nav aria-label="Page navigation example">
              <ul class="pagination justify-content-center">
                <!-- Nút Previous -->
                <li class="page-item">
                  <a
                    class="${currentPage == 1 ? 'disabled page-link' : 'page-link'}"
                    href="/admin/order?page=${currentPage - 1}"
                    aria-label="Previous"
                  >
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>

                <!-- Trang đầu tiên -->
                <li class="page-item">
                  <a
                    class="${currentPage == 1 ? 'active page-link' : 'page-link'}"
                    href="/admin/order?page=1"
                    >1</a
                  >
                </li>

                <!-- Dấu ... nếu currentPage > 4 -->
                <c:if test="${currentPage > 4}">
                  <li class="page-item disabled">
                    <span class="page-link">...</span>
                  </li>
                </c:if>

                <!-- Các trang xung quanh currentPage -->
                <c:forEach
                  begin="${currentPage - 1}"
                  end="${currentPage + 1}"
                  var="i"
                >
                  <c:if test="${i > 1 && i < totalPages}">
                    <li class="page-item">
                      <a
                        class="${i == currentPage ? 'active page-link' : 'page-link'}"
                        href="/admin/order?page=${i}"
                        >${i}</a
                      >
                    </li>
                  </c:if>
                </c:forEach>

                <!-- Dấu ... nếu currentPage < totalPages - 3 -->
                <c:if test="${currentPage < totalPages - 3}">
                  <li class="page-item disabled">
                    <span class="page-link">...</span>
                  </li>
                </c:if>

                <!-- Trang cuối -->
                <c:if test="${totalPages > 1}">
                  <li class="page-item">
                    <a
                      class="${currentPage == totalPages ? 'active page-link' : 'page-link'}"
                      href="/admin/order?page=${totalPages}"
                      >${totalPages}</a
                    >
                  </li>
                </c:if>

                <!-- Nút Next -->
                <li class="page-item">
                  <a
                    class="${currentPage == totalPages ? 'disabled page-link' : 'page-link'}"
                    href="/admin/order?page=${currentPage + 1}"
                    aria-label="Next"
                  >
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
              </ul>
            </nav>
          </div>
        </main>
        <jsp:include page="../../client/layout/chat-bot.jsp" />
        <jsp:include page="../layout/footer.jsp" />
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="js/scripts.js"></script>
  </body>
</html>
