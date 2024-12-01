<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Đăng ký thành công</title>

                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

                <style>
                    body {
                        background-color: #f8f9fa;
                        font-family: 'Arial', sans-serif;
                    }

                    .container {
                        max-width: 600px;
                        margin: 50px auto;
                        padding: 30px;
                        background-color: #ffffff;
                        border-radius: 10px;
                        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                        text-align: center;
                    }

                    h1 {
                        color: #28a745;
                        font-size: 32px;
                        margin-bottom: 20px;
                    }

                    p {
                        font-size: 18px;
                        color: #333;
                        margin-bottom: 40px;
                    }

                    .btn-primary {
                        font-size: 16px;
                        padding: 10px 20px;
                    }

                    .icon {
                        font-size: 50px;
                        color: #28a745;
                        margin-bottom: 20px;
                    }
                </style>
            </head>

            <body>

                <div class="container">
                    <!-- Success icon -->
                    <div class="icon">
                        <i class="bi bi-check-circle-fill"></i> <!-- Bootstrap icon for success -->
                    </div>

                    <h1>Đăng ký thành công!</h1>
                    <p>Bạn đã đăng ký thành công tài khoản của mình.</p>

                    <a href="/login" class="btn btn-primary">Bấm để trở về trang đăng nhập</a>

                    <p class="mt-4">Chúc bạn có những trải nghiệm tuyệt vời!</p>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>