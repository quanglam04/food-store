<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <title>Không tìm thấy trang</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        text-align: center;
        padding: 50px;
      }

      .container {
        background-color: #ffffff;
        border: 1px solid #dee2e6;
        border-radius: 8px;
        padding: 40px;
        max-width: 500px;
        margin: 0 auto;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }

      h1 {
        color: #dc3545;
      }

      p {
        color: #6c757d;
        margin-bottom: 30px;
      }

      .back-button {
        background-color: #007bff;
        color: white;
        padding: 12px 24px;
        border: none;
        border-radius: 6px;
        text-decoration: none;
        font-size: 16px;
        cursor: pointer;
      }

      .back-button:hover {
        background-color: #0056b3;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h1>404 - Không tìm thấy trang</h1>
      <p>Trang bạn yêu cầu không tồn tại hoặc đã bị xóa.</p>
      <a href="/" class="back-button">Quay về trang chủ</a>
    </div>
  </body>
</html>
