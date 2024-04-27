package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.Users;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("user_email");
        String password = request.getParameter("user_password");
        HttpSession session = request.getSession();
        UserDao userDao = new UserDao(ConnectionProvider.getConnection());
        Users users = userDao.getUserByEmailAndPassword(email, password);
        if (users != null) {
            session.setAttribute("userDetails", users);
            response.sendRedirect("profile.jsp");
        } else {
            Message message = new Message("something went wrong", "error", "alert-danger");
            session.setAttribute("message", message);
            response.sendRedirect("login_page.jsp");
        }
    }

}
