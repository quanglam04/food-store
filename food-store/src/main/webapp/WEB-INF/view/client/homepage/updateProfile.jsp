<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                    crossorigin="anonymous">

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <style>
                    /* Đảm bảo chiều cao tối thiểu của section là 100% chiều cao màn hình */
                    section {
                        height: 100vh;
                    }

                    a :hover {
                        opacity: 0.3;
                    }

                    a {
                        text-decoration: none;
                    }
                </style>

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
            </head>

            <body>
                <section class="bg-light d-flex justify-content-center align-items-center">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8 mb-4 mb-sm-5">
                                <div class="row "
                                    style="width: 15%;margin-right: auto; margin-left: auto; margin-bottom: 70px; ">
                                    <img src="/images/logo/logo.png" alt="">
                                </div>
                                <div class="card card-style1 border-0  ">
                                    <div class="card-body p-1-9 p-sm-2-3 p-md-6 p-lg-7">
                                        <div class="row align-items-center">
                                            <div class="col-lg-6 mb-4 mb-lg-0">

                                                <img src="/images/avatar/${newUser.avatar}" class="img-thumbnail"
                                                    alt="avatar" id="currentAvatar">
                                            </div>

                                            <div class="col-lg-6 px-xl-10">
                                                <div class="d-lg-inline-block py-1-9 px-1-9 px-sm-6 mb-3 rounded">
                                                    <h3 class="h2 text-primary mb-0 ">${user.fullName}</h3>

                                                </div>


                                                <form:form method="post" action="/update-profile"
                                                    modelAttribute="newUser" enctype="multipart/form-data">

                                                    <div class="mb-3" style="display: none;">
                                                        <label class="form-label">Id: </label>
                                                        <form:input type="text" class="form-control" path="id" />
                                                    </div>

                                                    <div class="mb-3">
                                                        <label class="form-label">Email:</label>
                                                        <form:input type="email" class="form-control" path="email"
                                                            disabled="true" />
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Phone :</label>
                                                        <form:input type="text" class="form-control" path="phone" />
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Address:</label>
                                                        <form:input type="text" class="form-control" path="address" />
                                                    </div>


                                                    <!-- Input để chọn file tải lên -->
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <label for="avatarFile" class="form-label">Avatar:</label>
                                                        <input class="form-control" type="file" id="avatarFile"
                                                            accept=".png, .jpg, .jpeg" name="avatarFile" />

                                                    </div>
                                                    <div class="col-12 mb-3">
                                                        <img style="max-height: 250px; display: none;"
                                                            alt="avatar preview" id="avatarPreview" />
                                                    </div>


                                                    <button type="submit" class="btn btn-primary">Update</button>
                                                </form:form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </section>
                <script src="/js/scripts.js"></script>
            </body>

            </html>