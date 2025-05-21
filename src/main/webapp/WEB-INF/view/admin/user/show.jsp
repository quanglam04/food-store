<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
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
            <h1 class="mt-4">Quản lý người dùng</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="/admin">Bảng điều khiển</a>
              </li>
              <li class="breadcrumb-item active">Người dùng</li>
            </ol>
            <div class="mt-5">
              <div class="row">
                <div class="col-12 mx-auto">
                  <div class="d-flex justify-content-between">
                    <h3>Bảng thông tin người dùng</h3>
                    <a href="/admin/user/create" class="btn btn-primary"
                      >Tạo một người dùng</a
                    >
                  </div>

                  <hr />
                  <table class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>Email</th>
                        <th>Tên đầy đủ</th>
                        <th>Vai trò</th>
                        <th>Thao tác</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="user" items="${listUser}">
                        <tr>
                          <th>${user.id}</th>
                          <td>${user.email}</td>
                          <td>${user.fullName}</td>
                          <td>${user.role.name}</td>
                          <td>
                            <a
                              href="/admin/user/${user.id}"
                              class="btn btn-success"
                              >Chi tiết</a
                            >
                            <a
                              href="/admin/user/update/${user.id}"
                              class="btn btn-warning mx-2"
                              >Cập nhật</a
                            >
                            <a
                              href="/admin/user/delete/${user.id}"
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
                      <!-- Previous Button -->
                      <li class="page-item">
                        <a
                          class="${currentPage == 1 ? 'disabled page-link' : 'page-link'}"
                          href="/admin/user?page=${currentPage - 1}"
                          aria-label="Previous"
                        >
                          <span aria-hidden="true">&laquo;</span>
                        </a>
                      </li>

                      <!-- Always show page 1 -->
                      <li class="page-item">
                        <a
                          class="${currentPage == 1 ? 'active page-link' : 'page-link'}"
                          href="/admin/user?page=1"
                          >1</a
                        >
                      </li>

                      <!-- Show ... after page 1 if currentPage > 4 -->
                      <c:if test="${currentPage > 4}">
                        <li class="page-item disabled">
                          <span class="page-link">...</span>
                        </li>
                      </c:if>

                      <!-- Show middle pages (currentPage -1, currentPage, currentPage +1) -->
                      <c:forEach
                        begin="${currentPage - 1}"
                        end="${currentPage + 1}"
                        var="i"
                      >
                        <c:if test="${i > 1 && i < totalPages}">
                          <li class="page-item">
                            <a
                              class="${i == currentPage ? 'active page-link' : 'page-link'}"
                              href="/admin/user?page=${i}"
                            >
                              ${i}
                            </a>
                          </li>
                        </c:if>
                      </c:forEach>

                      <!-- Show ... before last page if currentPage < totalPages - 3 -->
                      <c:if test="${currentPage < totalPages - 3}">
                        <li class="page-item disabled">
                          <span class="page-link">...</span>
                        </li>
                      </c:if>

                      <!-- Always show last page if more than 1 -->
                      <c:if test="${totalPages > 1}">
                        <li class="page-item">
                          <a
                            class="${currentPage == totalPages ? 'active page-link' : 'page-link'}"
                            href="/admin/user?page=${totalPages}"
                          >
                            ${totalPages}
                          </a>
                        </li>
                      </c:if>

                      <!-- Next Button -->
                      <li class="page-item">
                        <a
                          class="${currentPage == totalPages ? 'disabled page-link' : 'page-link'}"
                          href="/admin/user?page=${currentPage + 1}"
                          aria-label="Next"
                        >
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
        <jsp:include page="../../client/layout/chat-bot.jsp" />
        <jsp:include page="../layout/footer.jsp" />
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/scripts.js"></script>
  </body>
</html>
