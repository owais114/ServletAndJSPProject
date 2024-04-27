package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Posts;
import com.tech.blog.entities.Users;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@MultipartConfig
public class SavePostServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("userDetails");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String postTitle = request.getParameter("post_title");
        String postContent = request.getParameter("post_content");
        String code = request.getParameter("code");
        Integer userId = user.getId();
        Integer categoryId = Integer.parseInt(request.getParameter("post_category"));

        Posts post = new Posts();
        post.setTitle(postTitle);
        post.setContent(postContent);
        post.setCode(code);
        post.setUserId(userId);
        post.setCategoryId(categoryId);

        PostDao postDao = new PostDao(ConnectionProvider.getConnection());
        boolean flag = postDao.savePost(post);
        if (flag) {
            out.println("success");
        } else {
            out.println("failure");
        }
    }

}
