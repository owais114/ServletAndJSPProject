package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Users;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class EditProfileServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();
        HttpSession session = request.getSession();
        Integer id = Integer.parseInt(request.getParameter("user_id"));
        String name = request.getParameter("user_name");
        String email = request.getParameter("user_email");
        String password = request.getParameter("user_password");
        String about = request.getParameter("about");
        Part part = request.getPart("user_image");
        String fileName = part.getName();
        Users users = (Users) session.getAttribute("userDetails");
        users.setId(id);
        users.setName(name);
        users.setEmail(email);
        users.setPassword(password);
        users.setInformation(about);
        users.setProfileImage(fileName);
        UserDao userDao = new UserDao(ConnectionProvider.getConnection());
        boolean success = userDao.updateUser(users);
        if (success) {
            writer.println("Successfully user updated");
        } else {
            writer.println("user not updated");
        }
    }

}
