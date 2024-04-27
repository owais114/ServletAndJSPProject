<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
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

        <!--login form-->
        <main class="primary-background d-flex align-items-center" style="height:93.8vh;">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-sign-in" style="font-size: 70px;"></span>
                                <h1>Login here</h1>
                            </div>
                            
                            <!--login failed message-->
                            <%
                                Message message = (Message) session.getAttribute("message");
                                if (message != null) {
                            %>
                            <div class="alert <%= message.getCssClass()%> m-2" role="alert">
                                <%= message.getContent()%>
                            </div>
                            <%
                                }
                                session.removeAttribute("message");
                            %>
                            <div class="card-body">
                                <form action="loginservlet" method="POST">
                                    <div class="form-group">
                                        <label for="user_email">Email address</label>
                                        <input type="email" class="form-control" id="user_email" name="user_email" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="user_password">Password</label>
                                        <input type="password" class="form-control" id="user_password" name="user_password" placeholder="Password">
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="checked" name="checked">
                                        <label class="form-check-label" for="checked">Check me out</label>
                                    </div>
                                    <button type="submit" class="btn primary-background text-white mt-2">Submit</button>
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

    </body>
</html>
