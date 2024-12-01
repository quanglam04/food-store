<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Password Changed Successfully</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                    crossorigin="anonymous">
                <style>
                    body {
                        background-color: #f7f7f7;
                        font-family: Arial, sans-serif;
                    }

                    .container {
                        margin-top: 100px;
                        text-align: center;
                    }

                    .card {
                        padding: 30px;
                        border-radius: 10px;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                        background-color: #fff;
                    }

                    .btn {
                        margin-top: 20px;
                    }

                    .success-icon {
                        font-size: 50px;
                        color: #28a745;
                    }
                </style>
            </head>

            <body>

                <div class="container">
                    <div class="card">
                        <div class="success-icon">
                            &#10003; <!-- Icon tick -->
                        </div>
                        <h2 class="text-success mt-3">Thay đổi mật khẩu thành công!</h2>
                        <p>Mật khẩu của bạn đã được cập nhật thành công. Bây giờ bạn có thể sử dụng mật khẩu mới.</p>
                        <a href="/" class="btn btn-success">Trở về trang chủ</a>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>