<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <meta name="author" content="Kodinger">
                <meta name="viewport" content="width=device-width,initial-scale=1">
                <title>My Login Page</title>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                    crossorigin="anonymous">
                <link rel="stylesheet" type="text/css" href="/client/css/my-login.css">
            </head>

            <body class="my-login-page">
                <section class="h-100">
                    <div class="container h-100">
                        <div class="row justify-content-md-center h-100">
                            <div class="card-wrapper">
                                <div class="brand">
                                    <img src="/images/logo/logo.png" alt="logo">
                                </div>
                                <div class="card fat">
                                    <div class="card-body">
                                        <h4 class="card-title">Đăng nhập</h4>
                                        <form method="POST" action="/login" class="my-login-validation" novalidate="">
                                            <c:if test="${param.error != null}">
                                                <div class="my-2" style="color: red;">Thông tin đăng nhập không hợp lệ
                                                </div>
                                            </c:if>

                                            <c:if test="${param.logout != null}">
                                                <div class="my-2" style="color: green;">Đăng xuất thành công</div>
                                            </c:if>

                                            <div class="form-group">
                                                <label for="email">Tài khoản đăng nhập</label>
                                                <input id="email" type="email" class="form-control" name="username"
                                                    value="" required autofocus placeholder="Nhập địa chỉ E-Mail">
                                                <div class="invalid-feedback">
                                                    Email is invalid
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="password">Mật khẩu
                                                    <a href="/password" class="float-right">
                                                        Quên mật khẩu?
                                                    </a>
                                                </label>
                                                <input id="password" type="password" class="form-control"
                                                    name="password" required data-eye placeholder="Nhập mật khẩu">
                                                <div class="invalid-feedback">
                                                    Password is required
                                                </div>
                                            </div>

                                            <div>
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />


                                            </div>



                                            <div class="form-group m-0">
                                                <button type="submit" class="btn btn-primary btn-block">
                                                    Đăng nhập
                                                </button>
                                            </div>
                                        </form>

                                        <div>
                                            <div style="text-align: center;margin-top: 15px;"><span
                                                    style="font-weight: bold;">Hoặc sử dụng</span></div>
                                            <div class="d-flex justify-content-center align-items-center my-3"
                                                style="gap: 20px">
                                                <a href="/oauth2/authorization/google" title="Đăng nhập với Google">
                                                    <img height="40" width="40"
                                                        src="/client/img/provider/default-google.png" />
                                                </a>
                                                <a href="/oauth2/authorization/github" title="Đăng nhập với Github">
                                                    <img height="40" width="40"
                                                        src="/client/img/provider/default-github.png" />
                                                </a>
                                            </div>
                                        </div>
                                        <div class="mt-4 text-center">
                                            Bạn chưa có tài khoản? <a href="/register">Đăng ký</a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </section>

                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                    crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
                    crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                    crossorigin="anonymous"></script>
                <script src="js/my-login.js"></script>
            </body>

            </html>