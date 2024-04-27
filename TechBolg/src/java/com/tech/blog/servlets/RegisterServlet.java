package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Users;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class RegisterServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String checked = request.getParameter("checked");

        if (checked != null) {
            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            String gender = request.getParameter("gender");
            String description = request.getParameter("user_description");

            Users users = new Users(name, email, password, description, gender, "profile_image.jpg");
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            boolean flag = userDao.saveUser(users);

            if (flag) {
                out.println("done");
            } else {
                out.println("error found..");
            }
        } else {
            out.println("not accept terms and conditions");
        }

    }
}
