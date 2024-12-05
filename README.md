<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
</head>
<body>
    <h1>Food Store Project</h1>
<div class="section">
        <h2>Giới thiệu</h2>
        <p>Dự án <strong>Food Store</strong> là một ứng dụng web quản lý cửa hàng thực phẩm, được xây dựng bằng Spring Boot, Spring Security(Form Authentication), Spring MVC, Spring Session, Template ViewEngine( JSP ) và tích hợp với Docker để dễ dàng triển khai.</p>
    </div>
    <div class="section">
        <h2>Các bước khởi tạo dự án</h2>
        <h3>Bước 1: Clone dự án từ GitHub</h3>
        <pre><code>git clone https://github.com/quanglam04/food-store.git</code></pre>
        <h3>Bước 2: Di chuyển vào thư mục dự án</h3>
        <pre><code>cd food-store</code></pre>
        <h3>Bước 3: Chạy ứng dụng với Docker</h3>
        <pre><code>docker compose -p trinhlam-spring-mvc-app up -d</code></pre>
    </div>
    <div class="section">
        <h2>Truy cập ứng dụng</h2>
        <ul>
            <li>Ứng dụng sẽ được chạy trên <strong>localhost</strong>, tại cổng mặc định:
                <pre><code>http://localhost:8080</code></pre>
            </li>
            <li>Nếu bạn sử dụng MySQL qua Docker, thông tin kết nối:
                <ul>
                    <li><strong>Host:</strong> localhost</li>
                    <li><strong>Port:</strong> 3306 (hoặc cổng bạn đã cấu hình trong <code>docker-compose.yml</code>)</li>
                    <li><strong>User:</strong> root</li>
                    <li><strong>Password:</strong> root</li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="section">
        <h2>Dừng ứng dụng</h2>
        <pre><code>docker compose -p trinhlam-spring-mvc-app down</code></pre>
    </div>
    <div class="section">
        <h2>Yêu cầu hệ thống</h2>
        <ul>
            <li><strong>Docker:</strong> phiên bản 20.10 trở lên</li>
            <li><strong>Docker Compose:</strong> phiên bản 1.29 trở lên</li>
        </ul>
    </div>
    <div class="section">
        <h2>Thông tin liên hệ</h2>
        <p>Nếu gặp vấn đề khi khởi chạy, vui lòng liên hệ:</p>
        <ul>
            <li><strong>Email:</strong> trinhquanglam2k4@gmail.com</li>
        </ul>
    </div>
</body>
</html>
