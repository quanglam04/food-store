<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link
      href="https://fonts.googleapis.com/css?family=Varela+Round"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Poppins"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="/client/css/access-deny.css" />
    <style>
      .jq-toast-single {
        font-size: 16px !important;
      }
    </style>
  </head>

  <body>
    <div class="message">
      Bạn không có quyền truy cập nguồn tài nguyên này.
      <hr />
      <a href="/" class="" style="color: white">
        Bấm để quay trở về trang chủ.
      </a>
    </div>

    <div class="container">
      <div class="neon">403</div>
      <div class="door-frame">
        <div class="door">
          <div class="rectangle"></div>
          <div class="handle"></div>
          <div class="window">
            <div class="eye"></div>
            <div class="eye eye2"></div>
            <div class="leaf"></div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
