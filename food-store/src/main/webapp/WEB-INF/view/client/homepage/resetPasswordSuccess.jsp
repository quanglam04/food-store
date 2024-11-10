<%@page contentType="text/html" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đặt Lại Mật Khẩu Thành Công</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f4f8;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                height: 100vh;
            }

            h1 {
                color: #4CAF50;
                margin-bottom: 20px;
            }

            p {
                color: #333;
                margin-bottom: 40px;
                font-size: 18px;
                text-align: center;
            }

            a {
                text-decoration: none;
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border-radius: 5px;
                transition: background-color 0.3s;
            }

            a:hover {
                background-color: #45a049;
            }
        </style>
    </head>

    <body>
        <h1>Đặt Lại Mật Khẩu Thành Công!</h1>
        <p>
            Mật khẩu của bạn đã được thay đổi thành công. Bạn có thể đăng nhập với mật khẩu mới.
        </p>
        <a href="/login">Bấm để trở về trang đăng nhập</a>
    </body>

    </html>