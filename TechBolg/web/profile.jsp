<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Users"%>

<%
    Users user = (Users) session.getAttribute("userDetails");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    } else {
        PostDao postDao = new PostDao(ConnectionProvider.getConnection());
        ArrayList<Categories> categoryList = postDao.getAllCategories();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <style>
            .list-color{
                background:#311b92!important;
                color:#ffffff!important;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <!--css-->
        <!--font awesome icons link-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!--bootstrap css link-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <!--custom css link-->
        <link rel="stylesheet" href="css/style.css" type="text/css" />
    </head>
    <body>

        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-desktop"></span> Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"><span class="fa fa-graduation-cap"></span> Learn Code With Owais<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-list-alt"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-address-book"></span> Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#addPostModal" ><span class="fa fa-plus"></span> Do Post</a>
                    </li>
                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#exampleModal"><span class="fa fa-user"></span> <%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logoutservlet"><span class="fa fa-user"></span> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!--categories with post section-->
        <div class="container mt-3">
            <div class="row">
                <div class="col-md-4">
                    <div class="list-group mt-2">
                        <a href="#!" onclick="getPosts(0, this)" class="alink list-color list-group-item list-group-item-action" aria-current="true">
                            All Posts
                        </a>
                        <%
                            for (Categories c : categoryList) {
                        %>
                        <a href="#!" onclick="getPosts(<%= c.getId()%>, this)" class="alink list-group-item list-group-item-action"><%= c.getCategory()%></a>
                        <% }%>
                    </div>
                </div>
                <div class="col-md-8">
                    <div id="loader" class="mt-1" style="display:flex;align-items: center;">
                        <div class="spinner-border" style="width: 2rem; height: 2rem;" role="status"></div>
                        <h5 style="padding:10px; padding-top: 13px">Loading....</h5>
                    </div>
                    <div id="posts" class="row" style="display:none;">

                    </div>
                </div>
            </div>
        </div>





        <!--user details modal-->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <h5 class="text-center"><%= user.getName()%></h5>
                            <table class="table" id="profile_details">
                                <tbody>
                                    <tr>
                                        <th scope="row">Id : </th>
                                        <td><%= user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Email : </th>
                                        <td><%= user.getEmail()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Gender : </th>
                                        <td><%= user.getGender()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Status : </th>
                                        <td><%= user.getInformation()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Registered Date : </th>
                                        <td>Registered Date</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div id="edit_profile_details" style="display: none;">
                                <h5>Edit carefully</h5>
                                <!--edit profile form-->
                                <form action="editprofileservlet" method="POST" enctype="multipart/form-data">
                                    <table class="table" id="profile_details">
                                        <tbody>
                                            <tr>
                                                <th scope="row">Username : </th>
                                                <td>
                                                    <input type="hidden" class="form-control" name="user_id"  value="<%= user.getId()%>" />
                                                    <input type="text" class="form-control" name="user_name"  value="<%= user.getName()%>" /></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Email : </th>
                                                <td><input type="email" class="form-control" name="user_email"  value="<%= user.getEmail()%>" /></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Password : </th>
                                                <td><input type="text" class="form-control" name="user_password"  value="<%= user.getPassword()%>" /></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Status : </th>
                                                <td><textarea class="form-control" rows="3" name="about"><%= user.getInformation()%></textarea></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Profile : </th>
                                                <td><input type="file" class="form-control" name="user_image" /></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <button type="submit" class="btn primary-background text-white">Save</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="edit_button" class="btn primary-background text-white">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--add post modal-->
        <div class="modal fade" id="addPostModal" tabindex="-1" aria-labelledby="#exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Add Post</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <form id="postSave" action="savepostservlet" method="POST" enctype="multipart/form-data">
                                <div class="form-group">
                                    <select id="post_category" name="post_category" class="form-control">
                                        <option selected disabled>Choose...</option>
                                        <%
                                            for (Categories c : categoryList) {
                                        %>
                                        <option value="<%= c.getId()%>"><%= c.getCategory()%></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" id="post_title" name="post_title" placeholder="Enter title">
                                </div>
                                <div class="form-group">
                                    <textarea placeholder="Enter content" name="post_content" class="form-control" rows="4"></textarea>
                                </div>
                                <div class="form-group">
                                    <textarea placeholder="Enter code" name="code" class="form-control" rows="4"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Select Blog Image</label>
                                    <input type="file" class="form-control-file" id="post_image" name="post_image">
                                </div>
                                <div class="container text-center">
                                    <button type="submit" class="btn primary-background text-white">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!--javascript--> 
        <!--jquery (ajax based link)-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <!--bootstrap js link-->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
        <!--custom js link-->
        <script src="js/script.js" type="text/javascript"></script>
        <!--jquery code-->
        <script>
                            $(document).ready(function () {
                                let showHide = false;
                                $("#edit_button").click(function () {
                                    if (!showHide) {
                                        $("#profile_details").hide();
                                        $("#edit_profile_details").show();
                                        $("#edit_button").text("Back");
                                        showHide = true;
                                    } else {
                                        $("#profile_details").show();
                                        $("#edit_profile_details").hide();
                                        $("#edit_button").text("Edit");
                                        showHide = false;
                                    }
                                });
                            });
        </script>
        <script>
            $(document).ready(function () {
                $("#postSave").on("submit", function (event) {
                    event.preventDefault();
                    let formData = new FormData(this);
                    $.ajax({
                        url: "savepostservlet",
                        type: "POST",
                        data: formData,
                        success: function (data, textStatus, XMLHttpRequest) {
                            alert("success");
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("failure");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
        <script>
            function getPosts(catId, temp) {
                $("#loader").css("display", "flex");
                $("#posts").hide();
                $(".alink").removeClass("list-color");
                $.ajax({
                    url: "posts.jsp",
                    type: "GET",
                    data: {cId: catId},
                    success: function (data, textStatus, XMLHttpRequest) {
                        $("#loader").hide();
                        $("#posts").show();
                        $("#posts").html(data);
                        $(temp).addClass("list-color");
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        console.log("any error found");
                    }
                });
            }
            $(document).ready(function () {
                let data = $(".alink")[0];
                getPosts(0, data);
            });
        </script>
    </body>
</html>

<% }%>
