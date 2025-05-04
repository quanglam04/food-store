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
                    <style>
                        .jq-toast-single {
                            font-size: 16px !important;  
                        }
                     </style>
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
                                        <h4 class="card-title">Quên mật khẩu</h4>
                                        <form:form method="post" action="/send-request-to-mail"
                                            class="my-login-validation" novalidate="">
                                            <div class="form-group">
                                                <label for="email">Địa chỉ E-Mail</label>
                                                <input id="email" type="email" class="form-control" name="email"
                                                    value="" required autofocus placeholder="Nhập địa chỉ E-Mail">
                                                <div class="invalid-feedback">
                                                    Email is invalid
                                                </div>
                                                <div class="form-text text-muted">
                                                    Chúng tôi sẽ gửi một liên kết để đặt lại mật khẩu qua E-mail của
                                                    bạn.
                                                    Vui lòng nhập đúng
                                                    thông tin và làm theo hướng dẫn.
                                                </div>
                                            </div>

                                            <div class="form-group m-0">
                                                <button type="submit" class="btn btn-primary btn-block">
                                                    Xác nhận
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