<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" />
                <meta name="author" />
                <title>Tạo sản phẩm</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Sản phẩm</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Bảng điều khiển</a></li>
                                    <li class="breadcrumb-item active"><a href="/admin/product">Sản phẩm</a></li>
                                    <li class="breadcrumb-item active">Tạo sản phẩm</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Tạo 1 sản phẩm</h3>
                                            <hr />
                                            <form:form method="post" action="/admin/product/create" class="row"
                                                enctype="multipart/form-data" modelAttribute="newPrd">

                                                <c:set var="errorName">
                                                    <form:errors path="name" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="errorPrice">
                                                    <form:errors path="price" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="errorDetailDesc">
                                                    <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="errorShortDesc">
                                                    <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="errorQuantity">
                                                    <form:errors path="quantity" cssClass="invalid-feedback" />
                                                </c:set>


                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Tên:</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                                                        path="name" />
                                                    ${errorName}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Giá:</label>
                                                    <form:input type="number"
                                                        class="form-control ${not empty errorPrice ? 'is-invalid' : ''}"
                                                        path="price" />
                                                    ${errorPrice}
                                                </div>
                                                <div class="mb-3 col-12">
                                                    <label class="form-label">Miêu tả chi tiết:</label>
                                                    <form:textarea type="text"
                                                        class="form-control ${not empty errorDetailDesc ? 'is-invalid' : ''}"
                                                        path="detailDesc" />
                                                    ${errorDetailDesc}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Miêu tả ngắn gọn:</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorShortDesc ? 'is-invalid' : ''}"
                                                        path="shortDesc" />
                                                    ${errorShortDesc}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Số lượng:</label>
                                                    <form:input type="number"
                                                        class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}"
                                                        path="quantity" />
                                                    ${errorQuantity}
                                                </div>



                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Mục tiêu:</label>
                                                    <form:select class="form-select" path="target">
                                                        <form:option value="giam-can">Giảm cân</form:option>
                                                        <form:option value="tang-chieu-cao">Tăng chiều cao
                                                        </form:option>
                                                        <form:option value="tang-co">Tăng cơ
                                                        </form:option>
                                                        <form:option value="tang-can">Tăng cân</form:option>

                                                    </form:select>
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Đối tượng khách hàng:</label>
                                                    <form:select class="form-select" path="customerTarget">
                                                        <form:option value="dan-van-phong">Dành cho dân văn phòng
                                                        </form:option>
                                                        <form:option value="tap-the-hinh">Dành cho dân tập thể
                                                            hình
                                                        </form:option>
                                                        <form:option value="be-duoi-1-tuoi">Dành cho bé dưới 1 tuổi
                                                        </form:option>
                                                        <form:option value="phu-nu-co-thai">Dành cho phụ nữ có thai
                                                        </form:option>
                                                        <form:option value="nguoi-an-kieng">Dành cho người ăn kiêng
                                                        </form:option>
                                                        <form:option value="tat-ca">Tất cả
                                                        </form:option>

                                                    </form:select>
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Loại:</label>
                                                    <form:select class="form-select" path="type">
                                                        <form:option value="rau">Rau</form:option>
                                                        <form:option value="cu">Củ
                                                        </form:option>
                                                        <form:option value="thuc-pham-giau-protein">Thực phẩm giàu
                                                            protein
                                                        </form:option>

                                                        <form:option value="thuc-pham-chua-tinh-bot">Thực phẩm chứa
                                                            tinh bột
                                                        </form:option>
                                                        <form:option value="trai-cay">Trái cây</form:option>
                                                        <form:option value="thuc-uong">Thức uống</form:option>

                                                    </form:select>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="avatarFile" class="form-label">Ảnh:</label>
                                                    <input class="form-control" type="file" id="avatarFile"
                                                        accept=".png, .jpg, .jpeg" name="productFile" required="true" />
                                                </div>
                                                <div class="col-12 mb-3">
                                                    <img style="max-height: 250px; display: none;" alt="avatar preview"
                                                        id="avatarPreview" />
                                                </div>
                                                <div class="col-12 mb-5">
                                                    <button type="submit" class="btn btn-primary">Tạo</button>
                                                </div>
                                            </form:form>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>

            </body>

            </html>