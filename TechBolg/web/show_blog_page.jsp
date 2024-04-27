<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Integer postId = Integer.parseInt(request.getParameter("postId"));
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Content Page</title>
    </head>
    <body>
        <h1>This is the blog content page</h1>
        <h2>Post Id is : <%= postId%></h2>
    </body>
</html>
