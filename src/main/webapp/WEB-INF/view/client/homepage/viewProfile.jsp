<%@page contentType="text/html" pageEncoding="UTF-8" %>

    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Profile</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <style>
            body {
                background-color: #f7f7f7;
                font-family: Arial, sans-serif;
            }

            .card {
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                padding: 30px;
                background-color: #ffffff;
            }

            .card-body {
                padding: 40px;
            }

            .profile-img {
                width: 150px;
                height: 150px;
                object-fit: cover;
                border-radius: 50%;
                margin-bottom: 20px;
            }

            .profile-info h3 {
                font-size: 28px;
                font-weight: bold;
                color: #333;
            }

            .profile-info span {
                font-size: 16px;
                color: #666;
            }

            .profile-details {
                margin-top: 20px;
            }

            .profile-details li {
                margin-bottom: 15px;
                font-size: 18px;
                color: #333;
            }

            .profile-details li span {
                font-weight: bold;
                color: #555;
            }

            .btn-primary,
            .btn-secondary {
                margin-top: 15px;
                padding: 10px 20px;
                border-radius: 30px;
                font-size: 16px;
            }

            .btn-primary {
                background-color: #007bff;
                border: none;
            }

            .btn-secondary {
                background-color: #f0ad4e;
                border: none;
            }

            .btn a {
                color: white;
                text-decoration: none;
            }

            .btn a:hover {
                opacity: 0.8;
            }

            .logo {
                display: block;
                margin-left: auto;
                margin-right: auto;
                width: 150px;
                margin-bottom: 30px;
            }
        </style>
    </head>

    <body>
        <section class="bg-light d-flex justify-content-center align-items-center" style="margin-top: 40px;">
            <div class=" container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <img src="/images/logo/logo.png" alt="Logo" class="logo">

                        <div class="card">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-lg-4 text-center">
                                        <img src="/images/avatar/${user.avatar}" alt="Avatar" class="profile-img">
                                        <div class="btn btn-secondary mt-3">
                                            <a href="/update-profile/${user.id}">Cập nhật</a>
                                        </div>
                                    </div>
                                    <div class="col-lg-8 profile-info">
                                        <h1 style="font-weight: bold;">${user.fullName}</h1>


                                        <ul class="profile-details list-unstyled mt-4">
                                            <li><span>Email:</span> ${user.email}</li>
                                            <li><span>Số điện thoại:</span> ${user.phone}</li>
                                            <li><span>Địa chỉ:</span> ${user.address}</li>
                                            <li><span>Vai trò:</span> ${user.role.name}</li>
                                        </ul>

                                        <div class="btn btn-primary mt-3">
                                            <a href="/">Trở lại trang chủ</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="../../client/layout/chat-bot.jsp" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>