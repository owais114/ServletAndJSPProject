<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%
    Thread.sleep(1000);
    Integer cId = Integer.parseInt(request.getParameter("cId"));
    PostDao postDao = new PostDao(ConnectionProvider.getConnection());
    ArrayList<Posts> postList = new ArrayList<>();
    if (cId.equals(0)) {
        postList = postDao.getAllPost();
    } else {
        postList = postDao.getPostsByCatId(cId);
    }
    if (postList.size() == 0) {
        out.println("<h3>No post found related to this category.</h3>");
    }
    for (Posts p : postList) {
%>
<div class="col-md-6 my-2">
    <div class="card">
        <img src="http://codeskulptor-demos.commondatastorage.googleapis.com/GalaxyInvaders/back05.jpg" class="card-img-top" alt="...">
        <div class="card-body">
            <h5 class="card-title"><%= p.getTitle()%></h5>
            <p class="card-text"><%= p.getContent()%></p>
            <p class="card-text">Category: <%= p.getCategoryId()%></p>
            <p class="card-text">Posted by: <%= p.getUserId()%></p>
            <p class="card-text">Date: <%= p.getPostedAt()%></p>
        </div>
        <div class="card-footer  primary-background text-center">
            <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-up"></i> 10</a>
            <a href="show_blog_page.jsp?postId=<%= p.getId()%>" class="btn btn-outline-light btn-sm">Read More...</a>
            <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting"></i> 10</a>
        </div>
    </div>
</div>
<% }%>
