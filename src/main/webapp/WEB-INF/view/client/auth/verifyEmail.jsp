<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <meta name="author" content="Kodinger">
                <meta name="viewport" content="width=device-width,initial-scale=1">
                <title>My Login Page &mdash; Bootstrap 4 Login Page Snippet</title>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                    crossorigin="anonymous">
                <link rel="stylesheet" type="text/css" href="/client/css/my-login.css">
                <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
                    rel="stylesheet">
            </head>

            <body class="my-login-page">
                <section class="h-100">
                    <div class="container h-100">
                        <div class="row justify-content-md-center h-100">
                            <div class="card-wrapper">
                                <div class="brand">
                                    <img src="/images/logo/logo.png" alt="bootstrap 4 login page">
                                </div>
                                <div class="card fat">
                                    <div class="card-body">
                                        <h4 class="card-title">Xác nhận</h4>
                                        <form:form method="post" action="/register" modelAttribute="userDTO"
                                            class="my-login-validation" novalidate="">

                                            <form:hidden path="email" />
                                            <form:hidden path="fullName" />
                                            <form:hidden path="password" />
                                            <form:hidden path="confirmPassword" />
                                            <form:hidden path="OTP" />

                                            <div class="form-group">
                                                <label for="OTP_check">Mã OTP</label>
                                                <input id="OTP_check" type="text" class="form-control" name="OTP_check"
                                                    placeholder="Vui lòng nhập mã OTP của bạn" value="" required
                                                    autofocus>
                                                <div class="invalid-feedback">
                                                    OTP is invalid
                                                </div>
                                                <c:if test="${not empty errorVerifyEmail}">
                                                    <div class="error mt-2" style="color: red;">${errorVerifyEmail}
                                                    </div>
                                                </c:if>

                                            </div>

                                            <div class="form-group m-0">
                                                <button type="submit" class="btn btn-primary btn-block">
                                                    Đăng ký
                                                </button>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </section>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
                <script
                    src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
                <script src="/client/js/main.js"></script>
            </body>

            </html>