# 🍱 Food Store - Spring Boot Web Application

## 1. Giới thiệu

**Food Store** là một ứng dụng web bán hàng thực phẩm trực tuyến được xây dựng bằng Spring Boot. Dự án hỗ trợ đầy đủ chức năng cho người dùng và quản trị viên, tích hợp chatbot AI, thanh toán trực tuyến, và giao hàng nhanh.

---

## 2. Cấu trúc dự án

<pre>
quanglam04-food-store/
├── mysql-init/                   # File SQL khởi tạo CSDL
├── src/
│   ├── main/
│   │   ├── java/com/example/food_store/
│   │   │   ├── config/           # Cấu hình Spring Security & Web
│   │   │   ├── controller/       # Controller cho admin & client
│   │   │   ├── domain/           # Entity & DTO
│   │   │   ├── repository/       # Repository JPA
│   │   │   └── service/          # Business logic
│   ├── resources/                # application.properties, template mail
│   └── webapp/                   # View JSP, tài nguyên tĩnh (JS/CSS/IMG)
├── docker-compose.yml            # Cấu hình Docker Compose
├── Dockerfile                    # Docker build app
├── pom.xml                       # Cấu hình Maven
</pre>

---

## 3. Chức năng chính

### 👤 Người dùng

- Đăng ký, đăng nhập, quên mật khẩu
- Cập nhật thông tin cá nhân, đổi mật khẩu
- Xem sản phẩm, chi tiết sản phẩm
- Thêm sản phẩm vào giỏ hàng
- Đặt hàng và theo dõi lịch sử mua hàng

### 🛠️ Quản trị viên

- Quản lý sản phẩm (thêm, sửa, xóa)
- Quản lý đơn hàng
- Quản lý người dùng
- Xem dashboard thống kê

---

## 4. Tính năng khác

- 🤖 **Chatbot AI Gemini**: Tư vấn và hỗ trợ khách hàng
- 🚚 **Giao Hàng Nhanh API**: Tính phí vận chuyển theo địa chỉ thực tế
- 💳 **Thanh toán VNPAY**: Hỗ trợ thanh toán online
- 🔐 **OAuth2 Login**: Đăng nhập bằng Google và GitHub
- 📲 **Xác thực OTP qua Twilio**: Gửi mã OTP qua SMS để bảo mật tài khoản
- 🧪 **SonarQube Quality Gate**: Phân tích, kiểm tra chất lượng và bảo mật mã nguồn tự động

---

## 5. Hướng dẫn chạy dự án

### Cách 1: Dùng Docker Compose (khuyên dùng)

#### Bước 1: Clone dự án

```
git clone https://github.com/quanglam04/food-store.git
```

#### Bước 2: Di chuyển vào thư mục dự án

```
cd food-store
```

#### Bước 3: Khởi tạo và chạy Docker

```
docker-compose build
docker-compose up -d
```

#### Truy cập ứng dụng

- Ứng dụng sẽ chạy tại:

```
http://localhost:8080
```

#### Kết nối cơ sở dữ liệu (MySQL qua Docker)

- **Host:** localhost
- **Port:** 3306 _(hoặc theo cấu hình trong `docker-compose.yml`)_
- **User:** root
- **Password:** root

#### Dừng ứng dụng

```
docker-compose down
```

### Cách 2: Dùng Maven & MySQL cài đặt sẵn

Cấu hình database trong application.properties
Chạy lệnh:

```bash
./mvnw spring-boot:run
```

### Kết quả sau khi chạy thành công:


![Demo 4](https://github.com/quanglam04/food-store/blob/master/src/main/webapp/resources/client/img/image.png)
<p align="center">
  Báo cáo chất lượng code từ SonarQube
</p>

![Demo 4](https://github.com/quanglam04/food-store/blob/master/src/main/webapp/resources/client/img/demo_4%20-%20Copy.png)
<p align="center">
  Đăng nhập
</p>

![Demo 3](https://github.com/quanglam04/food-store/blob/master/src/main/webapp/resources/client/img/demo_3.png)
<p align="center">
  Trang chủ
</p>

![Demo 2](https://github.com/quanglam04/food-store/blob/master/src/main/webapp/resources/client/img/demo_2.png)
<p align="center">
  Sản phẩm
</p>

![Demo 6](https://github.com/quanglam04/food-store/blob/master/src/main/webapp/resources/client/img/demo_6.png)
<p align="center">
  Tính phí vận chuyển dựa trên khoảng cách thực tế
</p>

![Demo 7](https://github.com/quanglam04/food-store/blob/master/src/main/webapp/resources/client/img/demo_7.png)
<p align="center">
  Thanh toán
</p>

![Demo 1](https://github.com/quanglam04/food-store/blob/master/src/main/webapp/resources/client/img/demo_1.png)
<p align="center">
  Dashboard phía ADMIN
</p>
---

## 6. Công nghệ sử dụng

- Spring Boot
- Spring Security (Form Login & OAuth2 Login)
- Spring MVC
- Spring Session
- JSP View Engine
- MySQL
- Maven
- Docker & Docker Compose
- SonarQube

### Yêu cầu về version

- **Docker:** version `20.10+`
- **Docker Compose:** version `1.29+`
- **Java:** version `17+`
- **Spring Boot:** version `3.3.4+`
- **Spring Security:** version `6.3.1+`
- **Maven:** `3.6+`
- **MySQL Server:** version `8.0+`
- **SonarQube:** `version 10.x Community Edition`

---

## 7. Thông tin khác

    Liên hệ: trinhquanglam2k4@gmail.com
