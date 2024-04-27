<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <!--css-->
        <!--font awesome icons link-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!--bootstrap css link-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <!--custom css link-->
        <link rel="stylesheet" href="css/style.css" type="text/css" />
    </head>
    <body>

        <!--header-->
        <%@include file="normal_navbar.jsp" %>

        <!--register form-->
        <main class="primary-background d-flex align-items-center" style="height:93.8vh;">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user display-4"></span>
                                <h1>Register here</h1>
                            </div>
                            <div class="card-body">
                                <form action="registerservlet" method="POST" id="register_form">
                                    <div class="form-group">
                                        <label for="user_name">Username</label>
                                        <input type="text" class="form-control" id="user_name" name="user_name" placeholder="Enter name">
                                    </div>
                                    <div class="form-group">
                                        <label for="user_email">Email address</label>
                                        <input type="email" class="form-control" id="user_email" name="user_email" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="user_password">Password</label>
                                        <input type="password" class="form-control" id="user_password" name="user_password" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <label for="gender">Select gender</label>
                                        <div class="form-check form-check-inline ml-3">
                                            <input class="form-check-input" type="radio" name="gender" id="male" value="Male">
                                            <label class="form-check-label" for="gender">Male</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input primary" type="radio" name="gender" id="female" value="Female">
                                            <label class="form-check-label" for="gender">Female</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <textarea class="form-control" id="user_description" name="user_description" rows="3" placeholder="Enter something about yourself"></textarea>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" name="checked" id="checked">
                                        <label class="form-check-label" for="checked">agree terms and conditions</label>
                                    </div>
                                    <div id="loader" style="display:none;align-items: center;">
                                        <div class="spinner-border" style="width: 2rem; height: 2rem;" role="status"></div>
                                        <h5 style="padding:10px; padding-top: 13px">Loading....</h5>
                                    </div>
                                    <button type="submit" id="submitButton" class="btn primary-background text-white mt-2">Submit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!--javascript--> 
        <!--jquery (ajax based link)-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <!--bootstrap js link-->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
        <!--custom js link-->
        <script src="js/script.js" type="text/javascript"></script>
        <!--sweet alert-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <script>
            $(document).ready(function () {
                console.log("jquery loaded");
                $("#register_form").on("submit", function (event) {
                    event.preventDefault();
                    let formData = new FormData(this);
                    $("#loader").css("display", "flex");
                    $("#submitButton").hide();
                    $.ajax({
                        url: "registerservlet",
                        type: "POST",
                        data: formData,
                        success: function (data, textStatus, XMLHttpRequest) {
                            $("#loader").css("display", "none");
                            $("#submitButton").show();
                            if (data.trim() == "done") {
                                swal("Registered successfully. We are going to redirect to login page")
                                        .then((value) => {
                                            window.location = "login_page.jsp";
                                        });
                            } else {
                                swal(data);
                            }
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            console.log(XMLHttpRequest);
                            $("#loader").css("display", "none");
                            $("#submitButton").show();
                            swal("something went wrong..try again");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });

        </script>

    </body>
</html>
