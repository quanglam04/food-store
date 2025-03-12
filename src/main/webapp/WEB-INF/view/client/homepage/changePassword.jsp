<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Change Password</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                    crossorigin="anonymous">
                <style>
                    body {
                        background-color: #f7f7f7;
                        font-family: Arial, sans-serif;
                    }

                    .container {
                        margin-top: 50px;
                    }

                    .card {
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                        border-radius: 10px;
                        padding: 30px;
                        background-color: #ffffff;
                    }

                    .card-header {
                        text-align: center;
                        background-color: #007bff;
                        color: #fff;
                        padding: 15px;
                        border-top-left-radius: 10px;
                        border-top-right-radius: 10px;
                    }

                    .form-label {
                        font-weight: bold;
                    }

                    .btn-primary {
                        background-color: #007bff;
                        border-color: #007bff;
                    }

                    .error {
                        color: red;
                        font-size: 14px;
                    }

                    .logo {
                        display: block;
                        margin-left: auto;
                        margin-right: auto;
                        margin-bottom: 30px;
                        width: 150px;
                    }
                </style>
            </head>

            <body>
                <div class="container d-flex justify-content-center align-items-center">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h3>Đổi mật khẩu</h3>
                            </div>
                            <div class="card-body">
                                <img src="/images/logo/logo.png" alt="Logo" class="logo">

                                <form:form method="post" action="/change-password" modelAttribute="changePasswordDTO">


                                    <form:hidden path="userId" />


                                    <div class="mb-3">
                                        <label class="form-label">Mật khẩu hiện tại</label>
                                        <form:input type="password" class="form-control" path="lastPassword"
                                            placeholder="Vui lòng nhập mật khẩu hiện tại" />
                                        <c:if test="${not empty error}">
                                            <div class="error mt-2">${error}</div>
                                        </c:if>
                                    </div>


                                    <div class="mb-3">
                                        <label class="form-label">Mật khẩu mới</label>
                                        <form:input type="password" class="form-control" path="newPassword"
                                            placeholder="Vui lòng nhập mật khẩu mới" />
                                        <c:if test="${not empty errorNewpassword}">
                                            <div class="error mt-2">${errorNewpassword}</div>
                                        </c:if>
                                    </div>


                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary btn-block">Đổi mật khẩu</button>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
                <jsp:include page="../../client/layout/chat-bot.jsp" />

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>