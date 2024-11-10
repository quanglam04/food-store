<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Dashboard</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <style>
                    /* Thêm một số kiểu CSS để làm đẹp hơn */
                    body {
                        background-color: #f8f9fa;
                    }

                    .card {
                        border-radius: 8px;
                        transition: transform 0.2s;
                    }

                    .card:hover {
                        transform: scale(1.05);
                    }

                    .breadcrumb {
                        background-color: #ffffff;
                        border-radius: 5px;
                        padding: 10px;
                        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                    }

                    h1 {
                        font-weight: 600;
                        color: #343a40;
                    }

                    .card-body {
                        font-size: 1.2rem;
                        font-weight: bold;
                    }

                    .footer-link {
                        text-decoration: none;
                        font-weight: 600;
                        color: #ffffff;
                    }

                    .footer-link:hover {
                        text-decoration: underline;
                    }
                </style>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />

                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />

                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Dashboard</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active">Dashboard</li>
                                </ol>
                                <div class="row">
                                    <div class="col-xl-4 col-md-6 mb-4">
                                        <div class="card bg-primary text-white">
                                            <div class="card-body">Số lượng User: (${countUser})</div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <a class="small footer-link" href="/admin/user">View Details</a>
                                                <div class="small"><i class="fas fa-angle-right"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-md-6 mb-4">
                                        <div class="card bg-danger text-white">
                                            <div class="card-body">Số lượng đơn hàng: (${countOrder})</div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <a class="small footer-link" href="/admin/order">View Details</a>
                                                <div class="small"><i class="fas fa-angle-right"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-md-6 mb-4">
                                        <div class="card bg-success text-white">
                                            <div class="card-body">Số lượng sản phẩm: (${countProduct})</div>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <a class="small footer-link" href="/admin/product">View Details</a>
                                                <div class="small"><i class="fas fa-angle-right"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/chart-area-demo.js"></script>
                <script src="js/chart-bar-demo.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/datatables-simple-demo.js"></script>
            </body>

            </html>